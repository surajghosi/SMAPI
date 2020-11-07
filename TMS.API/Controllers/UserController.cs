using System;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using TMS.API.Helpers;
using TMS.API.Models;
using TMS.API.Models.Common;
using TMS.Dapper.Infrastructure;
using TMS.Dapper.UnitOfWork;
using TMS.DataEntities.Users;

namespace TMS.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        // private IUser _userService;
        private readonly AppSettings _appSettings;

        private readonly IOptions<TMSConfiguration> _configs;
        public UserController(IOptions<TMSConfiguration> Configs,IOptions<AppSettings> appSeetings)
        {
            _configs = Configs;
            _appSettings = appSeetings.Value;

        }
        [AllowAnonymous]
        [HttpPost("authenticate")]
        public async Task<IActionResult> Authenticate([FromBody]AuthenticateModel model)
        {
            if (ModelState.IsValid)
            {
                model.password = new EncryptAndDecrypt().Encrypt(model.password);
                using (var uow = new UnitOfWork(_configs.Value.DbConnectionString))
                {
                    var user = await uow.User.Authenticate(model.userName, model.password);

                    if (user == null)
                        return BadRequest(new ApiResponse { message = ApiMessageConstants.wrongUserNameAndPassword });


                    var tokenHandler = new JwtSecurityTokenHandler();

                    var key = Encoding.ASCII.GetBytes(_appSettings.Secret);
                    var tokenDescriptor = new SecurityTokenDescriptor
                    {
                        Subject = new ClaimsIdentity(new Claim[]
                        {
                    new Claim("id", user.userID.ToString()),
                    new Claim("orgid", user.orgId.ToString()),
                    new Claim("roleid", user.roleId.ToString())
                        }),
                        Expires = DateTime.UtcNow.AddDays(7),
                        SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
                    };
                    var token = tokenHandler.CreateToken(tokenDescriptor);
                    user.token = tokenHandler.WriteToken(token);
                    return Ok(new ApiResponse { message = ApiMessageConstants.loginSuccessfully, data = user });
                }

            }
            else
            {
                return Ok(new ApiResponse { message = ApiMessageConstants.ModelNotValid });
            }

        }

        [AllowAnonymous]
        [HttpPost("RegisterUser")]
        public async Task<IActionResult> RegisterUser([FromBody]RegistrationModel objRegistration)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    objRegistration.Password = new EncryptAndDecrypt().Encrypt(objRegistration.Password);
                    var config = new MapperConfiguration(cfg =>
                    {
                        cfg.CreateMap<RegistrationModel, UserRegistrationDTO>();
                    });

                    IMapper mapperResponse = config.CreateMapper();
                    var registrationDTO = mapperResponse.Map<RegistrationModel, UserRegistrationDTO>(objRegistration);
                    using (var uow = new UnitOfWork(_configs.Value.DbConnectionString))
                    {
                        int result = await uow.User.RegisterUser(registrationDTO);
                        if (result == 1)
                        {
                            return BadRequest(new ApiResponse { message = ApiMessageConstants.emailAlreadyExists });
                        }
                        else if (result == 2)
                        {
                            return BadRequest(new ApiResponse { message = ApiMessageConstants.orgAlreadyExists });
                        }

                        return Ok(new ApiResponse { message = ApiMessageConstants.registrationSuccessfully, data = result });
                    }

                }
                else
                {

                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return BadRequest();

        }



    }
}