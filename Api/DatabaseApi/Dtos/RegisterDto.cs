using System.ComponentModel.DataAnnotations;
using DatabaseApi.Models;

namespace DatabaseApi.Dtos;

public class RegisterDto
{
    public int Id { get; set; }

    [Required(ErrorMessage = "Username is Required")]
    public string Username { get; set; }

    [Required(ErrorMessage = "Password is Required")]
    [StringLength(8, MinimumLength = 4, ErrorMessage = "Password must be between 4-8 digits")]
    public string Password { get; set; }

    [Required(ErrorMessage = "Entity is Required")]
    public int Entity { get; set; }

    [Required(ErrorMessage = "First Name is Required")]
    public string FirstName { get; set; }

    public string MiddleName { get; set; }

    [Required(ErrorMessage = "Last Name is Required")]
    public string LastName { get; set; }

    [Required(ErrorMessage = "Email Address is Required")]
    public string EmailAddress { get; set; }

    [Required(ErrorMessage = "Contact Info is Required")]
    public string ContactInfo { get; set; }

    public string City { get; set; }

    [Required(ErrorMessage = "Country is Required")]
    public string Country { get; set; }

    public string Language { get; set; }
    

}
