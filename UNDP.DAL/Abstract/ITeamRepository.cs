using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using UNDP.BLL.Contracts;
using UNDP.DAL.Context;

namespace UNDP.DAL.Abstract
{
    public interface ITeamRepository : IRepository<Team>
    {
        Task<List<TeamRS>> GetAllTeams();

        Task<bool> DecideAsManager(int teamId, int approvial);
        Task<bool> DecideAsDirector(int teamId, int approvial);
    }
}
