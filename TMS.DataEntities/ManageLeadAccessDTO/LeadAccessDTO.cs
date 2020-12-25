using System;
using System.Collections.Generic;
using System.Text;

namespace TMS.DataEntities.ManageLeadAccessDTO
{
   public class LeadAccessDTO
    {
        public Guid accessID { get; set; }
        public Guid leadId { get; set; }
        public Guid userId { get; set; }
        public Guid createdBy { get; set; }
        public string name { get; set; }
    }
}
