using CinemaApp.Core.Entities.BaseEntities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.AccessControl;
using System.Text;
using System.Threading.Tasks;

namespace CinemaApp.Core.Entities
{
    public class ContactMessage: BaseEntity
    {
        public string? Name { get; set; }
        public string? Subject { get; set; }
        public string? Email { get; set; }
        public string? PhoneNumber { get; set; }
        public string? Comment { get; set; }

    }
}
