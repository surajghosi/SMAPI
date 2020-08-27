using System;
using System.Collections.Generic;
using System.Text;

namespace TMS.DataEntities.UserManagementDTO
{
    public  class UserDTO
    {
        public Guid userId { get; set; }
        public string emailAddress { get; set; }
        public string password { get; set; }
        public string fullName { get; set; }
        public Guid role { get; set; }
        public Guid orgId { get; set; }
        public Guid createdBy { get; set; }
    }



    public class UserList
    {
        public Guid userId { get; set; }
        public string name { get; set; }
        public string email { get; set; }
        public string roleName { get; set; }
        public string totalRecords { get; set; }
    }
}
