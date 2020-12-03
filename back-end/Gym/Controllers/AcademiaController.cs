using Academia.Database;
using Gym.Models;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
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
        public IActionResult GetExame([FromQuery] string cpf)
        {
            var db = new AcademiaContext();

            var cliente = db.ClienteTable.Where(c => c.cpf == cpf).FirstOrDefault();

            if(cliente == null)
            {
                return Ok(null);
            }

            var exame = db.FichaMedicaTable.Where(c => c.cliente_id == cliente.cliente_id).FirstOrDefault();

            var ficha = new FichaMedica(exame, cpf);

            return Ok(ficha);
        }

        [HttpPost]
        [Route("exame-medico")]
        public IActionResult CadastroExameMedico([FromBody] FichaMedica ficha)
        {
            var db = new AcademiaContext();

            //procura o cliente pelo cpf 

            var cliente = db.ClienteTable.Where(c => c.cpf == ficha.Cpf).FirstOrDefault();

            //se não exisitir cria
            if(cliente == null)
            {
                cliente = new ClienteTable(ficha.Cpf);

                db.ClienteTable.Add(cliente);

                db.SaveChanges();

                cliente = db.ClienteTable.Where(c => c.cpf == ficha.Cpf).FirstOrDefault();
            }

            var clienteId = cliente.cliente_id;

           //cria tabela e associa com o ID do cliente

           var tabelaFicha = new FichaMedicaTable(ficha, clienteId);

            db.FichaMedicaTable.Add(tabelaFicha);

            db.SaveChanges();

            return Ok();
        }

        [HttpGet]
        [Route("ficha-musculacao")]
        public IActionResult GetFichaMusculacao([FromQuery] string cpf)
        {
            var db = new AcademiaContext();

            //procurar cliente pelo cpf para pegar o id

            var cliente = db.ClienteTable.Where(c => c.cpf == cpf).FirstOrDefault();

            //pegar lista de exercicios

            var fichaMusculacao = db.FichaMusculacaoTable.Where(e => e.cliente_id == cliente.cliente_id).ToList();

            return Ok(fichaMusculacao);
        }

        [HttpPost]
        [Route("ficha-musculacao")]
        public IActionResult CadastroFichaMusculacao([FromBody] List<FichaMusculacao> fichaMusculacao)
        {
            var db = new AcademiaContext();

            //procurar cliente pelo cpf para pegar o id

            var cliente = db.ClienteTable.Where(c => c.cpf == fichaMusculacao.First().CpfCliente).FirstOrDefault();

            //inserir fichas

            foreach(var exercicio in fichaMusculacao)
            {
                var ficha = new FichaMusculacaoTable(exercicio, cliente.cliente_id);

                db.FichaMusculacaoTable.Add(ficha);
            }

            db.SaveChanges();

            return Ok();
        }        
    }
}
