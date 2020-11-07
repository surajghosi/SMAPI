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
        private IStage _stageManagement;
        private IAdvanceLeadCreator _advanceLeadCreator;
        private IContact _contact;
        private INotes _notes;
        private IFile _files;
        private IProduct _product;
        private ISource _source;
        private IManageLeadAccess _manageLeadAccess;
        private IZone _zone;
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
        public IStage Stage => _stageManagement ?? (_stageManagement = new StageService(_transaction));
        public IAdvanceLeadCreator AdvanceLeadCreator => _advanceLeadCreator ?? (_advanceLeadCreator = new AdvancedLeadCreatorService(_transaction));
        public IContact Contact => _contact ?? (_contact = new ContactService(_transaction));
        public INotes Notes => _notes ?? (_notes = new NotesService(_transaction));
        public IFile Files => _files ?? (_files = new FilesService(_transaction));
        public IProduct Product => _product ?? (_product = new ProductService(_transaction));
        public ISource Source => _source ?? (_source = new SourceService(_transaction));
        public IManageLeadAccess ManageLeadAccess => _manageLeadAccess ?? (_manageLeadAccess = new LeadManageAccessService(_transaction));
        public IZone Zone => _zone ?? (_zone = new ZoneService(_transaction));


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
            _pipeLine = null;
            _product = null;
            _manageLeadAccess = null;
            _contact = null;
            _common = null;
            _files = null;
            _source = null;
            _stageManagement = null;
            _user = null;
            _zone = null;
            _advanceLeadCreator = null;
            _notes = null;
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
