using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Academia.Database
{
    [Table("Turma_Cliente")]
    public class Turma_ClienteTable
    {
        [Key]
        public int turma_cliente_id { get; set; }

        [ForeignKey("cliente_id")]
        public int cliente_id { get; set; }

        [ForeignKey("turma_id")]
        public int turma_id { get; set; }
    }
}
