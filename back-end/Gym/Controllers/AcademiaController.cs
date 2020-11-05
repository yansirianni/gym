using Academia.Database;
using Microsoft.AspNetCore.Mvc;
using System.Linq;

namespace Academia.Controllers
{
    [ApiController]
    [Route("api/academia")]
    public class AcademiaController : ControllerBase
    {
        [HttpGet]
        [Route("modalidades")]
        public IActionResult GetModalidades()
        {
            var db = new AcademiaContext();

            var modalidades = db.ModalidadeTable.ToList();

            return Ok(modalidades);
        }

        [HttpGet]
        [Route("turma")]
        public IActionResult GetTurmas()
        {
            var db = new AcademiaContext();

            var turmas = db.TurmaTable.ToList();

            return Ok(turmas);
        }

        [HttpGet]
        [Route("plano")]
        public IActionResult GetPlanos()
        {
            var db = new AcademiaContext();

            var plano = db.PlanoTable.ToList();

            return Ok(plano);
        }

        [HttpGet]
        [Route("exame-medico")]
        public IActionResult GetExames()
        {
            var db = new AcademiaContext();

            var exame = db.FichaMedicaTable.ToList();

            return Ok(exame);
        }

        [HttpPost]
        [Route("exame-medico")]
        public IActionResult CadastroExameMedico()
        {
            return null;
        }

        [HttpGet]
        [Route("ficha-musculacao")]
        public IActionResult GetFichaMusculacao()
        {
            var db = new AcademiaContext();

            var fichaMusculacao = db.FichaMusculacaoTable.ToList();

            return Ok(fichaMusculacao);
        }

        [HttpPost]
        [Route("ficha-musculacao")]
        public IActionResult CadastroFichaMusculacao()
        {
            return null;
        }        
    }
}
