using System.Diagnostics;
using System.Threading;

namespace Backend.Load
{
    public class CPULoadGenerator
    {
        public void GenerateLoad(int percentage, int durationInSeconds)
        {
            Stopwatch totalTimeWatch = new Stopwatch();
            Stopwatch percentageWatch = new Stopwatch();
            percentageWatch.Start();
            totalTimeWatch.Start();
            while (true)
            {
                // Make the loop go on for "percentage" milliseconds then sleep the 
                // remaining percentage milliseconds. So 40% utilization means work 40ms and sleep 60ms
                if (percentageWatch.ElapsedMilliseconds > percentage)
                {
                    Thread.Sleep(100 - percentage);
                    percentageWatch.Reset();
                    percentageWatch.Start();
                }

                if (totalTimeWatch.Elapsed.TotalSeconds >= durationInSeconds)
                {
                    break;
                }
            }
        }
    }
}
