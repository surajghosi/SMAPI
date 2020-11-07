using System;
using System.Collections.Generic;
using System.Text;

namespace TMS.DataEntities.StageDTO
{
    public class StageDTO
    {
        public Guid stageId { get; set; }
        public string stageName { get; set; }
        public int sequenceNumber { get; set; }
        public Guid pipeId { get; set; }
       public Guid createdBy { get; set; }
    }
}
