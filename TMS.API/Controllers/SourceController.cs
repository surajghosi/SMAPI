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
using TMS.API.Models.Common;
using TMS.API.Models.SourceModel;
using TMS.Dapper.Infrastructure;
using TMS.Dapper.UnitOfWork;
using TMS.DataEntities.SourceDTO;

namespace TMS.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SourceController : ControllerBase
    {
        private readonly IOptions<TMSConfiguration> _configs;
        public SourceController(IOptions<TMSConfiguration> Configs)
        {
            _configs = Configs;

        }

        [Authorize]
        [HttpPost("AddSource")]
        public async Task<IActionResult> AddSource([FromBody]SourceModel obj)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    ClaimsIdentity claimsIdentity = User.Identity as ClaimsIdentity;
                    var currentLoginUserid = new UserClaims(claimsIdentity).LoggedInUserId;
                    var config = new MapperConfiguration(cfg =>
                    {
                        cfg.CreateMap<SourceModel, SourceDTO>();
                    });


                    obj.createdBy = currentLoginUserid;
                    IMapper mapperResponse = config.CreateMapper();
                    var sourceDTO = mapperResponse.Map<SourceModel, SourceDTO>(obj);
                    using (var uow = new UnitOfWork(_configs.Value.DbConnectionString))
                    {
                        string result = await uow.Source.AddSourceAsync(sourceDTO);
                        uow.Commit();
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
        [HttpPost("DeleteSource")]
        public async Task<IActionResult> DeleteNotes(SourceModel obj)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    ClaimsIdentity claimsIdentity = User.Identity as ClaimsIdentity;
                    var currentLoginUserid = new UserClaims(claimsIdentity).LoggedInUserId;
                    var currentLoginUserOrgid = new UserClaims(claimsIdentity).OrgId;
                    obj.createdBy = currentLoginUserid;
                    using (var uow = new UnitOfWork(_configs.Value.DbConnectionString))
                    {
                        await uow.Source.DeleteSourceAsync(obj.sourceId, obj.createdBy);
                        uow.Commit();
                        return Ok(new ApiResponse { message = ApiMessageConstants.commonDeleted });
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
        [HttpGet("AllSource")]
        public async Task<IActionResult> AllSource(Guid leadId)
        {
            try
            {
                if (Convert.ToString(leadId) != string.Empty)
                {

                    using (var uow = new UnitOfWork(_configs.Value.DbConnectionString))
                    {
                        var result = await uow.Source.getAllSourceAsync(leadId);
                        return Ok(new ApiResponse { data = result });
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