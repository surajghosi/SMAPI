using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using TMS.API.Common;
using TMS.API.Models;
using TMS.API.Models.Common;
using TMS.API.Models.StageModel;
using TMS.Dapper.Infrastructure;
using TMS.Dapper.UnitOfWork;
using TMS.DataEntities.StageDTO;


namespace TMS.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class StageController : ControllerBase
    {
        private readonly IOptions<TMSConfiguration> _configs;
        public StageController(IOptions<TMSConfiguration> Configs)
        {
            _configs = Configs;

        }
       
        [Authorize]
        [HttpPost("AddStage")]
        public async Task<IActionResult> AddStage([FromBody]StageModel obj)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    ClaimsIdentity claimsIdentity = User.Identity as ClaimsIdentity;
                    var currentLoginUserid = new UserClaims(claimsIdentity).LoggedInUserId;
                    var currentLoginUserOrgid = new UserClaims(claimsIdentity).OrgId;
                    var config = new MapperConfiguration(cfg =>
                    {
                        cfg.CreateMap<StageModel, StageDTO>();
                    });

                    
                    obj.createdBy = currentLoginUserid;
                    IMapper mapperResponse = config.CreateMapper();
                    var stageDTO = mapperResponse.Map<StageModel, StageDTO>(obj);
                    using (var uow = new UnitOfWork(_configs.Value.DbConnectionString))
                    {
                        int result = await uow.Stage.AddUpdateStage(stageDTO);
                        uow.Commit();
                        if (result == 1)
                        {
                            return BadRequest(new ApiResponse { message = ApiMessageConstants.stageAlreadyExists });
                        }
                        else if (result == 3)
                        {
                            return Ok(new ApiResponse { message = ApiMessageConstants.commonUpdated });
                        }

                        return Ok(new ApiResponse { message = ApiMessageConstants.commonAdded, data = result });

                    }

                }
                else
                {
                    return BadRequest(new ApiResponse { message = ApiMessageConstants.someThingWentWrong });
                }
            }
            catch (Exception ex)
            {
                return BadRequest(new ApiResponse { message = ex.Message });
            }

        }

      
        [Authorize]
        [HttpGet("GetAllStage")]
        public async Task<IActionResult> GetAllStage(Guid pipeId,int pageNumber, int pageSize)
        {
            try
            {
                using (var uow = new UnitOfWork(_configs.Value.DbConnectionString))
                {
                    var result = await uow.Stage.StageList(pipeId);
                    return Ok(new ApiResponse { data = result });
                }



            }
            catch (Exception ex)
            {
                return BadRequest(new ApiResponse { message = ex.Message });
            }



        }

        [Authorize]
        [HttpGet("GetStageById")]
        public async Task<IActionResult> GetStageById(Guid stageId)
        {
            try
            {

                using (var uow = new UnitOfWork(_configs.Value.DbConnectionString))
                {
                    var result = await uow.Stage.StageDetailsById(stageId);
                    return Ok(new ApiResponse { data = result });
                }

            }
            catch (Exception ex)
            {
                return BadRequest(new ApiResponse { message = ex.Message });
            }



        }

        [Authorize]
        [HttpDelete("DeleteStage")]
        public async Task<IActionResult> DeleteStage(Guid stageId)
        {
            try
            {
                using (var uow = new UnitOfWork(_configs.Value.DbConnectionString))
                {
                    await uow.Stage.DeleteStage(stageId);
                    uow.Commit();
                    return Ok(new ApiResponse { message = ApiMessageConstants.userDelete });
                }

            }
            catch (Exception ex)
            {
                return BadRequest(new ApiResponse { message = ex.Message });
            }

        }

        [Authorize]
        [HttpPost("UpdateStageSequence")]
        public async Task<IActionResult> UpdateStageSequence([FromBody]List<StageModel> objStageModel)
        {
            try
            {
                using (var uow = new UnitOfWork(_configs.Value.DbConnectionString))
                {
                    foreach(var stage in objStageModel)
                    {
                        await uow.Stage.UdpateStage(stage.stageId,stage.sequenceNumber);
                    }
                    
                    uow.Commit();
                    return Ok(new ApiResponse { message = ApiMessageConstants.commonUpdated });
                }

            }
            catch (Exception ex)
            {
                return BadRequest(new ApiResponse { message = ex.Message });
            }

        }
    }
}