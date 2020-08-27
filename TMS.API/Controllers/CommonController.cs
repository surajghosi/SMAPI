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
using TMS.API.Helpers;
using TMS.API.Models.Common;
using TMS.Dapper.Infrastructure;
using TMS.Dapper.Interface;
using TMS.Dapper.UnitOfWork;

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
    }
}