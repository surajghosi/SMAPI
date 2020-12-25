using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TMS.Dapper.Interface;
using TMS.DataEntities.ContactDTO;

namespace TMS.Dapper.Services
{
    public class ContactService : RepositoryBase, IContact
    {
        public ContactService(IDbTransaction transaction)
           : base(transaction)
        {
        }

        public async Task<string> AddContactDetails(ContactDTO _obj)
        {
            try
            {

                var query = "AddContactDetails";
                var param = new DynamicParameters();
                param.Add("@contactName", _obj.contactName);
                param.Add("@ContactDesignation", _obj.contactDesignation);
                param.Add("@contactEmail", _obj.contactEmail);
                param.Add("@contactPhone", _obj.contactPhone);
                param.Add("@contactAddress", _obj.contactAddress);
                param.Add("@contactOrg", _obj.contactOrg);
                param.Add("@craetedBy", _obj.createdBy);
                param.Add("@leadId", _obj.leadId);
                object Result = await Connection.ExecuteScalarAsync<object>(query, param, commandType: CommandType.StoredProcedure, transaction: Transaction);
                return Result.ToString();


            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task DeleteContact(Guid contactId, Guid updatedBy)
        {
            try
            {

                var query = "DeleteContact";
                var param = new DynamicParameters();
                param.Add("@contactid", contactId);
                param.Add("@modifiedBy", updatedBy);
                await Connection.ExecuteScalarAsync<object>(query, param, commandType: CommandType.StoredProcedure, transaction: Transaction);

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<List<ContactDTO>> GetContactDetailsByIdAsync(Guid leadId)
        {
            try
            {

                var query = "GetContactDetailsByLeadId";
                var param = new DynamicParameters();
                param.Add("@leadId", leadId);
                var Result = await Connection.QueryAsync<ContactDTO>(query, param, commandType: CommandType.StoredProcedure, transaction: Transaction);
                return Result.ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
