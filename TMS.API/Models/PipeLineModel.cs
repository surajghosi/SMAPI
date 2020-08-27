using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TMS.API.Models
{
    public class PipeLineModel
    {
        public Guid PipeID { get; set; }
        public string PipeName { get; set; }
        public bool IsActive { get; set; }
        public string IsDefault { get; set; }
        public Guid OrgId { get; set; }
        public DateTime CreatedDate { get; set; }
        public Guid CreatedBy { get; set; }
        public DateTime ModifiedDate { get; set; }
        public Guid ModifiedBy { get; set; }
    }
}
