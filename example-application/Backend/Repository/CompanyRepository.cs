using Backend.Model;
using System.Collections.Generic;
using System.Linq;

namespace Backend.Repository
{
    public class CompanyRepository
    {
        private List<Team> _teams = new List<Team>();

        public CompanyRepository()
        {
            var teamRepo = new TeamRepository();

            _teams.Add(teamRepo.CreateDeveloperTeam());
            _teams.Add(teamRepo.CreateDevOpsTeam());
            _teams.Add(teamRepo.CreateOperationsTeam());
        }

        public Team GetTeamByName(string name)
        {
            return _teams
                .Where(t => t.TeamName == name)
                .FirstOrDefault();
        }

        public List<string> GetAvailableTeams()
        {
            return _teams
                .Select(t => t.TeamName)
                .ToList();
        }
    }
}
