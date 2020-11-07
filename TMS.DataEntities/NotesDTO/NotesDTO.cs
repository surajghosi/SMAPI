using System;
using System.Collections.Generic;
using System.Text;

namespace TMS.DataEntities.NotesDTO
{
    public class NotesDTO
    {
        public Guid noteId { get; set; }
        public string notes { get; set; }
        public Guid leadId { get; set; }
        public Guid createdBy { get; set; }

    }
}
