using Newtonsoft.Json;

namespace Gym.Models
{
    public class FichaMusculacao
    {
        [JsonProperty("cpfCliente")]
        public string CpfCliente { get; set; }

        [JsonProperty("exercicio")]
        public string Exercicio { get; set; }

        [JsonProperty("musculos")]
        public string Musculos { get; set; }

        [JsonProperty("repeticoes")]
        public string Repeticoes { get; set; }
    }
}
