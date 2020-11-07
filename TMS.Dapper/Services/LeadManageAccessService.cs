using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Threading.Tasks;
using TMS.Dapper.Interface;
using TMS.DataEntities.ManageLeadAccessDTO;

namespace TMS.Dapper.Services
{
    public class LeadManageAccessService : RepositoryBase, IManageLeadAccess
    {
        public LeadManageAccessService(IDbTransaction transaction)
        : base(transaction)
        {
        }
        public async Task<string> addLeadAccessAsync(LeadAccessDTO _obj)
        {
            try
            {

                var query = "AddLeadManageAccess";
                var param = new DynamicParameters();
                param.Add("@userId", _obj.userId);
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

        public async Task deleteLeadAccessAsync(Guid accessId, Guid modifiedBy)
        {
            try
            {

                var query = "DeleteLeadManageAccess";
                var param = new DynamicParameters();
                param.Add("@Accessid", accessId);
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
