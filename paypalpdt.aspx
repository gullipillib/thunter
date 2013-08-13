<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title></title>
</head>
<body>
    
<form method=post action="https://www.sandbox.paypal.com/cgi-bin/webscr">
<input type="hidden" name="cmd" value="_notify-synch">
<input type="hidden" name="tx" value="TransactionID">
<input type="hidden" name="at" value="oMz36ZuEADLIQazHNUU0ocNye1iXgar0ToQ8TowRZNSz7AUR_gSWn0hO7PK">
<input type="submit" value="PDT">
</form> 
	<div>
    
    	</div>
</body>
</html>
