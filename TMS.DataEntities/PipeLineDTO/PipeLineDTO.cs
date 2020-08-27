using System;
using System.Collections.Generic;
using System.Text;

namespace TMS.DataEntities.PipeLineDTO
{
    public class PipeLineDTO
    {
        public Guid PipeID { get; set; }
        public string PipeName { get; set; }
        public bool IsActive { get; set; }
        public string IsDefault { get; set; }
        public string OrgId { get; set; }
        public DateTime CreatedDate { get; set; }
        public Guid CreatedBy { get; set; }
        public DateTime ModifiedDate { get; set; }
        public Guid ModifiedBy { get; set; }



    }
}
