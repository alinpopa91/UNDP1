using System;
using System.Collections.Generic;
using System.Text;
using UNDP.BLL.Contracts;
using UNDP.DAL.Abstract;
using UNDP.DAL.Context;
using System.Linq;
using System.Threading.Tasks;

namespace UNDP.BLL.Services
{
    public class TeamService : ITeamService
    {
        private IUnitOfWork _unitOfWork;

        public TeamService(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public async Task<List<TeamRS>> GetAllTeams()
        {
            var response = await _unitOfWork.TeamRepository.GetAllTeams();
            return response;
        }

        public async Task<bool> DecideAsManager(int teamId, int approvial)
        {
            var result =  await _unitOfWork.TeamRepository.DecideAsManager(teamId, approvial);
            await _unitOfWork.Commit();
            return await Task.FromResult(result);
        }

        public async Task<bool> DecideAsDirector(int teamId, int approvial)
        {
            var result = await _unitOfWork.TeamRepository.DecideAsDirector(teamId, approvial);
            return await Task.FromResult(result);
        }
    }
}
