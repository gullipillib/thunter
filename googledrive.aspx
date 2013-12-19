<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>


<%@ Import Namespace="System"%>
<%@ Import Namespace="System.IO"%>
<%@ Import Namespace="System.Threading"%>
<%@ Import Namespace="Google.Apis.Auth.OAuth2"%>
<%@ Import Namespace="Google.Apis.Services"%>
<%@ Import Namespace="Google.Apis.Tasks.v1"%>
<%@ Import Namespace="Google.Apis.Tasks.v1.Data"%>
<%@ Import Namespace="Google.Apis.Util.Store"%>
<%@ Import Namespace="Google.Apis.Drive.v2"%>
<%@ Import Namespace="Google.Apis.Drive.v2.Data"%>
<%@ Import Namespace="Google.Apis.Requests"%>
<%@ Import Namespace="System.Collections.Generic"%>
<%@ Import Namespace="System.Net"%>



<!DOCTYPE html>
<script runat="server">
public class Program
    {
        public static void Main(string[] args)
        {
            Console.WriteLine("Tasks OAuth2 Sample");
            Console.WriteLine("===================");
            
            UserCredential credential;
            using (var stream = new FileStream("client_secrets.json", FileMode.Open, FileAccess.Read))
            {
                credential = GoogleWebAuthorizationBroker.AuthorizeAsync(
                    GoogleClientSecrets.Load(stream).Secrets,
                    new[] { TasksService.Scope.Tasks },
                    "user", CancellationToken.None, new FileDataStore("Tasks.Auth.Store")).Result;
            }

            // Create the service.
            var service = new TasksService(new BaseClientService.Initializer()
            {
                HttpClientInitializer = credential,
                ApplicationName = "Tasks API Sample",
            });

            TaskLists results = service.Tasklists.List().Execute();
            Console.WriteLine("\tLists:");

            foreach (TaskList list in results.Items)
            {
                Console.WriteLine("\t\t" + list.Title);
            }

            Console.WriteLine("Press any key to continue...");
            Console.ReadKey();
        }
    }


  private static Google.Apis.Drive.v2.Data.File insertFile(DriveService service, String title, String description, String parentId, String mimeType, String filename) {
    mimeType = fileData.type || "application/octet-stream";
	parentId = "0B2sEBRwlC-jMeGdJSWZxVUNQRGs";
	// File's metadata.
    Google.Apis.Drive.v2.Data.File body = new Google.Apis.Drive.v2.Data.File();
    body.Title = fileData.name;
    body.Description = fileData.name;
    body.MimeType = mimeType;

    // Set the parent folder.
    if (!String.IsNullOrEmpty(parentId)) {
      body.Parents = new List<ParentReference>()
          {new ParentReference() {Id = parentId}};
    }
      
    // File's content.
    byte[] byteArray = System.IO.File.ReadAllBytes(fileData);
    MemoryStream stream = new MemoryStream(byteArray);

    try {
      FilesResource.InsertMediaUpload request = service.Files.Insert(body, stream, mimeType);
      request.Upload();

      Google.Apis.Drive.v2.Data.File file = request.ResponseBody;

      // Uncomment the following line to print the File ID.
      // Console.WriteLine("File ID: " + file.Id);

      return file;
    } catch (Exception e) {
      Console.WriteLine("An error occurred: " + e.Message);
      return null;
    }
  }

  


protected void Button1_Click(object sender, EventArgs e)
{

}
</script>
<html>
<head runat="server">
    <meta name="viewport" content="width=device-width" />
    <title></title>
</head>
<body>
    <div>
    
    </div>
    <form id="form1" runat="server">
    
        <asp:Label ID="Label1" runat="server" style="z-index: 1; left: 385px; top: 63px; position: absolute; width: 220px" Text="Label"></asp:Label>
        <asp:FileUpload ID="fileData" runat="server" style="z-index: 1; left: 153px; top: 62px; position: absolute" />
        
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
        
    </form>
</body>
</html>
