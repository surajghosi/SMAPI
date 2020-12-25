using System;
using System.Security.Claims;
using System.Threading.Tasks;
using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using TMS.API.Common;
using TMS.API.Models.Common;
using TMS.API.Models.ManageLeadAccessModel;
using TMS.Dapper.Infrastructure;
using TMS.Dapper.UnitOfWork;
using TMS.DataEntities.ManageLeadAccessDTO;

namespace TMS.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LeadAccessController : ControllerBase
    {
        private readonly IOptions<TMSConfiguration> _configs;
        public LeadAccessController(IOptions<TMSConfiguration> Configs)
        {
            _configs = Configs;

        }

        [Authorize]
        [HttpPost("AddLeadAccess")]
        public async Task<IActionResult> AddLeadAccess([FromBody]LeadAccessModel obj)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    ClaimsIdentity claimsIdentity = User.Identity as ClaimsIdentity;
                    var currentLoginUserid = new UserClaims(claimsIdentity).LoggedInUserId;
                    var config = new MapperConfiguration(cfg =>
                    {
                        cfg.CreateMap<LeadAccessModel, LeadAccessDTO>();
                    });


                    obj.createdBy = currentLoginUserid;
                    IMapper mapperResponse = config.CreateMapper();
                    var leadAccessDTO = mapperResponse.Map<LeadAccessModel, LeadAccessDTO>(obj);
                    using (var uow = new UnitOfWork(_configs.Value.DbConnectionString))
                    {
                        string result = await uow.ManageLeadAccess.addLeadAccessAsync(leadAccessDTO);
                        uow.Commit();
                        if(result=="")
                        {
                            return BadRequest(new ApiResponse { message = ApiMessageConstants.leadAlreadyAssign });
                        } else
                        {
                            return Ok(new ApiResponse { message = ApiMessageConstants.commonAdded, data = result });
                        }
                        

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
        [HttpPost("DeleteLeadAccess")]
        public async Task<IActionResult> DeleteLeadAccess(LeadAccessModel obj)
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
                        await uow.ManageLeadAccess.deleteLeadAccessAsync(obj.accessID, obj.createdBy);
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
        [HttpGet("AllLeadAccess")]
        public async Task<IActionResult> AllLeadAccess(Guid leadId)
        {
            try
            {
                if (Convert.ToString(leadId) != string.Empty)
                {

                    using (var uow = new UnitOfWork(_configs.Value.DbConnectionString))
                    {
                        var result = await uow.ManageLeadAccess.getAllLeadAccessAsync(leadId);
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