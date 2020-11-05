using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Academia.Database
{
    [Table("Professor")]
    public class ProfessorTable
    {
        [Key]
        public int professor_id { get; set; }
        public string nome { get; set; }
        public string cpf { get; set; }
    }
}
