using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http.Headers;
using System.Security.Claims;
using System.Threading.Tasks;
using AutoMapper;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using TMS.API.Common;
using TMS.API.Models.Common;
using TMS.API.Models.FileModel;
using TMS.Dapper.Infrastructure;
using TMS.Dapper.UnitOfWork;
using TMS.DataEntities.FileDTO;

namespace TMS.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FilesController : ControllerBase
    {

        private readonly IOptions<TMSConfiguration> _configs;
        public FilesController(IOptions<TMSConfiguration> Configs)
        {
            _configs = Configs;

        }
        [Authorize]
        [HttpPost("UploadFile"), DisableRequestSizeLimit]
        public async Task<IActionResult> UploadFile()
        {
            try
            {
                var files = Request.Form.Files;
                var leadId = Request.Form["leadId"];
                var folderName = Path.Combine("LeadFiles", leadId);
                //string subPath = "ImagesPath"; // your code goes here
                var pathToSave = Path.Combine(Directory.GetCurrentDirectory(), folderName);
                bool exists = System.IO.Directory.Exists(pathToSave);

                if (!exists)
                    System.IO.Directory.CreateDirectory(pathToSave);
                if (!files.Any(f => f.Length == 0))
                {
                    foreach (var file in files)
                    {

                        var fileName = ContentDispositionHeaderValue.Parse(file.ContentDisposition).FileName.Trim('"');
                        var fullPath = Path.Combine(pathToSave, fileName);
                        var dbPath = Path.Combine(folderName, fileName); //you can add this path to a list and then return all dbPaths to the client if require
                        using (var stream = new FileStream(fullPath, FileMode.Create))
                        {
                            file.CopyTo(stream);
                        }
                        FilesModel obj = new FilesModel();
                        obj.leadFiles = file;
                        obj.fileName = fileName;
                        obj.filePath = dbPath;
                        Guid Lid = new Guid(leadId);
                        obj.leadId = Lid;
                        ClaimsIdentity claimsIdentity = User.Identity as ClaimsIdentity;
                        var currentLoginUserid = new UserClaims(claimsIdentity).LoggedInUserId;
                        var config = new MapperConfiguration(cfg =>
                        {
                            cfg.CreateMap<FilesModel, FileDTO>();
                        });


                        obj.createdBy = currentLoginUserid;
                        IMapper mapperResponse = config.CreateMapper();
                        var fileDTO = mapperResponse.Map<FilesModel, FileDTO>(obj);
                        using (var uow = new UnitOfWork(_configs.Value.DbConnectionString))
                        {
                            string result = await uow.Files.uploadFIleAsync(fileDTO);
                            uow.Commit();
                            return Ok(new ApiResponse { message = ApiMessageConstants.commonAdded, data = result });

                        }
                    }
                    return Ok(new ApiResponse { message = "", data = "" });

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
        [HttpPost("DeleteFile")]
        public async Task<IActionResult> DeleteFile(FilesModel obj)
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
                        var config = new MapperConfiguration(cfg =>
                        {
                            cfg.CreateMap<FilesModel, FileDTO>();
                        });
                        IMapper mapperResponse = config.CreateMapper();
                        var fileDTO = mapperResponse.Map<FilesModel, FileDTO>(obj);

                        await uow.Files.deleteFile(fileDTO);
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
        [HttpGet("AllFiles")]
        public async Task<IActionResult> AllFiles(Guid leadId)
        {
            try
            {
                if (Convert.ToString(leadId) != string.Empty)
                {

                    using (var uow = new UnitOfWork(_configs.Value.DbConnectionString))
                    {
                        var result = await uow.Files.allFiles(leadId);
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