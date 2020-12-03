using Academia.Database;
using Newtonsoft.Json;

namespace Gym.Models
{
    public class FichaMedica
    {
        public FichaMedica()
        {

        }

        public FichaMedica(FichaMedicaTable ficha, string cpf)
        {
            Cpf = cpf;
            Peso = ficha.peso;
            Altura = ficha.altura;
            Pressao = ficha.pressao;
            Gordura = ficha.gordura;
            MassaMagra = ficha.massa_magra;
            Imc = ficha.imc;
            Aprovado = ficha.aprovado;
        }

        public FichaMedica(string cpf, string peso, string altura, string pressao, string gordura, string massaMagra, string imc, bool aprovado)
        {
            Cpf = cpf;
            Peso = peso;
            Altura = altura;
            Pressao = pressao;
            Gordura = gordura;
            MassaMagra = massaMagra;
            Imc = imc;
            Aprovado = aprovado;
        }

        [JsonProperty("cpf")]
        public string Cpf { get; set; }

        [JsonProperty("peso")]
        public string Peso { get; set; }

        [JsonProperty("altura")]
        public string Altura { get; set; }

        [JsonProperty("pressao")]
        public string Pressao { get; set; }

        [JsonProperty("gordura")]
        public string Gordura { get; set; }

        [JsonProperty("massaMagra")]
        public string MassaMagra { get; set; }

        [JsonProperty("imc")]
        public string Imc { get; set; }

        [JsonProperty("aprovado")]
        public bool Aprovado { get; set; }
    }
}
