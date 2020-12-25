using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using TMS.DataEntities.FileDTO;
namespace TMS.Dapper.Interface
{
   public  interface IFile
    {
        Task<string> uploadFIleAsync(FileDTO _obj);
        Task deleteFile(FileDTO _obj);
        Task<List<FileDTO>> allFiles(Guid leadId);
    }
}
