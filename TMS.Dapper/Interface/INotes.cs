using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using TMS.DataEntities.NotesDTO;

namespace TMS.Dapper.Interface
{
    public interface INotes
    {
        Task<string> addNotesAsync(NotesDTO _obj);
        Task deleteNotesAsync(Guid noteId, Guid modifiedBy);
        Task<List<NotesDTO>> getAllContactAsync(Guid leadId);
    }
}
