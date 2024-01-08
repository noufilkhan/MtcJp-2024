using System.ComponentModel.DataAnnotations;

namespace DatabaseApi;

public class ChangePasswordDto
{
    [Required]
    public string Username { get; set; }

    [Required]
    public string OldPassword { get; set; }

    [Required]
    public string NewPassword { get; set; }

}
