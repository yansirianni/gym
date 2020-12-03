using Academia.Database;
using Gym.Models;
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
        public IActionResult GetCliente([FromQuery] string cpf)
        {
            var db = new AcademiaContext();

            var cliente = db.ClienteTable.Where(c => c.cpf == cpf).FirstOrDefault();

            return Ok(cliente);
        }

        [HttpGet]
        [Route("cliente/login")]
        public IActionResult GetCliente([FromQuery] string login, [FromQuery] string senha)
        {
            var db = new AcademiaContext();

            var loginCliente = db.LoginTable.Where(l => l.usuario == login && l.senha == senha).FirstOrDefault();

            var cliente = db.ClienteTable.Where(c => c.cliente_id == loginCliente.cliente_id).FirstOrDefault();

            var cadatroCliente = new CadastroCliente(cliente, loginCliente);

            return Ok(cadatroCliente);
        }

        [HttpPost]
        [Route("cliente")]
        public IActionResult CadastroCliente([FromBody] CadastroCliente cadastroCliente)
        {
            var db = new AcademiaContext();

            //Cria cliente ou atualiza se ja existir            

            var cliente = db.ClienteTable.Where(c => c.cpf == cadastroCliente.Cpf).FirstOrDefault();

            if(cliente == null)
            {
                cliente = new ClienteTable(cadastroCliente);
                db.ClienteTable.Add(cliente);                
            }
            else
            {
                var clienteId = cliente.cliente_id;

                cliente.nome = cadastroCliente.Nome;
                cliente.cpf = cadastroCliente.Cpf;
                cliente.identidade = cadastroCliente.Identidade;
                cliente.data_nascimento = cadastroCliente.DataNascimento;
                cliente.cartao = cadastroCliente.Cartao;
                cliente.titular_cartao = cadastroCliente.TitularCartao;


                db.ClienteTable.Update(cliente);
            }
                    
            db.SaveChanges();

            cliente = db.ClienteTable.Where(c => c.cpf == cadastroCliente.Cpf).FirstOrDefault();

            //cadastra login do cliente - ou atualiza se ja existir
                      

            var login = db.LoginTable.Where(c => c.cliente_id == cliente.cliente_id).FirstOrDefault();

            if(login == null)
            {
                login = new LoginTable(cadastroCliente, cliente.cliente_id);
                db.LoginTable.Add(login);
            }
            else
            {
                login.usuario = cadastroCliente.Usuario;
                login.senha = cadastroCliente.Senha;

                db.LoginTable.Update(login);
            }

            db.SaveChanges();

            return Ok();
        }    
    }
}
