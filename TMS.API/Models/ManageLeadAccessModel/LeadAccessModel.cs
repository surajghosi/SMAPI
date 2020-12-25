using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace TMS.API.Models.ManageLeadAccessModel
{
    public class LeadAccessModel
    {
       
        public Guid accessID { get; set; }
        [Required]
        public Guid leadId { get; set; }
        [Required]
        public Guid userId { get; set; }
        public Guid createdBy { get; set; }
        public string name { get; set; }
    }
}
