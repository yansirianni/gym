using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Academia.Database
{
    [Table("Plano")]
    public class PlanoTable
    {
        [Key]
        public int plano_id { get; set; }
        public string tipo { get; set; }
        public int vezes_semana { get; set; }
        public string preco { get; set; }

        [ForeignKey("modalidade_id")]
        public int modalidade_id { get; set; }
    }
}
