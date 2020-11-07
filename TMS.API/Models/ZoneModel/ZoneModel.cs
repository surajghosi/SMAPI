using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace TMS.API.Models.ZoneModel
{
    public class ZoneModel
    {
        public Guid areaId { get; set; }
        [Required]
        public string areaName { get; set; }
        [Required]
        public Guid leadId { get; set; }
        public Guid createdBy { get; set; }
    }
}
