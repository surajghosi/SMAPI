using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Text;

namespace TMS.DataEntities.Users
{
   public  class User
    {
        public Guid userID { get; set; }
        public string name { get; set; }
        
        public string token { get; set; }
        public Guid orgId { get; set; }
        public Guid roleId { get; set; }
    }

    public class UserRegistrationDTO
    {
        public string password { get; set; }
        public string fullName { get; set; }
        public string emailAddress { get; set; }
        public string orgName { get; set; }
    }
}
