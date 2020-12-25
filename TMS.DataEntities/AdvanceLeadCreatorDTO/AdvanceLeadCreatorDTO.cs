using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;
using TMS.DataEntities.StageDTO;

namespace TMS.DataEntities.AdvanceLeadCreatorDTO
{
   public  class AdvanceLeadCreatorDTO
    {
    }


    public class LeadInfoDTO
    {
        public Guid leadId { get; set; }
        public string leadName { get; set; }
        public string leadValue { get; set; }
        public Guid assignUser { get; set; }
        public Guid pipeId { get; set; }
        public Guid stageId { get; set; }
        public string createdBy { get; set; }
        public Guid orgId { get; set; }

        public string assignUserName  {get;set;}

        public DateTime createDate { get; set; }
        public int updateFlag { get; set; }
    }


    public class DirectLeadDTO
    {
        [Required]
        public string leadName { get; set; }
        public Guid createdBy { get; set; }
        public Guid orgId { get; set; }
    }

    public class TodoDTO
    {
        public Guid todoId { get; set; }
        public string todoName { get; set; }
        public string todoDate { get; set; }
        public string todoTime { get; set; }
        public string todoType { get; set; }
        public Guid leadId { get; set; }
        public Guid createdBy { get; set; }
        

    }


    public class LeadListViewDTO
    {
        public List<LeadInfoDTO> leadDetails { get; set; }
        public TMS.DataEntities.StageDTO.StageDTO stageDetails { get; set; }
    }

    public class LeadresultData
    {
        public Guid PipeId { get; set; }
        public List<LeadListViewDTO> leaddata { get; set; }
    }


    public class todoList
    {
        public Guid todoId { get; set; }
        public string todoName { get; set; }
        public string todoDate { get; set; }
        public string todoTime { get; set; }
        public string todoType { get; set; }
        public string Name { get; set; }
        public string todoStatus { get; set; }
    }
}
