using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace TMS.API.Models.AdavnceLeadCreator
{
    public class LeadModel
    {
        [Required]
        public Guid leadId { get; set; }
        [Required]
        public string leadName { get; set; }
        public string leadValue { get; set; }
        [Required]
        public Guid assignUser { get; set; }
        public string createDate { get; set; }
        [Required]
        public Guid pipeId { get; set; }
        [Required]
        public Guid stageId { get; set; }
        public Guid createdBy { get; set; }
        public Guid orgId { get; set; }
        public int updateFlag { get; set; }
    }

    public class LeadListViewModel
    {
        public List<LeadModel> leadDetails { get; set; }
        public TMS.API.Models.StageModel.StageModel stageDetails { get; set; }
    }

    public class MovedLeads
    {
        [Required]
        public string stageId { get; set; }
        [Required]
        public string leadId { get; set; }
        
    }

    public class TodoModel
    {

        public Guid todoId { get; set; }
        [Required]
        public string todoName { get; set; }
       
        public string todoDate { get; set; }
       
        public string todoTime { get; set; }
        [Required]
        public string todoType { get; set; }
        [Required]
        public Guid leadId { get; set; }
        public Guid createdBy { get; set; }
    }

    public class UpdateTodoStatus
    {
        public Guid todoId { get; set; }
        public  Guid updateBy { get; set; }

        public int updateFlag { get; set; }
        public int status { get; set; }
        

    }
    public class DirectLead
    {
        [Required]
        public string leadName { get; set; }
        public Guid createdBy { get; set; }
        public Guid orgId { get; set; }
    }
}
