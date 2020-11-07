using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using TMS.DataEntities.AdvanceLeadCreatorDTO;

namespace TMS.Dapper.Interface
{
    public interface IAdvanceLeadCreator
    {
        //Task AdvanceLeadCreator(Guid PipeLineId);
        Task<string> AddUpdateLeadAsync(LeadInfoDTO objLead);
        Task<List<LeadListViewDTO>> ListViewAsync(Guid pipeId);
        Task MoveLeadAsync(string stageId, string leadId,string ModifiedBy);
        Task<string> AddTodoAsync(TodoDTO obj);
        Task<List<todoList>> TodoListAsync(Guid LeadId);
        Task<LeadInfoDTO> LeadDetailsByLeadIdAsync(Guid LeadId);
        Task UpdateTodoAsync(TodoDTO obj);
        Task UpdateTodoStatusAsync(Guid TodoId, int updateFlag, int status, Guid updatedBy);
        Task<dynamic> DirectLeadAddAsync(DirectLeadDTO _obj);
    }
}
