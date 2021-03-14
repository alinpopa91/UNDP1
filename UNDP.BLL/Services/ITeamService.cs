using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using UNDP.BLL.Contracts;
using UNDP.DAL.Context;

namespace UNDP.BLL.Services
{
    public interface ITeamService
    {
        Task<List<TeamRS>> GetAllTeams();
        Task<bool> DecideAsManager(int teamId, int approvial);
        Task<bool> DecideAsDirector(int teamId, int approvial);
    }
}
