using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web.Mvc;
using Microsoft.AspNet.Mvc.Facebook;
using Microsoft.AspNet.Mvc.Facebook.Client;
using treasurehunter.Models;



namespace treasurehunter.Controllers
{
    public class PlaymobiletabController : Controller
    {
        [FacebookAuthorize()]

        public async Task<ActionResult> playmobiletab(FacebookContext context)
        {
            if (ModelState.IsValid)
            {
                var user = await context.Client.GetCurrentUserAsync<MyAppUser>();
                Session["Facebooktoken"] = context.AccessToken;
                return View(user);
            }

            return View("Error");
        }


        // This action will handle the redirects from FacebookAuthorizeFilter when 
        // the app doesn't have all the required permissions specified in the FacebookAuthorizeAttribute.
        // The path to this action is defined under appSettings (in Web.config) with the key 'Facebook:AuthorizationRedirectPath'.
        public ActionResult Permissions(FacebookRedirectContext context)
        {
            if (ModelState.IsValid)
            {
                return View(context);
            }

            return View("Error");
        }
    }
}
