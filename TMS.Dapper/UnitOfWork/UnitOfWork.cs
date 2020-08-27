using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using TMS.Dapper.Infrastructure;
using TMS.Dapper.Interface;
using TMS.Dapper.Services;

namespace TMS.Dapper.UnitOfWork
{
   public class UnitOfWork :IUnitOfWork,IDisposable
    {
        private IDbConnection _connection;
        private IDbTransaction _transaction;
        private IUserManagement _userManagement;
        private ICommon _common;
        private IUser _user;
        private IPipeLine _pipeLine;
        private bool _disposed;
       
        public UnitOfWork(string connectionString)
        {
            
            _connection = new SqlConnection(connectionString);
            _connection.Open();
            _transaction = _connection.BeginTransaction();
        }
        public IUserManagement UserManagement => _userManagement ?? (_userManagement = new UserManagementService(_transaction));
        public IUser User => _user ?? (_user = new UserService(_transaction));
        public ICommon Common => _common ?? (_common = new CommonService(_transaction));
        public IPipeLine PipeLine => _pipeLine ?? (_pipeLine = new PipeLineService(_transaction));
        public void Commit()
        {
            try
            {
                _transaction.Commit();
            }
            catch
            {
                _transaction.Rollback();
                throw;
            }
            finally
            {
                _transaction.Dispose();
                _transaction = _connection.BeginTransaction();
                resetRepositories();
            }
        }

        private void resetRepositories()
        {
            _userManagement = null;
            //_catRepository = null;
        }

        public void Dispose()
        {
            dispose(true);
            GC.SuppressFinalize(this);
        }

        private void dispose(bool disposing)
        {
            if (!_disposed)
            {
                if (disposing)
                {
                    if (_transaction != null)
                    {
                        _transaction.Dispose();
                        _transaction = null;
                    }
                    if (_connection != null)
                    {
                        _connection.Dispose();
                        _connection = null;
                    }
                }
                _disposed = true;
            }
        }

        ~UnitOfWork()
        {
            dispose(false);
        }
    }

}
