using Gym.Models;
using Newtonsoft.Json;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Academia.Database
{
    [Table("Cliente")]
	public class ClienteTable
    {        
		[Key]
		public int cliente_id { get; set; }
		public string nome { get; set; }
		public string cpf { get; set; }
		public string identidade { get; set; }

        [JsonProperty("dataNascimento")]
        public string data_nascimento { get; set; }
		public string cartao { get; set; }

        [JsonProperty("titularCartao")]
        public string titular_cartao { get; set; }

        public ClienteTable()
        {

        }

        public ClienteTable(string cpf)
        {
            this.cpf = cpf;
        }

        public ClienteTable(CadastroCliente cliente) 
        {
            this.nome = cliente.Nome;
            this.cpf = cliente.Cpf;
            this.identidade = cliente.Identidade;
            this.data_nascimento = cliente.DataNascimento;
            this.cartao = cliente.Cartao;
            this.titular_cartao = cliente.TitularCartao;
        }

        public ClienteTable(CadastroCliente cliente, int clienteId)
        {
            this.cliente_id = clienteId;
            this.nome = cliente.Nome;
            this.cpf = cliente.Cpf;
            this.identidade = cliente.Identidade;
            this.data_nascimento = cliente.DataNascimento;
            this.cartao = cliente.Cartao;
            this.titular_cartao = cliente.TitularCartao;
        }
    }
}
