using Newtonsoft.Json;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Academia.Database
{
    [Table("Login")]
	public class LoginTable
    {
		[Key]
		public int login_id { get; set; }
		public string usuario { get; set; }
		public string senha { get; set; }
		
		[ForeignKey("cliente_id")]
		public int? cliente_id { get; set; }
		
		[ForeignKey("secretario_id")]
		public int? secretario_id { get; set; }
		
		[ForeignKey("medico_id")]
		public int? medico_id { get; set; }
		
		[ForeignKey("professor_id")]
		public int? professor_id { get; set; }
	}
}
