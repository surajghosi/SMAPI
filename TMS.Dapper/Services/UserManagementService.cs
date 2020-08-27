using Dapper;
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
using TMS.DataEntities.UserManagementDTO;

namespace TMS.Dapper.Services
{
    public class UserManagementService : RepositoryBase,IUserManagement
    {
       

        
        public UserManagementService(IDbTransaction transaction)
            : base(transaction)
        {
        }
        public async Task<int> AddUpdateUser(UserDTO objUser)
        {
            try
            {
                
                    var query = "AddUpdateUser";
                    var param = new DynamicParameters();
                    param.Add("@id", objUser.userId);
                    param.Add("@orgid", objUser.orgId);
                    param.Add("@name", objUser.fullName);
                    param.Add("@email", objUser.emailAddress);
                    param.Add("@roleid", objUser.role);
                    param.Add("@password", objUser.password);
                    param.Add("@userid", objUser.createdBy);
                    int Result = await Connection.ExecuteScalarAsync<int>(query, param, commandType: CommandType.StoredProcedure,transaction:Transaction);
                    return Result;
               
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task DeleteUser(Guid UserId)
        {
            try
            {
                
                    var query = "DeleteUserId";
                    var param = new DynamicParameters();
                    param.Add("@id", Convert.ToString(UserId));
                    await Connection.ExecuteScalarAsync<int>(query, param, commandType: CommandType.StoredProcedure, transaction: Transaction);
                    
                
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<List<UserList>> GetAllUser(Guid Orgid,int PageNumber,int PageSize)
        {
            try
            {
              
                    var query = "GetAllUser";
                    var param = new DynamicParameters();
                    param.Add("@orgid", Convert.ToString(Orgid));
                    param.Add("@Page", PageNumber);
                    param.Add("@Size", PageSize);
                    var Result = await Connection.QueryAsync<UserList>(query, param, commandType: CommandType.StoredProcedure, transaction: Transaction);
                    return Result.ToList();
               
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<UserDTO> GetUserById(Guid UserId)
        {
            try
            {
              
                    var query = "GetUserById";
                    var param = new DynamicParameters();
                    param.Add("@id", Convert.ToString(UserId));
                    var Result = await Connection.QueryFirstAsync<UserDTO>(query, param, commandType: CommandType.StoredProcedure, transaction: Transaction);
                    return Result;
              
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
