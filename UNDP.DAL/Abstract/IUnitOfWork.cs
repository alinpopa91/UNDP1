using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace UNDP.DAL.Abstract
{
    public interface IUnitOfWork : IDisposable
    {
        IRepository<TEntity> CreateGenericRepository<TEntity>() where TEntity : class;

        IUserRepository UserRepository { get; }
        ITeamRepository TeamRepository { get; }
        Task<int> Commit();
    }
}
