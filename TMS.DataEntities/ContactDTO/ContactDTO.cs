using System;
using System.Collections.Generic;
using System.Text;

namespace TMS.DataEntities.ContactDTO
{
    public class ContactDTO
    {
        public Guid contactId { get; set; }
        public string contactName { get; set; }
        public string contactDesignation { get; set; }
        public string contactEmail { get; set; }
        public string contactPhone { get; set; }
        public string contactAddress { get; set; }
        public string contactOrg { get; set; }
        public Guid leadId { get; set; }
        public Guid createdBy { get; set; }
    }
}
