using System;
using Microsoft.AspNetCore.Hosting;

namespace DockerLnl {
  public class Program {
    public static void Main(string[] args) {
      var env = Environment.GetEnvironmentVariable("DOTNET_ENV");
      var port = env=="docker" ? 80 : 3001;

      var host = new WebHostBuilder()
        .UseKestrel()
        .UseStartup<Startup>()
        .UseUrls($"http://0.0.0.0:{port}")
        .Build();
      host.Run();
    }
  }
}
