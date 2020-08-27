using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;

namespace TMS.API
{
    public class Program
    {
        public static void Main(string[] args)
        {
            CreateWebHostBuilder(args).Build().Run();
        }

        public static IWebHostBuilder CreateWebHostBuilder(string[] args) =>
            WebHost.CreateDefaultBuilder(args)
             .ConfigureLogging(logBuilder =>
             {
                 logBuilder.ClearProviders(); // removes all providers from LoggerFactory
                 logBuilder.AddConsole();
                 logBuilder.AddTraceSource("Information, ActivityTracing"); // Add Trace listener provider
             }).UseStartup<Startup>();
    }
}
