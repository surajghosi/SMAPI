using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TMS.Dapper.Interface;
using TMS.DataEntities.ZoneDTO;

namespace TMS.Dapper.Services
{
    public class ZoneService : RepositoryBase, IZone
    {
        public ZoneService(IDbTransaction transaction)
         : base(transaction)
        {
        }

        public async Task<string> AddZoneAsync(ZoneDTO _obj)
        {
            try
            {

                var query = "AddZone";
                var param = new DynamicParameters();
                param.Add("@AreaName", _obj.areaName);
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

        public async Task DeleteZoneAsync(Guid zoneId, Guid modifiedBy)
        {
            try
            {

                var query = "DeleteZone";
                var param = new DynamicParameters();
                param.Add("@areaid", zoneId);
                param.Add("@modifiedby", modifiedBy);
                await Connection.ExecuteScalarAsync<object>(query, param, commandType: CommandType.StoredProcedure, transaction: Transaction);

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public async Task<List<ZoneDTO>> getAllZoneAsync(Guid leadId)
        {
            try
            {
                var query = "GetAllZone";
                var param = new DynamicParameters();
                param.Add("@leadId", leadId);
                var Result = await Connection.QueryAsync<ZoneDTO>(query, param, commandType: CommandType.StoredProcedure, transaction: Transaction);
                return Result.ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
