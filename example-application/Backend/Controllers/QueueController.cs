using System;
using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;
using Prometheus;

namespace Backend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class QueueController : ControllerBase
    {
        // Custom Metric:
        private static readonly Counter CustomQueueCount = Metrics.CreateCounter("custom_queue_count_total", "Number of entries in the queue");

        private static readonly List<DateTime> QUEUE = new List<DateTime>();
        
        [HttpPost]
        public ActionResult<int> Add()
        {
            QUEUE.Add(DateTime.UtcNow);
            CustomQueueCount.Inc();

            return QUEUE.Count;
        }
        
        [HttpGet]
        public ActionResult<IEnumerable<DateTime>> Get()
        {
            return Ok(QUEUE);
        }
    }
}
