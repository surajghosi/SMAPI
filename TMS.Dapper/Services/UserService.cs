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
using TMS.DataEntities.Users;

namespace TMS.Dapper.Services
{
   public class UserService : RepositoryBase, IUser
    {



        public UserService(IDbTransaction transaction)
            : base(transaction)
        {
        }

        /// <summary>
        /// User Authenticate method for validate username and password
        /// </summary>
        /// <param name="username">username</param>
        /// <param name="password">password</param>
        /// <returns>object of userdetails </returns>
        public async Task<User> Authenticate(string username, string password)
        {
            try
            {
               
                
                    var query = "USP_VALIDATEUSER";
                    var param = new DynamicParameters();
                    param.Add("@USERNAME", username);
                    param.Add("@PASSWORD", password);

                    User userDetails = await Connection.QueryFirstOrDefaultAsync<User>(query, param, commandType: CommandType.StoredProcedure,transaction:Transaction);
                    //User userDetails = await SqlMapper.QueryFirstOrDefaultAsync<User>(_connectionFactory.GetConnection, );
                    if (userDetails == null)
                        return null;

                    return userDetails;
                
            }catch(Exception ex)
            {
                throw ex;
            }
            
           
         
           
        }

        public async Task<int> RegisterUser(UserRegistrationDTO objUser)
        {
            try
            {
               
                    var query = "Usp_RegisterOrgnization";
                    var param = new DynamicParameters();
                    param.Add("@orgName", objUser.orgName);
                    param.Add("@emailAddress", objUser.emailAddress);
                    param.Add("@Name", objUser.fullName);
                    param.Add("@password", objUser.password);
                    int Result= await Connection.ExecuteScalarAsync<int>(query, param, commandType: CommandType.StoredProcedure, transaction: Transaction);
                    //User userDetails = await SqlMapper.QueryFirstOrDefaultAsync<User>(_connectionFactory.GetConnection, );
                    return Result;
                
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        
        public async Task<IEnumerable<User>> GetAll()
        {
            try
            {
               
                    var query = "USP_REGISTERUSER";
                    var param = new DynamicParameters();
                  //  param.Add("@USRNAME", objUser.UserName);
                    var Result = await Connection.QueryAsync<User>(query, param, commandType: CommandType.StoredProcedure, transaction: Transaction);
                    //User userDetails = await SqlMapper.QueryFirstOrDefaultAsync<User>(_connectionFactory.GetConnection, );
                    return Result.ToList();
               

            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        //Task<IEnumerable<User>> IUser.GetAll()
        //{
        //    throw new NotImplementedException();
        //}
    }
}
