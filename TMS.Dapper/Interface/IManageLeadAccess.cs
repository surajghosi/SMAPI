using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using TMS.DataEntities.ManageLeadAccessDTO;

namespace TMS.Dapper.Interface
{
    public interface IManageLeadAccess
    {
        Task<string> addLeadAccessAsync(LeadAccessDTO obj);
        Task deleteLeadAccessAsync(Guid accessId, Guid modifiedBy);
        Task<List<LeadAccessDTO>> getAllLeadAccessAsync(Guid leadId);
    }
}
