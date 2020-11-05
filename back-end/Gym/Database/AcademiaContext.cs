using Microsoft.EntityFrameworkCore;

namespace Academia.Database
{
    public class AcademiaContext : DbContext
    {
        public DbSet<SecretariaTable> SecretariaTable { get; set; }

        public DbSet<ModalidadeTable> ModalidadeTable { get; set; }

        public DbSet<MedicoTable> MedicoTable { get; set; }

        public DbSet<ProfessorTable> ProfessorTable { get; set; }

        public DbSet<PlanoTable> PlanoTable { get; set; }

        public DbSet<TurmaTable> TurmaTable { get; set; }

        public DbSet<ClienteTable> ClienteTable { get; set; }

        public DbSet<FichaMedicaTable> FichaMedicaTable { get; set; }

        public DbSet<FichaMusculacaoTable> FichaMusculacaoTable { get; set; }

        public DbSet<Turma_ClienteTable> Turma_ClienteTable { get; set; }

        public DbSet<LoginTable> LoginTable { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseNpgsql("User ID=postgres;Password=admin;Server=localhost;Port=5432;Database=AcademiaDb;Integrated Security=true;Pooling=true;");
        }
    }
}

