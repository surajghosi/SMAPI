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
using TMS.Dapper.Infrastructure;
using TMS.Dapper.UnitOfWork;
using TMS.DataEntities.PipeLineDTO;

namespace TMS.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PipeLineController : ControllerBase
    {
        private readonly IOptions<TMSConfiguration> _configs;
        public PipeLineController(IOptions<TMSConfiguration> Configs)
        {
            _configs = Configs;

        }

        /// <summary>
        /// Add and update pipeLine
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        [Authorize]
        [HttpPost("AddPipeLine")]
        public async Task<IActionResult> AddPipeLine([FromBody]PipeLineModel obj)
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
                        cfg.CreateMap<PipeLineModel, PipeLineDTO>();
                    });

                    obj.OrgId = currentLoginUserOrgid;
                    obj.CreatedBy = currentLoginUserid;
                    IMapper mapperResponse = config.CreateMapper();
                    var pipelineDTO = mapperResponse.Map<PipeLineModel, PipeLineDTO>(obj);
                    using (var uow = new UnitOfWork(_configs.Value.DbConnectionString))
                    {
                        int result = await uow.PipeLine.AddUpdatePipeLine(pipelineDTO);
                        uow.Commit();
                        if (result == 1)
                        {
                            return BadRequest(new ApiResponse { message = ApiMessageConstants.pipeAlreadyExists });
                        }
                        else if (result == 3)
                        {
                            return Ok(new ApiResponse { message = ApiMessageConstants.pipeUpdated });
                        }
                       
                        return Ok(new ApiResponse { message = ApiMessageConstants.pipeAdded, data = result });

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

        /// <summary>
        /// Get All PipeLine
        /// </summary>
        /// <param name="pageNumber"></param>
        /// <param name="pageSize"></param>
        /// <returns></returns>
        [Authorize]
        [HttpGet("GetAllPipeLine")]
        public async Task<IActionResult> GetAllPipeLine(int pageNumber, int pageSize)
        {
            try
            {
                ClaimsIdentity claimsIdentity = User.Identity as ClaimsIdentity;
                var currentLoginUserOrgid = new UserClaims(claimsIdentity).OrgId;
                using (var uow = new UnitOfWork(_configs.Value.DbConnectionString))
                {
                    var result = await uow.PipeLine.PipeLineList(currentLoginUserOrgid);
                    return Ok(new ApiResponse { data = result });
                }



            }
            catch (Exception ex)
            {
                return BadRequest(new ApiResponse { message = ex.Message });
            }



        }

        [Authorize]
        [HttpGet("GetPipeLineById")]
        public async Task<IActionResult> GetPipeLineById(Guid pipeLineId)
        {
            try
            {

                using (var uow = new UnitOfWork(_configs.Value.DbConnectionString))
                {
                    var result = await uow.PipeLine.PipeLineDetailsById(pipeLineId);
                    return Ok(new ApiResponse { data = result });
                }

            }
            catch (Exception ex)
            {
                return BadRequest(new ApiResponse { message = ex.Message });
            }



        }

        [Authorize]
        [HttpDelete("DeletePipeLine")]
        public async Task<IActionResult> DeletePipeLine(Guid pipeLineId)
        {
            try
            {
                using (var uow = new UnitOfWork(_configs.Value.DbConnectionString))
                {
                    await uow.PipeLine.DeletePipeLine(pipeLineId);
                    uow.Commit();
                    return Ok(new ApiResponse { message = ApiMessageConstants.userDelete });
                }

            }
            catch (Exception ex)
            {
                return BadRequest(new ApiResponse { message = ex.Message });
            }



        }
    }
}