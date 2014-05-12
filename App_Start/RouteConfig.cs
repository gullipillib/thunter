using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;


namespace treasurehunter
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            
            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index1", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "Play",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Play", action = "play", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                name: "Invite",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Invite", action = "friends", id = UrlParameter.Optional }
            );
            routes.MapRoute(
                 name: "hubs",
                 url: "{controller}/{action}/{id}",
                 defaults: new { controller = "SignalR", action = "hubs", id = UrlParameter.Optional }
             );
            routes.MapRoute(
                 name: "tspot1",
                 url: "{controller}/{action}/{id}",
                 defaults: new { controller = "Buymobile", action = "tspot1", id = UrlParameter.Optional }
             );
            routes.MapRoute(
                 name: "playmobile",
                 url: "{controller}/{action}/{id}",
                 defaults: new { controller = "Playmobile", action = "playmobile", id = UrlParameter.Optional }
             );
            routes.MapRoute(
                 name: "indexmobile",
                 url: "{controller}/{action}/{id}",
                 defaults: new { controller = "Indexmobile", action = "indexmobile", id = UrlParameter.Optional }
             );
            routes.MapRoute(
                 name: "playmobiletab",
                 url: "{controller}/{action}/{id}",
                 defaults: new { controller = "Playmobiletab", action = "playmobiletab", id = UrlParameter.Optional }
             );
        }
    }
}