using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace TMS.Dapper.Infrastructure
{
   public interface IConnectionFactory
    {

        IDbConnection GetConnection { get; set; }

    }
}
