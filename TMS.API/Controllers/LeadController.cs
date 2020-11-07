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
using TMS.API.Models.AdavnceLeadCreator;
using TMS.API.Models.Common;
using TMS.Dapper.Infrastructure;
using TMS.Dapper.UnitOfWork;
using TMS.DataEntities.AdvanceLeadCreatorDTO;

namespace TMS.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LeadController : ControllerBase
    {
        private readonly IOptions<TMSConfiguration> _configs;
        public LeadController(IOptions<TMSConfiguration> Configs)
        {
            _configs = Configs;

        }
        [Authorize]
        [HttpPost("AddLead")]
        public async Task<IActionResult> AddLead([FromBody]LeadModel obj)
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
                        cfg.CreateMap<LeadModel, LeadInfoDTO>();
                    });

                    
                    obj.createdBy = currentLoginUserid;
                    obj.orgId = currentLoginUserOrgid;
                    IMapper mapperResponse = config.CreateMapper();
                    var leadDTO = mapperResponse.Map<LeadModel, LeadInfoDTO>(obj);
                    using (var uow = new UnitOfWork(_configs.Value.DbConnectionString))
                    {
                          string result = await uow.AdvanceLeadCreator.AddUpdateLeadAsync(leadDTO);
                          uow.Commit();
                            if (result == "1")
                            {
                                return Ok(new ApiResponse { message = ApiMessageConstants.commonUpdated });
                            }

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
        [HttpGet("LeadList")]
        public async Task<IActionResult> LeadList(Guid pipeId)
        {
            try
            {
                using (var uow = new UnitOfWork(_configs.Value.DbConnectionString))
                {
                    var result = await uow.AdvanceLeadCreator.ListViewAsync(pipeId);
                    return Ok(new ApiResponse { data = result});
                }



            }
            catch (Exception ex)
            {
                return BadRequest(new ApiResponse { message = ex.Message });
            }



        }

        [Authorize]
        [HttpPost("MovedLead")]
        public async Task<IActionResult> MovedLead(MovedLeads obj)
        {
            try
            {
                if(ModelState.IsValid)
                {
                    using (var uow = new UnitOfWork(_configs.Value.DbConnectionString))
                    {
                        ClaimsIdentity claimsIdentity = User.Identity as ClaimsIdentity;
                        var currentLoginUserid = new UserClaims(claimsIdentity).LoggedInUserId;
                        await uow.AdvanceLeadCreator.MoveLeadAsync(obj.stageId, obj.leadId, Convert.ToString(currentLoginUserid));
                        uow.Commit();
                        return Ok(new ApiResponse { data = string.Empty });
                    }
                } else
                {
                    return BadRequest(new ApiResponse { message = ApiMessageConstants.requestInvalid });
                }
                
            }
            catch (Exception ex)
            {
                return BadRequest(new ApiResponse { message = ex.Message });
            }



        }
        [Authorize]
        [HttpPost("AddDirectLead")]
        public async Task<IActionResult> AddDirectLead([FromBody]DirectLead obj)
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
                        cfg.CreateMap<DirectLead, DirectLeadDTO>();
                    });


                    obj.createdBy = currentLoginUserid;
                    obj.orgId = currentLoginUserOrgid;
                    IMapper mapperResponse = config.CreateMapper();
                    var leadDTO = mapperResponse.Map<DirectLead, DirectLeadDTO>(obj);
                    using (var uow = new UnitOfWork(_configs.Value.DbConnectionString))
                    {
                        var result = await uow.AdvanceLeadCreator.DirectLeadAddAsync(leadDTO);
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
        [HttpGet("GetLeadDetailsByLeadId")]
        public async Task<IActionResult> GetLeadDetailsByLeadId(Guid leadId)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    using (var uow = new UnitOfWork(_configs.Value.DbConnectionString))
                    {
                       
                       var result= await uow.AdvanceLeadCreator.LeadDetailsByLeadIdAsync(leadId);
                       
                        return Ok(new ApiResponse { data = result });
                    }
                }
                else
                {
                    return BadRequest(new ApiResponse { message = ApiMessageConstants.requestInvalid });
                }

            }
            catch (Exception ex)
            {
                return BadRequest(new ApiResponse { message = ex.Message });
            }



        }


        #region Todo

        [Authorize]
        [HttpPost("AddTodo")]
        public async Task<IActionResult> AddTodo(TodoModel obj)
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
                        cfg.CreateMap<TodoModel, TodoDTO>();
                    });


                    obj.createdBy = currentLoginUserid;
                    IMapper mapperResponse = config.CreateMapper();
                    var todoDTO = mapperResponse.Map<TodoModel, TodoDTO>(obj);
                    using (var uow = new UnitOfWork(_configs.Value.DbConnectionString))
                    {
                        string todoId= await uow.AdvanceLeadCreator.AddTodoAsync(todoDTO);
                        uow.Commit();
                        return Ok(new ApiResponse { message = ApiMessageConstants.commonAdded,data= todoId });

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
        [HttpPost("UpdateTodo")]
        public async Task<IActionResult> UpdateTodo(TodoModel obj)
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
                        cfg.CreateMap<TodoModel, TodoDTO>();
                    });


                    obj.createdBy = currentLoginUserid;
                    IMapper mapperResponse = config.CreateMapper();
                    var todoDTO = mapperResponse.Map<TodoModel, TodoDTO>(obj);
                    using (var uow = new UnitOfWork(_configs.Value.DbConnectionString))
                    {
                        await uow.AdvanceLeadCreator.UpdateTodoAsync(todoDTO);
                        uow.Commit();
                        return Ok(new ApiResponse { message = ApiMessageConstants.commonUpdated});

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
        [HttpPost("UpdateTodoStatus")]
        public async Task<IActionResult> UpdateTodoStatus(UpdateTodoStatus obj)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    ClaimsIdentity claimsIdentity = User.Identity as ClaimsIdentity;
                    var currentLoginUserid = new UserClaims(claimsIdentity).LoggedInUserId;
                    var currentLoginUserOrgid = new UserClaims(claimsIdentity).OrgId;
                    obj.updateBy = currentLoginUserid;
                    
                    
                    using (var uow = new UnitOfWork(_configs.Value.DbConnectionString))
                    {
                        await uow.AdvanceLeadCreator.UpdateTodoStatusAsync(obj.todoId,obj.updateFlag,obj.status ,obj.updateBy);
                        uow.Commit();
                        if(obj.updateFlag==0)
                        {
                            return Ok(new ApiResponse { message = ApiMessageConstants.commonDeleted });
                        } else
                        {
                            return Ok(new ApiResponse { message = ApiMessageConstants.commonUpdated });
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
        [HttpGet("TodoList")]
        public async Task<IActionResult> TodoList(Guid leadId)
        {
            try
            {
                using (var uow = new UnitOfWork(_configs.Value.DbConnectionString))
                {
                    var result = await uow.AdvanceLeadCreator.TodoListAsync(leadId);
                    return Ok(new ApiResponse { data = result });
                }



            }
            catch (Exception ex)
            {
                return BadRequest(new ApiResponse { message = ex.Message });
            }

        }

        #endregion

        

    }
    }