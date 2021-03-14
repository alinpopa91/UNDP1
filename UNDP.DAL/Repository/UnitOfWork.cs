using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using UNDP.DAL.Abstract;
using UNDP.DAL.Context;

namespace UNDP.DAL.Repository
{
    public class UnitOfWork : IUnitOfWork, IDisposable
    {
        private readonly UNDPContext _dbContext;

        public UnitOfWork()
        {
            _dbContext = new UNDPContext();
        }

        public IRepository<TEntity> CreateGenericRepository<TEntity>()
            where TEntity : class
        {
            return new Repository<TEntity>(_dbContext);
        }

        public async Task<int> Commit()
        {
            return await _dbContext.SaveChangesAsync();
        }

        public void Dispose()
        {
            _teamRepository?.Dispose();
            _teamRepository = null;

            _userRepository?.Dispose();
            _userRepository = null;

            _dbContext?.Dispose();
            GC.SuppressFinalize(this);
        }

        private ITeamRepository _teamRepository;
        public ITeamRepository TeamRepository
        {
            get { return _teamRepository ?? (_teamRepository = new TeamRepository(_dbContext)); }
        }

        private IUserRepository _userRepository;
        public IUserRepository UserRepository
        {
            get { return _userRepository ?? (_userRepository = new UserRepository(_dbContext)); }
        }

    }
}
