using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TMS.Dapper.Interface;
using TMS.DataEntities.SourceDTO;

namespace TMS.Dapper.Services
{
    public class SourceService : RepositoryBase, ISource
    {

        public SourceService(IDbTransaction transaction)
        : base(transaction)
        {
        }
        public async Task<string> AddSourceAsync(SourceDTO _obj)
        {
            try
            {

                var query = "AddSource";
                var param = new DynamicParameters();
                param.Add("@Source", _obj.sourceName);
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

        public async Task DeleteSourceAsync(Guid sourceId, Guid modifiedBy)
        {
            try
            {

                var query = "DeleteSource";
                var param = new DynamicParameters();
                param.Add("@SourceId", sourceId);
                param.Add("@modified", modifiedBy);
                await Connection.ExecuteScalarAsync<object>(query, param, commandType: CommandType.StoredProcedure, transaction: Transaction);

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public async Task<List<SourceDTO>> getAllSourceAsync(Guid leadId)
        {
            try
            {
                var query = "GetAllSource";
                var param = new DynamicParameters();
                param.Add("@leadId", leadId);
                var Result = await Connection.QueryAsync<SourceDTO>(query, param, commandType: CommandType.StoredProcedure, transaction: Transaction);
                return Result.ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
