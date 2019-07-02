using System.Collections.Generic;

namespace Backend.Model
{
    public class Team
    {
        public List<TeamMember> Members { get; set; } = new List<TeamMember>();
        public string TeamName { get; set; }
    }
}