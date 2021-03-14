using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using UNDP.BLL.Services;

namespace UNDP.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TeamController : ControllerBase
    {
        private ITeamService _teamService;
        public TeamController(ITeamService teamService)
        {
            _teamService = teamService;
        }

        [AllowAnonymous]
        [HttpGet]
        public async Task<IActionResult> Get()
        {
            var result = await _teamService.GetAllTeams();
            return Ok(result);
        }

        [Authorize(Roles = "Manager")]
        [HttpGet("ManagerDecision/{teamId}/{decision}")]
        public async Task<IActionResult> ManagerDecision(int teamId, int decision)
        {
            var success = await _teamService.DecideAsManager(teamId, decision);
            return Ok(success);
        }

        [Authorize(Roles = "Director")]
        [HttpGet("DirectorDecision/{teamId}/{decision}")]
        public async Task<IActionResult> DirectorDecision(int teamId, int decision)
        {
            var success = await _teamService.DecideAsDirector(teamId, decision);
            return Ok(success);
        }

    }
}