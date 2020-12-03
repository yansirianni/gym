using Academia.Database;
using Newtonsoft.Json;

namespace Gym.Models
{
    public class CadastroCliente
    {
        [JsonProperty("usuario")]
        public string Usuario { get; set; }

        [JsonProperty("senha")]
        public string Senha { get; set; }

        [JsonProperty("nome")]
        public string Nome { get; set; }

        [JsonProperty("cpf")]
        public string Cpf { get; set; }

        [JsonProperty("identidade")]
        public string Identidade { get; set; }

        [JsonProperty("dataNascimento")]
        public string DataNascimento { get; set; }

        [JsonProperty("cartao")]
        public string Cartao { get; set; }

        [JsonProperty("titularCartao")]
        public string TitularCartao { get; set; }

        public CadastroCliente()
        {

        }

        public CadastroCliente(ClienteTable cliente, LoginTable login)
        {
            Usuario = login.usuario;
            Senha = login.senha;
            Nome = cliente.nome;
            Cpf = cliente.cpf;
            Identidade = cliente.identidade;
            DataNascimento = cliente.data_nascimento;
            Cartao = cliente.cartao;
            TitularCartao = cliente.titular_cartao;
        }

        public CadastroCliente(string usuario, string senha, string nome, string cpf, string identidade, string dataNascimento, string cartao, string titularCartao)
        {
            Usuario = usuario;
            Senha = senha;
            Nome = nome;
            Cpf = cpf;
            Identidade = identidade;
            DataNascimento = dataNascimento;
            Cartao = cartao;
            TitularCartao = titularCartao;
        }
    }
}
