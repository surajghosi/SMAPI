
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Text;

namespace TMS.Dapper.Infrastructure
{
    public class ConnectionFactory : IConnectionFactory
    {
        private IDbConnection _connection;
        private readonly IOptions<TMSConfiguration> _configs;

        public ConnectionFactory(IOptions<TMSConfiguration> Configs)
        {
            _configs = Configs;
        }

        IDbConnection IConnectionFactory.GetConnection
        {
            get
            {
                
                var factory = DbProviderFactories.GetFactory("System.Data.SqlClient");
                var conn = factory.CreateConnection();
                conn.ConnectionString = _configs.Value.DbConnectionString;
                conn.Open();
                return conn;
            }
            set => throw new NotImplementedException();
        }

       
    }
}
