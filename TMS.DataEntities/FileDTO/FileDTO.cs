using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Text;

namespace TMS.DataEntities.FileDTO
{
    public class FileDTO
    {
        public Guid fileId { get; set; }
        public string fileName { get; set; }

        public string filePath { get; set; }

        public Guid leadId { get; set; }
        public Guid createdBy { get; set; }
        public IFormFile leadFiles {get;set;}
    }


    
}
