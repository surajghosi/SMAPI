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
        Task DeleteNotesAsync(Guid noteId, Guid modifiedBy);
    }
}
