using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using TMS.DataEntities.ZoneDTO;

namespace TMS.Dapper.Interface
{
    public interface IZone
    {
        Task<string> AddZoneAsync(ZoneDTO _obj);
        Task DeleteZoneAsync(Guid zoneId, Guid modifiedBy);

        Task<List<ZoneDTO>> getAllZoneAsync(Guid leadId);
    }
}
