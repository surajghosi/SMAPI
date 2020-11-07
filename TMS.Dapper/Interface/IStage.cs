using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using TMS.DataEntities.StageDTO;

namespace TMS.Dapper.Interface
{
    public interface IStage
    {
        Task<int> AddUpdateStage(StageDTO _obj);
        Task DeleteStage(Guid PipeLineId);
        Task<StageDTO> StageDetailsById(Guid PipeLineId);
        Task<List<StageDTO>> StageList(Guid pipeId);
        Task UdpateStage(Guid stageId,int sequenceNumber);

    }
}
