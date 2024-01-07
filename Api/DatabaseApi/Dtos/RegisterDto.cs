using System.ComponentModel.DataAnnotations;

namespace DatabaseApi.Dtos;

public class RegisterDto
{
    public int Id { get; set; }

    [Required]
    public string Username { get; set; }

    [Required]
    [StringLength(8,MinimumLength =4)]
    public string Password { get; set; }

}
