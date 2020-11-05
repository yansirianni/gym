using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Academia.Database
{
    [Table("Turma")]
    public class TurmaTable
    {
        public int turma_id { get; set; }
        public string tipo { get; set; }

        [Key]
        public int vagas { get; set; }
    }
}
