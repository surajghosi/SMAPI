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
using TMS.API.Models.NotesModel;
using TMS.Dapper.Infrastructure;
using TMS.Dapper.UnitOfWork;
using TMS.DataEntities.NotesDTO;

namespace TMS.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class NotesController : ControllerBase
    {
        private readonly IOptions<TMSConfiguration> _configs;
        public NotesController(IOptions<TMSConfiguration> Configs)
        {
            _configs = Configs;

        }

        [Authorize]
        [HttpPost("AddNotes")]
        public async Task<IActionResult> AddNotes([FromBody]NotesModel obj)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    ClaimsIdentity claimsIdentity = User.Identity as ClaimsIdentity;
                    var currentLoginUserid = new UserClaims(claimsIdentity).LoggedInUserId;
                    var config = new MapperConfiguration(cfg =>
                    {
                        cfg.CreateMap<NotesModel, NotesDTO>();
                    });


                    obj.createdBy = currentLoginUserid;
                    IMapper mapperResponse = config.CreateMapper();
                    var notesDTO = mapperResponse.Map<NotesModel, NotesDTO>(obj);
                    using (var uow = new UnitOfWork(_configs.Value.DbConnectionString))
                    {
                        string result = await uow.Notes.addNotesAsync(notesDTO);
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
        [HttpPost("DeleteNotes")]
        public async Task<IActionResult> DeleteNotes(NotesModel obj)
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
                        await uow.Notes.deleteNotesAsync(obj.noteId, obj.createdBy);
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
        [HttpGet("AllNotes")]
        public async Task<IActionResult> AllNotes(Guid leadId)
        {
            try
            {
                if (Convert.ToString(leadId) != string.Empty)
                {

                    using (var uow = new UnitOfWork(_configs.Value.DbConnectionString))
                    {
                        var result = await uow.Notes.getAllContactAsync(leadId);
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