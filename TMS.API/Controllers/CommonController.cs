using System;
using System.Security.Claims;
using System.Threading.Tasks;
using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using TMS.API.Common;
using TMS.API.Models.AdavnceLeadCreator;
using TMS.API.Models.Common;
using TMS.Dapper.Infrastructure;
using TMS.Dapper.UnitOfWork;
using TMS.DataEntities.AdvanceLeadCreatorDTO;

namespace TMS.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CommonController : ControllerBase
    {
        
        private readonly IOptions<TMSConfiguration> _configs;
        public CommonController(IOptions<TMSConfiguration> Configs)
        {
            _configs = Configs;

        }
        [Authorize]
        [HttpGet("UserRole")]
        public async Task<IActionResult> UserRole()
        {
            try
            {
                ClaimsIdentity claimsIdentity = HttpContext.User.Identity as ClaimsIdentity;
                Guid OrgId = new UserClaims(claimsIdentity).OrgId;
                using (var uow = new UnitOfWork(_configs.Value.DbConnectionString))
                {
                    var result = await uow.Common.GetAllRole(OrgId);
                    return Ok(new ApiResponse { data = result });
                }
                
            }
            catch (Exception ex)
            {
                return BadRequest(new ApiResponse { message = ApiMessageConstants.someThingWentWrong, data= ex.Message });
            }
            

        }

        [Authorize]
        [HttpGet("updateLeadDetails")]
        public async Task<IActionResult> updateLeadDetails([FromBody]LeadModel obj)
        {
            try
            {
                if (ModelState.IsValid)
                {

                    ClaimsIdentity claimsIdentity = User.Identity as ClaimsIdentity;
                    var currentLoginUserid = new UserClaims(claimsIdentity).LoggedInUserId;
                    var config = new MapperConfiguration(cfg =>
                    {
                        cfg.CreateMap<LeadModel, LeadInfoDTO>();
                    });


                    obj.createdBy = currentLoginUserid;
                    IMapper mapperResponse = config.CreateMapper();
                    var leadDTO = mapperResponse.Map<LeadModel, LeadInfoDTO>(obj);
                    using (var uow = new UnitOfWork(_configs.Value.DbConnectionString))
                    {
                        await uow.Common.updateLeadDetailsAsync(leadDTO);
                       
                    }
                    if (obj.updateFlag == 4)
                    {
                        return Ok(new ApiResponse { message = ApiMessageConstants.commonDeleted });
                    } else
                    {
                        return Ok(new ApiResponse { message = ApiMessageConstants.commonUpdated });
                    }
                   
                }
                else
                {
                    return BadRequest(new ApiResponse { message = ApiMessageConstants.someThingWentWrong });
                }

            }
            catch (Exception ex)
            {
                return BadRequest(new ApiResponse { message = ApiMessageConstants.someThingWentWrong, data = ex.Message });
            }


        }
    }
}