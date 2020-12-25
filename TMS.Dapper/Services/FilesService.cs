using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TMS.Dapper.Interface;
using TMS.DataEntities.FileDTO;

namespace TMS.Dapper.Services
{
    public  class FilesService : RepositoryBase , IFile
    {
        public FilesService(IDbTransaction transaction)
          : base(transaction)
        {
        }

        public async Task<List<FileDTO>> allFiles(Guid leadId)
        {
            try
            {

                var query = "GetAllFile";
                var param = new DynamicParameters();
                param.Add("@leadId", leadId);
                var Result = await Connection.QueryAsync<FileDTO>(query, param, commandType: CommandType.StoredProcedure, transaction: Transaction);
                return Result.ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task deleteFile(FileDTO _obj)
        {
            try
            {

                var query = "deleteFile";
                var param = new DynamicParameters();
                param.Add("@fileid", _obj.fileId);
                param.Add("@modifiedBy",_obj.createdBy);
                await Connection.ExecuteScalarAsync<object>(query, param, commandType: CommandType.StoredProcedure, transaction: Transaction);

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<string> uploadFIleAsync(FileDTO _obj)
        {
            try
            {

                var query = "AddFiles";
                var param = new DynamicParameters();
                param.Add("@fileName", _obj.fileName);
                param.Add("@filePath", _obj.filePath);
                param.Add("@leadId", _obj.leadId);
                param.Add("@createdBy", _obj.createdBy);
                object Result = await Connection.ExecuteScalarAsync<object>(query, param, commandType: CommandType.StoredProcedure, transaction: Transaction);
                return Result.ToString();


            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
