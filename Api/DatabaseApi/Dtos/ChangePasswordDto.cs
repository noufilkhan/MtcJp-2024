using System.ComponentModel.DataAnnotations;

namespace DatabaseApi.Dtos;

public class ChangePasswordDto
{
    [Required(ErrorMessage ="Username is required")]
    public string Username { get; set; }

    [Required(ErrorMessage ="Old Password is required")]
    public string OldPassword { get; set; }

    [Required(ErrorMessage ="New Password is required")]
    public string NewPassword { get; set; }

}
