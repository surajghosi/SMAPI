using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web.Http;

namespace TMS.API.Common
{
    [Authorize]
    public    class UserClaims : ControllerBase
    {
        /// <summary>
        /// Constructor to save all the Claims.
        /// </summary>
       
        public UserClaims(ClaimsIdentity claimsIdentity)
        {
           // ClaimsIdentity claimsIdentity = HttpContext.User.Identity as ClaimsIdentity;
            var claims = claimsIdentity?.Claims.Select(x => new { type = x.Type, value = x.Value });

            if (claims != null && claims.Any())
            {
                LoggedInUserId = Guid.Parse(claims.Where(x => x.type.Contains("id")).FirstOrDefault().value);
                RoleId = Guid.Parse(claims.Where(x => x.type.Contains("roleid")).FirstOrDefault().value);
                OrgId = Guid.Parse(claims.Where(x => x.type.Contains("orgid")).FirstOrDefault().value);
                // UserName = claims.Where(x => x.type.Contains("sub")).FirstOrDefault().value;
                // IsActive = Convert.ToBoolean(claims.Where(x => x.type.Contains("isapproved")).FirstOrDefault().value);
                // IsLocked = Convert.ToBoolean(claims.Where(x => x.type.Contains("islocked")).FirstOrDefault().value);
            }
            else
            {
                Unauthorized();
            }
        }
        public  Guid LoggedInUserId { get; } = Guid.Empty;
        public Guid RoleId { get; } = Guid.Empty;
        public Guid OrgId { get; } = Guid.Empty;
        public string UserName { get; }
        public bool IsActive { get; }
        public bool IsLocked { get; set; }
    }
}
