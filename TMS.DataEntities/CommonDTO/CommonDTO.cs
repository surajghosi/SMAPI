using System;
using System.Collections.Generic;
using System.Text;

namespace TMS.DataEntities.CommonDTO
{
    public class RoleModelDTO
    {
        public Guid roleId { get; set; }
        public string roleName { get; set; }
    }

    public class fileUploadResponse
    {
        public string fileName { get; set; }
        public string filePath { get; set; }

    }
    public class leadCommonModelDTO
    {
        public Guid leadId { get; set; }
        public string leadName { get; set; }
        public string wonLostType { get; set; }
        public string wonLostReason { get; set; }
        public Guid pipeLineId { get; set; }
        public Guid stageId { get; set; }
    }
}
