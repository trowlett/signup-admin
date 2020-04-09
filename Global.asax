<%@ Application Language="C#" %>

<script runat="server">

    public static string aplVersion;
    private static string aplPre;
    public static int sessionCount;

    void Application_Start(object sender, EventArgs e)
    {
        // Code that runs on application startup
        sessionCount = 0;
        aplPre = "Admin-008J 2020-04=08 Session = ";
        aplVersion = string.Format("{0}{1}  ", aplPre, sessionCount);

    }

    void Application_End(object sender, EventArgs e)
    {
        //  Code that runs on application shutdown

    }

    void Application_Error(object sender, EventArgs e)
    {
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e)
    {
        // Code that runs when a new session is started
        sessionCount += 1;
        aplVersion = string.Format("{0}{1}  ", aplPre, sessionCount);
    }

    void Session_End(object sender, EventArgs e)
    {
        sessionCount -= 1;

        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }

</script>
