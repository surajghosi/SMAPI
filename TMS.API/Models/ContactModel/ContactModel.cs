using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace TMS.API.Models.ContactModel
{
    public class ContactModel
    {
        public Guid contactId { get; set; }
        [Required]
        public string contactName { get; set; }
        public string contactDesignation { get; set; }
        public string contactEmail { get; set; }
        public string contactPhone { get; set; }
        public string contactAddress { get; set; }
        public string contactOrg { get; set; }
        [Required]
        public Guid leadId { get; set; }
        public Guid createdBy { get; set; }
    }
}
