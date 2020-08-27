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

        [Authorize]
        [HttpPost("AddUser")]
        public async Task<IActionResult> AddUser([FromBody]PipeLineModel obj)
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
    }
}