using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace TMS.API.Models.NotesModel
{
    public class NotesModel
    {
        public Guid noteId { get; set; }
        [Required]
        public string notes { get; set; }
        [Required]
        public Guid leadId { get; set; }
        public Guid createdBy { get; set; }
    }
}
