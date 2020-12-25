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
using TMS.API.Models.ContactModel;
using TMS.Dapper.Infrastructure;
using TMS.Dapper.UnitOfWork;
using TMS.DataEntities.ContactDTO;

namespace TMS.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ContactController : ControllerBase
    {
        private readonly IOptions<TMSConfiguration> _configs;
        public ContactController(IOptions<TMSConfiguration> Configs)
        {
            _configs = Configs;

        }
        [Authorize]
        [HttpPost("AddContact")]
        public async Task<IActionResult> AddContact([FromBody]ContactModel obj)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    ClaimsIdentity claimsIdentity = User.Identity as ClaimsIdentity;
                    var currentLoginUserid = new UserClaims(claimsIdentity).LoggedInUserId;
                    var config = new MapperConfiguration(cfg =>
                    {
                        cfg.CreateMap<ContactModel, ContactDTO>();
                    });


                    obj.createdBy = currentLoginUserid;
                    IMapper mapperResponse = config.CreateMapper();
                    var contactDTO = mapperResponse.Map<ContactModel, ContactDTO>(obj);
                    using (var uow = new UnitOfWork(_configs.Value.DbConnectionString))
                    {
                        string result = await uow.Contact.AddContactDetails(contactDTO);
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
        [HttpPost("DeleteContact")]
        public async Task<IActionResult> DeleteContact(ContactModel obj)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    ClaimsIdentity claimsIdentity = User.Identity as ClaimsIdentity;
                    var currentLoginUserid = new UserClaims(claimsIdentity).LoggedInUserId;
                    var currentLoginUserOrgid = new UserClaims(claimsIdentity).OrgId;
                    


                    using (var uow = new UnitOfWork(_configs.Value.DbConnectionString))
                    {
                        await uow.Contact.DeleteContact(obj.contactId, currentLoginUserid);
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
        [HttpGet("AllContact")]
        public async Task<IActionResult> AllContact(Guid leadId)
        {
            try
            {
                if (Convert.ToString(leadId) != string.Empty)
                {

                    using (var uow = new UnitOfWork(_configs.Value.DbConnectionString))
                    {
                        var result = await uow.Contact.GetContactDetailsByIdAsync(leadId);
                        return Ok(new ApiResponse { data= result });
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