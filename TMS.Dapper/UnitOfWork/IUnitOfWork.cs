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
        
        IStage Stage { get; }
        IAdvanceLeadCreator AdvanceLeadCreator { get; }
        IContact Contact { get; }
        INotes Notes { get; }
        IFile Files { get; }
        IProduct Product { get; }
        ISource Source { get; }
        IManageLeadAccess ManageLeadAccess { get; }
        IZone Zone { get; }
        void Commit();
    }
}
