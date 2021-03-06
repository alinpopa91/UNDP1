using System;
using System.Collections.Generic;

#nullable disable

namespace UNDP.DAL.Context
{
    public partial class User
    {
        public int Id { get; set; }
        public string UserName { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string Role { get; set; }
        public DateTime? DateOfBirth { get; set; }
    }
}
