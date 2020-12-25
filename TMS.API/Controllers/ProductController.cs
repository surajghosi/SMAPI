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
using TMS.API.Models.ProductModel;
using TMS.Dapper.Infrastructure;
using TMS.Dapper.UnitOfWork;
using TMS.DataEntities.ProductDTO;

namespace TMS.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductController : ControllerBase
    {
        private readonly IOptions<TMSConfiguration> _configs;
        public ProductController(IOptions<TMSConfiguration> Configs)
        {
            _configs = Configs;

        }
        [Authorize]
        [HttpPost("AddProduct")]
        public async Task<IActionResult> AddProduct([FromBody]ProductModel obj)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    ClaimsIdentity claimsIdentity = User.Identity as ClaimsIdentity;
                    var currentLoginUserid = new UserClaims(claimsIdentity).LoggedInUserId;
                    var config = new MapperConfiguration(cfg =>
                    {
                        cfg.CreateMap<ProductModel, ProductDTO>();
                    });


                    obj.createdBy = currentLoginUserid;
                    IMapper mapperResponse = config.CreateMapper();
                    var productDTO = mapperResponse.Map<ProductModel, ProductDTO>(obj);
                    using (var uow = new UnitOfWork(_configs.Value.DbConnectionString))
                    {
                        string result = await uow.Product.AddProductAsync(productDTO);
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
        [HttpPost("DeleteProduct")]
        public async Task<IActionResult> DeleteProduct(ProductModel obj)
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
                        await uow.Product.DeleteProductAsync(obj.productId,obj.createdBy);
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
        [HttpGet("AllProduct")]
        public async Task<IActionResult> AllProduct(Guid leadId)
        {
            try
            {
                if (Convert.ToString(leadId) != string.Empty)
                {

                    using (var uow = new UnitOfWork(_configs.Value.DbConnectionString))
                    {
                        var result = await uow.Product.getAllProductAsync(leadId);
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