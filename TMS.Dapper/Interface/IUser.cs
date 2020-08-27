using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using TMS.DataEntities.Users;

namespace TMS.Dapper.Interface
{
    public interface IUser
    {
       Task<User> Authenticate(string username, string password);
        //IEnumerable<User> GetAll();
        Task<int> RegisterUser(UserRegistrationDTO objUser);
        Task<IEnumerable<User>> GetAll();
    }
}
