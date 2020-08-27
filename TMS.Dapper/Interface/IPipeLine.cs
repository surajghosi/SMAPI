using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Text;
using System.Threading.Tasks;
using TMS.DataEntities.PipeLineDTO;

namespace TMS.Dapper.Interface
{
    public interface IPipeLine
    {
        Task<int> AddUpdatePipeLine(PipeLineDTO _obj);
        Task DeletePipeLine(Guid PipeLineId);
        Task<PipeLineDTO> PipeLineDetailsById(Guid PipeLineId);
        Task<List<PipeLineDTO>> PipeLineList(Guid OrgId);


    }
}
