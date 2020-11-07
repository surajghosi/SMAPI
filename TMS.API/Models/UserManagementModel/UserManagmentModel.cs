using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace TMS.API.Models.UserManagementModel
{
    public class User
    {
        public Guid userId { get; set; }

        [Required]
        public string emailAddress { get; set; }
        [Required]
        public string password { get; set; }
        [Required]
        public string fullName { get; set; }
        [Required]
        public Guid role { get; set; }
        public Guid orgId { get; set; }
        public Guid createdBy { get; set; }
    }
}
