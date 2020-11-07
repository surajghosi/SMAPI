using System;
using System.Collections.Generic;
using System.Text;

namespace TMS.DataEntities.PipeLineDTO
{
    public class PipeLineDTO
    {
        public Guid pipeID { get; set; }
        public string pipeName { get; set; }
        public bool IsActive { get; set; }
        public bool isDefault { get; set; }
        public Guid OrgId { get; set; }
        public DateTime CreatedDate { get; set; }
        public Guid CreatedBy { get; set; }
        public DateTime ModifiedDate { get; set; }
        public Guid ModifiedBy { get; set; }



    }
}
