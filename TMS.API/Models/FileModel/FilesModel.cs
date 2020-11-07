using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TMS.API.Models.FileModel
{
    public class FilesModel
    {
        public Guid fileId { get; set; }
        public string fileName { get; set; }

        public string filePath { get; set; }

        public Guid leadId { get; set; }
        public Guid createdBy { get; set; }
        public IFormFile leadFiles { get; set; }
    }
}
