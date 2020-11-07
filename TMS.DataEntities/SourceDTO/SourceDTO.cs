using System;
using System.Collections.Generic;
using System.Text;

namespace TMS.DataEntities.SourceDTO
{
    public class SourceDTO
    {
        public Guid sourceId { get; set; }
        public string sourceName { get; set; }
        public Guid leadId { get; set; }
        public Guid createdBy { get; set; }

    }
}
