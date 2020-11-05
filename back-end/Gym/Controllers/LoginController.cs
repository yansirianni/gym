using Academia.Database;
using Academia.Services.Interfaces;
using Microsoft.AspNetCore.Mvc;
using System.Linq;

namespace Academia.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoginController : ControllerBase
    {
        private readonly IAccountService _accountService;

        public LoginController(IAccountService accountService)
        {
            _accountService = accountService;
        }

        [HttpGet]
        [Route("login")]
        public IActionResult VerifyLoginAsync(string usuario, string senha)
        {

            var login = _accountService.VerifyLoginAsync(usuario, senha);

            if (login != null)
            {
                return Ok();
            }            

            return NoContent();
        }

        [HttpPost]
        [Route("login")]
        public IActionResult CreateLogin()
        {
            return null;
        }
    }
}
