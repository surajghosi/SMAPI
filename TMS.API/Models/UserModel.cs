using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace TMS.API.Models
{
    public class RegistrationModel
    {
      
        [Required]
        public string Password { get; set; }
        [Required]
        public string FullName { get; set; }
        
        [Required]
        [EmailAddress]
        public string EmailAddress { get; set; }
        [Required]
        public string OrgName { get; set; }
       
       
    }
}
