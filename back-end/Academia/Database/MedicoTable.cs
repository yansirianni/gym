using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Academia.Database
{
    [Table("Medico")]
    public class MedicoTable
    {
        [Key]
        public int medico_id { get; set; }
        public string nome { get; set; }
        public string cpf { get; set; }
    }
}
