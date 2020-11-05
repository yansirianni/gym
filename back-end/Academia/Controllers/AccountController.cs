using Academia.Database;
using Microsoft.AspNetCore.Mvc;
using System.Linq;

namespace Academia.Controllers
{
    [Route("api/account")]
    [ApiController]
    public class AccountController : ControllerBase
    {
        [HttpGet]
        [Route("cliente")]
        public IActionResult GetCliente()
        {
            var db = new AcademiaContext();

            var clientes = db.ClienteTable.ToList();

            return Ok(clientes);
        }

        [HttpPost]
        [Route("cliente")]
        public IActionResult CadastroCliente()
        {
            //cadastrar cliente e cadastrar login

            return null;
        }

        [HttpGet]
        [Route("medico")]
        public IActionResult GetMedicos()
        {
            var db = new AcademiaContext();

            var medicos = db.MedicoTable.ToList();

            return Ok(medicos);
        }

        [HttpPost]
        [Route("medico")]
        public IActionResult CadastroMedicos()
        {
            //cadastrar medico e cadastrar login

            return null;
        }

        [HttpGet]
        [Route("secretaria")]
        public IActionResult GetSecretarias()
        {
            var db = new AcademiaContext();

            var secretarias = db.SecretariaTable.ToList();

            return Ok(secretarias);
        }

        [HttpPost]
        [Route("secretaria")]
        public IActionResult CadastroSecretaria()
        {
            //cadastrar secretaria e cadastrar login

            return null;
        }

        [HttpGet]
        [Route("professor")]
        public IActionResult GetProfessores()
        {
            var db = new AcademiaContext();

            var professores = db.ProfessorTable.ToList();

            return Ok(professores);
        }

        [HttpPost]
        [Route("professor")]
        public IActionResult CadastroProfessor()
        {
            //cadastrar Professor e cadastrar login

            return null;
        }
    }
}
