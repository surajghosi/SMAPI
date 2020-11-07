using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Transactions;
using TMS.Dapper.Interface;
using TMS.DataEntities.StageDTO;

namespace TMS.Dapper.Services
{
   public class StageService : RepositoryBase, IStage
    {
        public StageService(IDbTransaction transaction)
          : base(transaction)
        {
        }
        public async Task<int> AddUpdateStage(StageDTO _obj)
        {
            try
            {

                var query = "ADDUPDATESTAGE";
                var param = new DynamicParameters();
                param.Add("@STAGEID", _obj.stageId);
                param.Add("@STAGENAME", _obj.stageName);
                param.Add("@SEQUENCENUMBER", _obj.sequenceNumber);
                param.Add("@PIPEID", _obj.pipeId);
                param.Add("@USERID", _obj.createdBy);

                int Result = await Connection.ExecuteScalarAsync<int>(query, param, commandType: CommandType.StoredProcedure, transaction: Transaction);
                return Result;

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task DeleteStage(Guid stageId)
        {
            var query = "DELETESTAGE";
            var param = new DynamicParameters();
            param.Add("@STATGEID", Convert.ToString(stageId));
            await Connection.ExecuteScalarAsync<int>(query, param, commandType: CommandType.StoredProcedure, transaction: Transaction);
        }

        public async Task<StageDTO> StageDetailsById(Guid PipeLineId)
        {
            var query = "GETSTAGEBYID";
            var param = new DynamicParameters();
            param.Add("@STAGEID", Convert.ToString(PipeLineId));
            var Result = await Connection.QueryFirstAsync<StageDTO>(query, param, commandType: CommandType.StoredProcedure, transaction: Transaction);
            return Result;
        }



        public async Task<List<StageDTO>> StageList(Guid pipeId)
        {
            try
            {

                var query = "GETALLSTAGE";
                var param = new DynamicParameters();
                param.Add("@PIPEID", Convert.ToString(pipeId));
                var Result = await Connection.QueryAsync<StageDTO>(query, param, commandType: CommandType.StoredProcedure, transaction: Transaction);
                return Result.ToList();

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        

        public async Task UdpateStage(Guid stageId, int sequenceNumber)
        {
            try
            {

                var query = "UpdateStage";
                var param = new DynamicParameters();
                param.Add("@stageid", Convert.ToString(stageId));
                param.Add("@sequenceNumber", sequenceNumber);
               await Connection.QueryAsync<StageDTO>(query, param, commandType: CommandType.StoredProcedure, transaction: Transaction);

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
