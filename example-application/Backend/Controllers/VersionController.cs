using System;
using Microsoft.AspNetCore.Mvc;

namespace Backend.Controllers
{
    [Route("api/version")]
    [ApiController]
    public class VersionController : ControllerBase
    {
        private const string DEFAULT_VERSION = "0.0.0.0";

        [HttpGet]
        public ActionResult<Version> Get()
        {
            var versionString = Environment.GetEnvironmentVariable("VERSION");
            
            Version version;
            if(!Version.TryParse(versionString, out version))
            {
                Version.TryParse(DEFAULT_VERSION, out version);
            }
            return version;
        }
    }
}
