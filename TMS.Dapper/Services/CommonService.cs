using Dapper;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TMS.Dapper.Infrastructure;
using TMS.Dapper.Interface;
using TMS.DataEntities.AdvanceLeadCreatorDTO;
using TMS.DataEntities.CommonDTO;
using TMS.DataEntities.Users;

namespace TMS.Dapper.Services
{
    public class CommonService : RepositoryBase,ICommon
    {


        public CommonService(IDbTransaction transaction)
            : base(transaction)
        {
        }
        public async Task<List<RoleModelDTO>> GetAllRole(Guid OrgId)
        {
            try
            {
                

                    var query = "getRoleMaster";
                    var param = new DynamicParameters();
                    param.Add("@orgid", OrgId);
                    var roleMaster = await Connection.QueryAsync<RoleModelDTO>(query, param, commandType: CommandType.StoredProcedure,transaction:Transaction);
                    return roleMaster.ToList();
                
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task updateLeadDetailsAsync(LeadInfoDTO leadDetails)
        {
            try
            {

                var query = "UpdateLeadDetails";
                var param = new DynamicParameters();
                param.Add("@leadId", leadDetails.leadId);
                param.Add("@leadName", leadDetails.leadName);
                param.Add("@leadPipeLineId", leadDetails.pipeId);
                param.Add("@leadStageId", leadDetails.stageId);
                param.Add("@leadValue", leadDetails.leadValue);
                param.Add("@userid", leadDetails.createdBy);
                param.Add("@updateFlag", leadDetails.updateFlag);
                await Connection.ExecuteScalarAsync<object>(query, param, commandType: CommandType.StoredProcedure, transaction: Transaction);


            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public Task<fileUploadResponse> uploadFileInFolder(IFormFile file)
        {
            throw new NotImplementedException();
        }
    }
}
