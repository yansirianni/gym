using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Academia.Database
{
	[Table("Secretario")]
	public class SecretariaTable
	{
		[Key]
		public int secretario_id { get; set; }
		public string nome { get; set; }
		public string cpf { get; set; }		
	}
}
