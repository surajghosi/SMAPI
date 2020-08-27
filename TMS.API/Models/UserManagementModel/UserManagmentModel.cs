using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TMS.API.Models.UserManagementModel
{
    public class User
    {
        public Guid userId { get; set; }
        public string emailAddress { get; set; }
        public string password { get; set; }
        public string fullName { get; set; }
        public Guid role { get; set; }
        public Guid orgId { get; set; }
        public Guid createdBy { get; set; }
    }
}
