using System;
using System.Collections.Generic;
using System.Text;
using UNDP.DAL.Context;

namespace UNDP.BLL.Contracts
{
    public class TeamRS
    {
        public Team Team { get; set; }
        public List<TeamMember> TeamMembers { get; set; }
    }
}
