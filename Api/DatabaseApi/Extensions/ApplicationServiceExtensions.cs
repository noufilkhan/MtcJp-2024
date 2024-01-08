using DatabaseApi.Interfaces;
using DatabaseApi.Services;
using DatabaseApi.Models;
using Microsoft.EntityFrameworkCore;

namespace DatabaseApi.Extensions;

public static class ApplicationServiceExtensions
{
    public static IServiceCollection AddAplicationServices(
    this IServiceCollection services, IConfiguration config)
    {
        services.AddDbContext<VehiclesContext>(opt =>
        {
            opt.UseSqlServer(config.GetConnectionString("DefaultConnection"));
        }
            );

        services.AddCors();
        services.AddScoped<ITokenService, TokenService>();
        // services.AddScoped<IUserRepository, UserRepository>();
        services.AddAutoMapper(AppDomain.CurrentDomain.GetAssemblies());
        services.AddControllersWithViews()
            .AddNewtonsoftJson(options =>
                options.SerializerSettings.ReferenceLoopHandling = 
                    Newtonsoft.Json.ReferenceLoopHandling.Ignore
        );

        return services;

    }

}
