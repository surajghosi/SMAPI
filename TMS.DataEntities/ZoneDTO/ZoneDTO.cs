using System;
using System.Collections.Generic;
using System.Text;

namespace TMS.DataEntities.ZoneDTO
{
    public class ZoneDTO
    {
        public Guid areaId { get; set; }
        public string areaName { get; set; }
        public Guid leadId { get; set; }
        public Guid createdBy { get; set; }
    }
}
