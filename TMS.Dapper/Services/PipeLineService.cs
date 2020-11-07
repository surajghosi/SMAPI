using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Transactions;
using TMS.Dapper.Interface;
using TMS.DataEntities.PipeLineDTO;

namespace TMS.Dapper.Services
{
    public class PipeLineService : RepositoryBase, IPipeLine
    {
        public PipeLineService(IDbTransaction transaction)
            : base(transaction)
        {
        }
        public async Task<int> AddUpdatePipeLine(PipeLineDTO _obj)
        {
            try
            {

                var query = "ADDUPDATEPIPELINE";
                var param = new DynamicParameters();
                param.Add("@PIPELINEID", _obj.pipeID);
                param.Add("@PIPELINENAME", _obj.pipeName);
                param.Add("@ISDEFAULT", _obj.isDefault);
                param.Add("@USERID", _obj.CreatedBy);
                param.Add("@ORGID", _obj.OrgId);
                int Result = await Connection.ExecuteScalarAsync<int>(query, param, commandType: CommandType.StoredProcedure, transaction: Transaction);
                return Result;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task DeletePipeLine(Guid PipeLineId)
        {
            var query = "DELETEPIPELINE";
            var param = new DynamicParameters();
            param.Add("@PIPELINEID", Convert.ToString(PipeLineId));
            await Connection.ExecuteScalarAsync<int>(query, param, commandType: CommandType.StoredProcedure, transaction: Transaction);
        }

        public async Task<PipeLineDTO> PipeLineDetailsById(Guid PipeLineId)
        {
            var query = "GETPIPELINEBYID";
            var param = new DynamicParameters();
            param.Add("@PIPELINEID", Convert.ToString(PipeLineId));
            var Result = await Connection.QueryFirstAsync<PipeLineDTO>(query, param, commandType: CommandType.StoredProcedure, transaction: Transaction);
            return Result;
        }

      

        public async Task<List<PipeLineDTO>> PipeLineList(Guid OrgId)
        {
            try
            {

                var query = "GETALLPIPELINE";
                var param = new DynamicParameters();
                param.Add("@orgid", Convert.ToString(OrgId));
                var Result = await Connection.QueryAsync<PipeLineDTO>(query, param, commandType: CommandType.StoredProcedure, transaction: Transaction);
                return Result.ToList();

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
