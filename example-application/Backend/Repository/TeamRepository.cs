using Backend.Model;
using System.Collections.Generic;

namespace Backend.Repository
{
    public class TeamRepository
    {
        public Team CreateDeveloperTeam()
        {
            return new Team()
            {
                TeamName = "devs",
                Members = new List<TeamMember>()
                 {
                      new TeamMember() { Name = "Michelle", Role = "Frontend Developer"},
                      new TeamMember() { Name = "Sarah", Role = "Frontend Developer"},
                      new TeamMember() { Name = "Brian", Role = "Backend Developer"},
                      new TeamMember() { Name = "Sean", Role = "Backend Developer"},
                      new TeamMember() { Name = "Keith", Role = "UX Designer"}
                 }
            };
        }

        public Team CreateDevOpsTeam()
        {
            return new Team()
            {
                TeamName = "devops",
                Members = new List<TeamMember>()
                 {
                      new TeamMember() { Name = "Michelle", Role = "Frontend Developer"},
                      new TeamMember() { Name = "Sarah", Role = "Frontend Developer"},
                      new TeamMember() { Name = "Brian", Role = "Backend Developer"},
                      new TeamMember() { Name = "Sean", Role = "Backend Developer"},
                      new TeamMember() { Name = "Keith", Role = "UX Designer"},
                      new TeamMember() {Name = "Andrea", Role= "Full Stack Developer"},
                      new TeamMember() {Name = "Caroline", Role= "DevOps Engineer"},
                      new TeamMember() {Name = "Molly", Role= "DevOps Engineer"}
                 }
            };
        }

        public Team CreateOperationsTeam()
        {
            return new Team()
            {
                TeamName = "ops",
                Members = new List<TeamMember>()
                 {
                      new TeamMember() { Name = "Tracey", Role = "Cloud Operations Engineer"},
                      new TeamMember() { Name = "Sarah", Role = "High Performance Operations Engineer"}
                 }
            };
        }
    }
}
