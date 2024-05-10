using AngularApi.Model;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Runtime.CompilerServices;
using System.Security.Claims;
using System.Text;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace AngularApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly dbContext _context;
        private readonly IConfiguration _configuration;

        public UserController(dbContext context, IConfiguration configuration)
        {
            _context = context;
            _configuration = configuration;
        }
        // GET: api/<UserController>
        [HttpGet]
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/<UserController>/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<UserController>
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT api/<UserController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<UserController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
        
        [HttpPost("Login")]
        public async Task<ActionResult<Login>> Login(Login log)
        {
            try
            {
                var userd = await _context.users.FirstOrDefaultAsync(u => u.Name == log.Name && u.Password == log.Password);
                if (userd == null)
                {
                    return NotFound("Invalid username or password.");
                }
                var claims = new List<Claim> {
                        new Claim(JwtRegisteredClaimNames.Sub, _configuration["Jwt:Subject"]),
                        new Claim("UserId", userd.userId.ToString()),
                        new Claim("UserName", userd.Name),
                        new Claim(ClaimTypes.Role, "User")
                    };

                var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["Jwt:Key"]));
                var signIn = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);
                var token = new JwtSecurityToken(
                    _configuration["Jwt:Issuer"],
                    _configuration["Jwt:Audience"],
                    claims,
                    expires: DateTime.UtcNow.AddHours(2),
                    signingCredentials: signIn
                    );

                var jwtToken = new JwtSecurityTokenHandler().WriteToken(token);
              
                return Ok(jwtToken);
            }
            catch (Exception ex)
            {
                return StatusCode(500, "An error occurred while processing your request.");
            }
        }

        [HttpPost("Register")]
        public async Task<ActionResult<User>> Register(User user)
        {
            try
            {
                var existingUser = await _context.users.FirstOrDefaultAsync(u => u.Name == user.Name); //unique name
                if (existingUser != null)
                {
                    return Conflict("Username already exists.");
                }

                var users = new User
                {
                    Name = user.Name,
                    Email = user.Email,
                    Password = user.Password,
                    
                };

                _context.users.Add(user);
                await _context.SaveChangesAsync();

                return CreatedAtAction(nameof(Login), new { id = user.userId }, user);
            }
            catch (Exception ex)
            {
                return StatusCode(500, "An error occurred while processing your request.");
            }
        }
    }

}


