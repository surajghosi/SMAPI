using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using TMS.DataEntities.CommonDTO;

namespace TMS.Dapper.Interface
{
   public interface ICommon
    {
       Task<List<RoleModelDTO>> GetAllRole(Guid OrgId);
    }
}
