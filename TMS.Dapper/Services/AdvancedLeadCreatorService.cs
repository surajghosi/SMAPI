using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TMS.Dapper.Interface;
using TMS.DataEntities.AdvanceLeadCreatorDTO;
using TMS.DataEntities.StageDTO;

namespace TMS.Dapper.Services
{
    public class AdvancedLeadCreatorService : RepositoryBase, IAdvanceLeadCreator
    {
        public AdvancedLeadCreatorService(IDbTransaction transaction)
           : base(transaction)
        {
        }

        public async Task<string> AddTodoAsync(TodoDTO _obj)
        {
            try
            {

                var query = "AddTodo";
                var param = new DynamicParameters();
                param.Add("@TodoName", _obj.todoName);
                param.Add("@tododate", _obj.todoDate != string.Empty ? DateTime.Parse(_obj.todoDate) : DateTime.Parse("1/1/1999"));
                param.Add("@todoTime",_obj.todoTime);
                param.Add("@Leadid", _obj.leadId);
                param.Add("@todoType", _obj.todoType);
                param.Add("@CreatedBy", _obj.createdBy);
                object Result =await Connection.ExecuteScalarAsync<object>(query, param, commandType: CommandType.StoredProcedure, transaction: Transaction);
                return Result.ToString();


            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<string> AddUpdateLeadAsync(LeadInfoDTO _obj)
        {
            try
            {

                var query = "ADDLEADS";
                var param = new DynamicParameters();
                param.Add("@LeadsId", _obj.leadId);
                param.Add("@LEADNAME", _obj.leadName);
                param.Add("@leadvalue", Convert.ToDecimal(_obj.leadValue));
                param.Add("@ASSIGNUSER", _obj.assignUser);
                param.Add("@PIPEID", _obj.pipeId);
                param.Add("@STAGEID", _obj.stageId);
                param.Add("@CREATEDBY", _obj.createdBy);
                param.Add("@ORGID", _obj.orgId);
               object Result = await Connection.ExecuteScalarAsync<object>(query, param, commandType: CommandType.StoredProcedure, transaction: Transaction);
               return Result.ToString();

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<dynamic> DirectLeadAddAsync(DirectLeadDTO _obj)
        {
            try
            {

                var query = "directAddLead";
                var param = new DynamicParameters();
                param.Add("@leadName", _obj.leadName);
                param.Add("@CreatedBy", _obj.createdBy);
                param.Add("@orgId", _obj.orgId);
                var Result = await Connection.QueryAsync<dynamic>(query, param, commandType: CommandType.StoredProcedure, transaction: Transaction);
                return Result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<LeadInfoDTO> LeadDetailsByLeadIdAsync(Guid LeadId)
        {
            try
            {
                var query = "getLeadByLeadId";
                var param = new DynamicParameters();
                param.Add("@leadId", LeadId);
                var Result = await Connection.QueryAsync<LeadInfoDTO>(query, param, commandType: CommandType.StoredProcedure, transaction: Transaction);
                return Result.First();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<List<LeadListViewDTO>> ListViewAsync(Guid pipeId)
        {
            try
            {
                List<LeadListViewDTO> listViewDetails = new List<LeadListViewDTO>() ;

                var query = "GETALLSTAGE";
                var param = new DynamicParameters();
                param.Add("@PIPEID", Convert.ToString(pipeId));
                var Result = await Connection.QueryAsync<StageDTO>(query, param, commandType: CommandType.StoredProcedure, transaction: Transaction);
                foreach(var stage in Result.ToList())
                {
                    LeadListViewDTO newitem = new LeadListViewDTO ();
                    newitem.stageDetails  = new StageDTO();
                    newitem.stageDetails.stageId = stage.stageId;
                    newitem.stageDetails.stageName = stage.stageName;
                    newitem.stageDetails.sequenceNumber = stage.sequenceNumber;

                    var Leadquery = "getLeadsById";
                    var Leadparam = new DynamicParameters();
                    Leadparam.Add("@pipeId", Convert.ToString(pipeId));
                    Leadparam.Add("@stageid", Convert.ToString(stage.stageId));
                    var LeadDetails = await Connection.QueryAsync<LeadInfoDTO>(Leadquery, Leadparam, commandType: CommandType.StoredProcedure, transaction: Transaction);
                    newitem.leadDetails = new List<LeadInfoDTO>();
                    foreach (var lead in LeadDetails.ToList())
                    {
                        
                        newitem.leadDetails.Add(lead);
                    }
                    listViewDetails.Add(newitem);

                }
                

                return listViewDetails;


            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

       

        public async Task MoveLeadAsync(string stageId, string leadId,string ModifiedBy)
        {
            try
            {

                var query = "MoveLead";
                var param = new DynamicParameters();
                param.Add("@leadId", leadId);
                param.Add("@stageId", stageId);
                param.Add("@@modifiedby", ModifiedBy);
                await Connection.ExecuteScalarAsync<object>(query, param, commandType: CommandType.StoredProcedure, transaction: Transaction);
                

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<List<todoList>> TodoListAsync(Guid LeadId)
        {
            try
            {
                var query = "TodoList";
                var param = new DynamicParameters();
                param.Add("@leadId", Convert.ToString(LeadId));
                var Result = await Connection.QueryAsync<todoList>(query, param, commandType: CommandType.StoredProcedure, transaction: Transaction);
                return Result.ToList();
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        public async Task UpdateTodoAsync(TodoDTO _obj)
        {
            try
            {
                var query = "UpdateTodo";
                var param = new DynamicParameters();
                param.Add("@todoid", _obj.todoId);
                param.Add("@TodoName", _obj.todoName);
                param.Add("@tododate", _obj.todoDate != string.Empty ? DateTime.Parse(_obj.todoDate) : DateTime.Parse("1/1/1999"));
                param.Add("@todoTime", _obj.todoTime);
                param.Add("@Leadid", _obj.leadId);
                param.Add("@todoType", _obj.todoType);
                param.Add("@modifiedby", _obj.createdBy);
                await Connection.QueryAsync<todoList>(query, param, commandType: CommandType.StoredProcedure, transaction: Transaction);
                
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task UpdateTodoStatusAsync(Guid TodoId, int updateFlag,int status, Guid updatedBy)
        {
            try
            {
                var query = "updateTodoStatus";
                var param = new DynamicParameters();
                param.Add("@todoid", Convert.ToString(TodoId));
                param.Add("@updateFlag", updateFlag);
                param.Add("@status", status);
                param.Add("@modifiedby", updatedBy);

                await Connection.QueryAsync<todoList>(query, param, commandType: CommandType.StoredProcedure, transaction: Transaction);
                
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
