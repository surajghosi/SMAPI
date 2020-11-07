using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using TMS.DataEntities.ContactDTO;

namespace TMS.Dapper.Interface
{
    public interface IContact
    {
        Task<string> AddContactDetails(ContactDTO _obj);
        Task DeleteContact(Guid contactId, Guid updatedBy);
        Task< List<ContactDTO>> GetContactDetailsByIdAsync(Guid leadId);

    }
}
