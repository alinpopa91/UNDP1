using System;
using System.Collections.Generic;

#nullable disable

namespace UNDP.DAL.Context
{
    public partial class Team
    {
        public Team()
        {
            TeamMembers = new HashSet<TeamMember>();
        }

        public int Id { get; set; }
        public string TeamName { get; set; }
        public string TeamDescription { get; set; }
        public int ApprovedByManager { get; set; }
        public int ApprovedByDirector { get; set; }

        public virtual ICollection<TeamMember> TeamMembers { get; set; }
    }
}
