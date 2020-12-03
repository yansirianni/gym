using Gym.Models;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Academia.Database
{
    [Table("FichaMedica")]
	public class FichaMedicaTable
    {
		[Key]
		public int ficha_medica_id { get; set; }
		public string peso { get; set; }
		public string altura { get; set; }
		public string pressao { get; set; }
		public string gordura { get; set; }
		public string massa_magra { get; set; }
		public string imc { get; set; }
		public bool aprovado { get; set; }

		[ForeignKey("cliente_id")]
		public int cliente_id { get; set; }

        public FichaMedicaTable()
        {

        }

        public FichaMedicaTable(FichaMedica ficha, int cliente_id)
        {
            this.peso = ficha.Peso;
            this.altura = ficha.Altura;
            this.pressao = ficha.Pressao;
            this.gordura = ficha.Gordura;
            this.massa_magra = ficha.MassaMagra;
            this.imc = CalculaImc(ficha.Peso, ficha.Altura);
            this.aprovado = ficha.Aprovado;
            this.cliente_id = cliente_id;
        }

        public string CalculaImc(string peso, string altura)
        {
            var p = int.Parse(peso);
            var a = double.Parse(altura);

            var imc = (p / (a * a));

            return imc.ToString();
        }
    }
}
