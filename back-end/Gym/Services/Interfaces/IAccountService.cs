using Academia.Database;

namespace Academia.Services.Interfaces
{
    public interface IAccountService
    {
        LoginTable VerifyLoginAsync(string usuario, string senha);

        void CreateLoginAsync(string tipo, string tipo_id, string usuario, string senha);
    }
}
