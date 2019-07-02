using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Backend.Model;
using Backend.Repository;
using Microsoft.AspNetCore.Mvc;

namespace Backend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TeamController : ControllerBase
    {
        private CompanyRepository _companyRepo = new CompanyRepository();

        [HttpGet]
        public ActionResult<IEnumerable<string>> Get()
        {
            return _companyRepo.GetAvailableTeams();
        }

        [HttpGet("{name}")]
        public ActionResult<Team> Get(string name)
        {
            var team = _companyRepo.GetTeamByName(name);

            if (team == null)
            {
                return NotFound();
            }
            return team;
        }
    }
}
