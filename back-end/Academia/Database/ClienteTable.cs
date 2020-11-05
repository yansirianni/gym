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
		public string data_nascimento { get; set; }
		public string cartao { get; set; }
		public string titular_cartao { get; set; }
	}
}
