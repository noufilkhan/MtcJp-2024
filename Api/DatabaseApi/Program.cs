using DatabaseApi.Models;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();

// builder.Services.AddDbContext<VehiclesContext>(opt => 
//         {
//             opt.UseSqlServer(config.GetConnectionString("DefaultConnection"));
//         }
//         );
//builder.Services.AddAplicationServices(builder.Configuration);
//builder.Services.AddIdentityServices(builder.Configuration);

var app = builder.Build();

app.UseAuthorization();

app.MapControllers();

app.Run();
