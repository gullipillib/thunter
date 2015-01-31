using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.SignalR;
using Microsoft.AspNet.SignalR.Hubs;

namespace treasurehunter.Hubs
{
    public class playerpositionmessages : Hub
    {
        [HubMethodName("Hello")]
        public void Hello(string messages, string values, string values1)
        {
            Clients.All.hello(messages, values, values1);
        }
    }
}