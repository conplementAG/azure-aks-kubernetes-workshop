using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Backend.Load;
using Backend.Model;
using Backend.Repository;
using Microsoft.AspNetCore.Mvc;

namespace Backend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoadController : ControllerBase
    {
        [HttpPost("cpu")]
        public ActionResult GenerateCPULoad(int percentage, int durationInSeconds)
        {
            if (percentage < 0 || percentage > 100)
            {
                throw new ArgumentException("percentage");
            }

            if(durationInSeconds <= 0)
            {
                throw new ArgumentException("durationInSeconds");
            }

            new CPULoadGenerator().GenerateLoad(percentage, durationInSeconds);

            return Ok();
        }
    }
}
