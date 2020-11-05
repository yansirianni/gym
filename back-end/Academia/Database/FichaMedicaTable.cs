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
	}
}
