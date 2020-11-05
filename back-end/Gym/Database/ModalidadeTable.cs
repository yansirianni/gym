using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Academia.Database
{
    [Table("Modalidade")]
	public class ModalidadeTable
    {
		[Key]
		public int modalidade_id { get; set; }
		public string nome { get; set; }		
	}
}
