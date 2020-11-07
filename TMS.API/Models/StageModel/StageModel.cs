using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace TMS.API.Models.StageModel
{
    public class StageModel
    {

        public Guid stageId { get; set; }

        [Required]
        public string stageName { get; set; }
        public int sequenceNumber { get; set; }
        [Required]
        public Guid pipeId { get; set; }
        public Guid createdBy { get; set; }
    }
}
