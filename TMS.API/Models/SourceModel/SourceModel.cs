using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace TMS.API.Models.SourceModel
{
    public class SourceModel
    {
        public Guid sourceId { get; set; }
        [Required]
        public string sourceName { get; set; }
        [Required]
        public Guid leadId { get; set; }
        public Guid createdBy { get; set; }
    }
}
