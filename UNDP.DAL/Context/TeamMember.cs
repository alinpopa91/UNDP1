using System;
using System.Collections.Generic;

#nullable disable

namespace UNDP.DAL.Context
{
    public partial class TeamMember
    {
        public int Id { get; set; }
        public int? TeamId { get; set; }
        public string Name { get; set; }
        public string Gender { get; set; }
        public DateTime? DateOfBirth { get; set; }
        public decimal? ContactNo { get; set; }

        public virtual Team Team { get; set; }
    }
}
