using Gym.Models;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Academia.Database
{
    [Table("FichaMusculacao")]
    public class FichaMusculacaoTable
    {
        [Key]
        public int ficha_musculacao_id { get; set; }
        public string exercicio { get; set; }
        public string musculos { get; set; }
        public string repeticoes { get; set; }

        [ForeignKey("cliente_id")]
        public int cliente_id { get; set; }

        public FichaMusculacaoTable()
        {

        }

        public FichaMusculacaoTable(FichaMusculacao ficha, int cliente_id)
        {
            this.exercicio = ficha.Exercicio;
            this.musculos = ficha.Musculos;
            this.repeticoes = ficha.Repeticoes;
            this.cliente_id = cliente_id;
        }
    }
}
