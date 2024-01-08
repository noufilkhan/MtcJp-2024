using DatabaseApi.Models;

namespace DatabaseApi.Interfaces;

public interface ITokenService
{
    string CreateToken (UserInfo user);
}
