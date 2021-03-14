using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using UNDP.BLL.Contracts;
using UNDP.DAL.Abstract;
using UNDP.DAL.Context;
using System.Linq;

namespace UNDP.DAL.Repository
{
    public class TeamRepository : Repository<Team>, ITeamRepository
    {
        public TeamRepository(DbContext dbContext) : base(dbContext) { }

        public async Task<List<TeamRS>> GetAllTeams()
        {
            var result = new List<TeamRS>();
            var teams = await Context.Set<Team>().ToListAsync();
            var teamMembers = await Context.Set<TeamMember>().ToListAsync();

            foreach (var team in teams)
            {
                var teamToAdd = new TeamRS
                {
                    Team = new Team {
                        Id = team.Id,
                        TeamName = team.TeamName,
                        TeamDescription = team.TeamDescription,
                        ApprovedByDirector = team.ApprovedByDirector,
                        ApprovedByManager = team.ApprovedByManager,
                        TeamMembers = null
                    },
                    TeamMembers = teamMembers.Where(a => a.TeamId == team.Id).ToList()
                };

                result.Add(teamToAdd);
            }

            return result;

        }

        public async Task<bool> DecideAsManager(int teamId, int approvial)
        {
            var team = await Context.Set<Team>().SingleOrDefaultAsync(a => a.Id == teamId);

            if (team != null)
            {
                team.ApprovedByManager = approvial;
                return true;
            }

            return false;
        }
        
        public async Task<bool> DecideAsDirector(int teamId, int approvial)
        {
            var team = await Context.Set<Team>().SingleOrDefaultAsync(a => a.Id == teamId);

            if (team != null)
            {
                team.ApprovedByDirector = approvial;
                return true;
            }

            return false;
        }
    }
}
