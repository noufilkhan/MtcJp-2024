using System.ComponentModel.DataAnnotations;

namespace DatabaseApi.Dtos;

public class PromptDto
{
    public int PromptId { get; set; }

    public int entity { get; set; }

    public string PromptName { get; set; }

    public string PromptSubCategory { get; set; }

    public string PromptDescription { get; set; }

    public string PromptValue { get; set; }

    public string Guid { get; set; }
}
