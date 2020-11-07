using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Threading.Tasks;
using TMS.Dapper.Interface;
using TMS.DataEntities.NotesDTO;

namespace TMS.Dapper.Services
{
    public class NotesService : RepositoryBase, INotes
    {
        public NotesService(IDbTransaction transaction)
         : base(transaction)
        {
        }

        public async Task<string> addNotesAsync(NotesDTO _obj)
        {
           try
            {

                var query = "AddNotes";
                var param = new DynamicParameters();
                param.Add("@Notes", _obj.notes);
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

        public async Task DeleteNotesAsync(Guid noteId, Guid modifiedBy)
        {
            try
            {

                var query = "deleteNotes";
                var param = new DynamicParameters();
                param.Add("@noteid", noteId);
                param.Add("@modifiedby", modifiedBy);
                await Connection.ExecuteScalarAsync<object>(query, param, commandType: CommandType.StoredProcedure, transaction: Transaction);

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
