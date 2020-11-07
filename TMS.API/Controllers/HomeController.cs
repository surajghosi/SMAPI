using System;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using TMS.API.Common;
using TMS.Dapper.Interface;

namespace TMS.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HomeController : ControllerBase
    {
        private IUser _userService;
       
        public HomeController(IUser userService)
        {
            _userService = userService;
            


        }

        [Authorize]
        [HttpGet("GetAllUser")]
        public async Task<IActionResult> GetAllUser()
        {
            try
            {
                ClaimsIdentity claimsIdentity = User.Identity as ClaimsIdentity;
                var logid = new UserClaims(claimsIdentity).LoggedInUserId;
                var result = await _userService.GetAll();
                return Ok(result);
            }
            catch (Exception ex)
            {
                throw ex;
            }


        }

    }
}