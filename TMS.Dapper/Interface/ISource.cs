using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using TMS.DataEntities.SourceDTO;

namespace TMS.Dapper.Interface
{
    public interface ISource
    {
        Task<string> AddSourceAsync(SourceDTO _obj);
        Task DeleteSourceAsync(Guid sourceId, Guid modifiedBy);
        Task<List<SourceDTO>> getAllSourceAsync(Guid leadId);
    }
}
