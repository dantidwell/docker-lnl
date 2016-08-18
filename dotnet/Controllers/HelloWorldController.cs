using Microsoft.AspNetCore.Mvc;

namespace DockerLnl.Controllers { 
  public class HelloWorldController : Controller {
    [HttpGet]
    [Route("hello/world/")] 
    public string SayHelloWorld() { 
      return "Hello, world!\n";
    }
  }
}