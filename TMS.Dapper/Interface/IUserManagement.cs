using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using TMS.DataEntities.UserManagementDTO;

namespace TMS.Dapper.Interface
{
    public interface IUserManagement
    {
        Task<int> AddUpdateUser(UserDTO objUser);
        Task<List<UserList>> GetAllUser(Guid Orgid,int PageNumber,int PageSize);
        Task<UserDTO> GetUserById(Guid UserId);
        Task DeleteUser(Guid UserId);
    }
}
