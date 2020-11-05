using Academia.Database;
using Academia.Services.Interfaces;
using System.Linq;

namespace Academia.Services
{
    public class AccountService : IAccountService
    {
        public LoginTable VerifyLoginAsync(string usuario, string senha)
        {
            var db = new AcademiaContext();

            var login = db.LoginTable.Where(s =>
                            s.usuario == usuario &&
                            s.senha == senha).FirstOrDefault();

            return login;
        }

        public void CreateLoginAsync(string tipo, string tipo_id, string usuario, string senha)
        {

        }
    }
}
