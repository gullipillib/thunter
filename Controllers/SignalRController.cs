using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace treasurehunter.Controllers
{
    public class SignalRController : Controller 
    {
        //
        // GET: /SignalR/
       
        public ActionResult hubs()
        {
            return View();
        }

    }
}
