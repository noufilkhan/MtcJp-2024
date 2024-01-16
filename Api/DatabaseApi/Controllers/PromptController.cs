using DatabaseApi.Controllers;
using DatabaseApi.Dtos;
using DatabaseApi.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Identity.Client;

namespace DatabaseApi;

public class PromptController : BaseApiController
{
    private VehiclesContext _context;

    public PromptController(VehiclesContext context) { _context = context; }

    // https://localhost:5001/api/Prompt/1
    [HttpGet("{entity}")]
    public async Task<ActionResult<IEnumerable<PromptDto>>> GetAll(int entity)
    {
        return await _context.PromptValues
                .Where(p => p.Entity == entity)
                .Select(p => new PromptDto { PromptName = p.PromptName })
                .Distinct()
                .ToListAsync();
    }

    // https://localhost:5001/api/Prompt/1
    [HttpGet("ByName/{entity}/{name}")]
    public async Task<ActionResult<IEnumerable<PromptDto>>> GetAllByName(int entity, string name)
    {
        return await _context.PromptValues
                .Where(p => p.Entity == entity && p.PromptName.ToLower() == name.ToLower())
                .Select(p => new PromptDto
                {
                    PromptId = p.PromptId,
                    PromptName = p.PromptName,
                    PromptSubCategory = p.PromptSubCategory,
                     PromptDescription = p.PromptDescription,
                     PromptValue = p.PromptValue1
                })
                .ToListAsync();
    }
}
