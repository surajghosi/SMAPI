using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace TMS.API.Models
{
    public class AuthenticateModel
    {
        [Required]
        public string userName { get; set; }

        [Required]
        public string password { get; set; }
    }
}
