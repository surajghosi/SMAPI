using System;
using System.Collections.Generic;
using System.Text;
using TMS.Dapper.Infrastructure;
using TMS.Dapper.Interface;

namespace TMS.Dapper.UnitOfWork
{
   public interface IUnitOfWork
    {
        IUserManagement UserManagement { get; }
        IUser User { get; }
        ICommon Common { get; }
        IPipeLine PipeLine { get; }

        void Commit();
    }
}
