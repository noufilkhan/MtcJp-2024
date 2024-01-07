using DatabaseApi.Entities;

namespace DatabaseApi.Interfaces;

public interface ITokenService
{
    string CreateToken (AppUser user);
}
