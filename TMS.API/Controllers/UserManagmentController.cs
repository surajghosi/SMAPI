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
using TMS.API.Models.UserManagementModel;
using TMS.Dapper.Infrastructure;
using TMS.Dapper.Interface;
using TMS.Dapper.UnitOfWork;
using TMS.DataEntities.UserManagementDTO;

namespace TMS.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserManagmentController : ControllerBase
    {
        private readonly IOptions<TMSConfiguration> _configs;
        public UserManagmentController(IOptions<TMSConfiguration> Configs)
        {
            _configs = Configs;

        }
        [Authorize]
        [HttpPost("AddUser")]
        public async Task<IActionResult> AddUser([FromBody]User objUser)
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
                        cfg.CreateMap<User, UserDTO>();
                    });
                    objUser.password = new EncryptAndDecrypt().Encrypt(objUser.password);
                    objUser.orgId = currentLoginUserOrgid;
                    objUser.createdBy = currentLoginUserid;
                    IMapper mapperResponse = config.CreateMapper();
                    var registrationDTO = mapperResponse.Map<User, UserDTO>(objUser);
                    using (var uow = new UnitOfWork(_configs.Value.DbConnectionString))
                    {
                        int result = await uow.UserManagement.AddUpdateUser(registrationDTO);
                        uow.Commit();
                        if (result == 1)
                        {
                            return BadRequest(new ApiResponse { message = ApiMessageConstants.emailAlreadyExists });
                        }
                        else if (result == 3)
                        {
                            return Ok(new ApiResponse { message = ApiMessageConstants.updateUserSuccessfully });
                        }
                        return Ok(new ApiResponse { message = ApiMessageConstants.userAddedSuccessfully, data = result });

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
        [HttpGet("GetAllUser")]
        public async Task<IActionResult> GetAllUser(int pageNumber, int pageSize)
        {
            try
            {
                ClaimsIdentity claimsIdentity = User.Identity as ClaimsIdentity;
                var currentLoginUserOrgid = new UserClaims(claimsIdentity).OrgId;
                using (var uow = new UnitOfWork(_configs.Value.DbConnectionString))
                {
                    var result = await uow.UserManagement.GetAllUser(currentLoginUserOrgid, pageNumber, pageSize);
                    return Ok(new ApiResponse { data = result });
                }



            }
            catch (Exception ex)
            {
                return BadRequest(new ApiResponse { message = ex.Message });
            }



        }

        [Authorize]
        [HttpGet("GetUserById")]
        public async Task<IActionResult> GetUserById(Guid userId)
        {
            try
            {

                using (var uow = new UnitOfWork(_configs.Value.DbConnectionString))
                {
                    var result = await uow.UserManagement.GetUserById(userId);
                    result.password = new EncryptAndDecrypt().Decrypt(result.password);
                    return Ok(new ApiResponse { data = result });
                }
                
            }
            catch (Exception ex)
            {
                return BadRequest(new ApiResponse { message = ex.Message });
            }



        }

        [Authorize]
        [HttpDelete("DeleteUser")]
        public async Task<IActionResult> DeleteUser(Guid userId)
        {
            try
            {
                using (var uow = new UnitOfWork(_configs.Value.DbConnectionString))
                {
                    await uow.UserManagement.DeleteUser(userId);
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