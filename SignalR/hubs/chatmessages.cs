﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.SignalR;
using Microsoft.AspNet.SignalR.Hubs;

namespace treasurehunter.Hubs
{
    public class chatmessages : Hub
    {
        [HubMethodName("Hello")]
        public void Hello(string messages, string values)
        {
            Clients.All.hello(messages, values);
        }
    }
}