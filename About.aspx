<%@ Page Title="About Us" Language="C#" MasterPageFile="~/SUP_Admin.master" AutoEventWireup="true"
    CodeFile="About.aspx.cs" Inherits="About" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        #intro p {
            margin-bottom: 0px;
            padding-bottom: 2px;
        }
        #intro h2 {
            padding-top: 2px;
            margin-top: 0px;
        }
        #VersionInfo {
            margin: 10px 5px 10px 5px;
            padding: 5px 5px 5px 5px;
            border: 3px solid red;
            background-color: white;
            color: navy;
         }
        #VersionInfo table {
            border-collapse: collapse;
            margin-top: 10px;
        }
        #VersionInfo td{
            text-align: left;
            vertical-align: top;
        }
        #Support {
            margin: 10px 5px 10px 5px;
            padding: 5px 5px 5px 5px;
            border: 3px solid navy;
            background-color: lightcyan;
            color: navy;
        }
        .vdesc {
             border-top: thin solid silver;
         }
        .center_bold {
            text-align: center;
            font-weight: bold;
        }
        .auto-style1 {
            width: 25%;
            height: 28px;
        }
        .auto-style2 {
            height: 28px;
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div id="intro">
    <p style="text-align: right; font-size: .7em;"><%: global_asax.aplVersion %> &nbsp;</p>
    <h2 class="center">
        <asp:Label ID="lblClubName" runat="server" Text="Label Club Name"></asp:Label> <br />
        and the TMR SignUp System Administration Web Site</h2>
    <p>
        Web site is used to maintain the database for the 
        <asp:Literal ID="LiteralOrg" runat="server" Text="Club Organization"></asp:Literal>&nbsp;Web Site 
        <asp:Button ID="btnHome" runat="server" Text="Go To:" OnClick="btnHome_Click" />
        </p>
        </div>
    <div id="Support">
        <h3 class="center_bold" >
            System Support Contacts
        </h3>
            <p>
        Questions or Comments?&nbsp; Contact:&nbsp; Tom Rowlett at 
            <a href="mailto:tom.rowlett@misga-signup.org">tom.rowlett@misga-signup.org</a> or (301) 473-4785.</p>
    <%# System.Configuration.ConfigurationManager.AppSettings["OrgURL"].ToString() %>

    </div>

    <div id="VersionInfo">
        <table>
            <thead>
                <tr><th style="text-align: left" class="auto-style1">Version</th><th style="text-align: left;" class="auto-style2">Description</th></tr>                
            </thead>
            <tr class="vdesc"><td>Admin-008g 03/26/20</td>
                <td>Added methodolgy to hide signup entries for an Event by marking the signup Table field &#39;Marked&#39; with an integer 2.&nbsp; Other valid values and their respective meanings are:&nbsp;&nbsp; zero indicates the signup is active.&nbsp; A &#39;1&#39; dicates the signup is deleted.</td>

            </tr>
            <tr class="vdesc"><td>Admin-008f 03/05/20</td>
                <td>Included in Player's List the current Handicap and the Last Revision Date by using the recent MSGA Handicap Database.</td>
            </tr>
            <tr class="vdesc"><td>Admin-008e 02/06/20</td>
                <td>Added new Event Type of SignUp In Pro-Shop (SUIPS) Only.  Any additional data associated with this 
                    event type is for informational purposes only.</td></tr>
            <tr class="vdesc"><td>Admin-008d 02/03/20</td>
                <td>Added MSGA Network ID # to Player&#39;s List for sending to Host club.&nbsp; MSGA Network ID # is in the Member&#39;s list.</td>

            </tr>
            <tr class="vdesc"><td>Admin-008 11/14/2019</td>
                <td>Move parameter "Players" to SysParam so that it is an internal parameter.</td>

            </tr>
            <tr class="vdesc"><td>Admin-007 </td>
                <td>Corrected SignUpLimit and PlayerLimit parameters handling.&nbsp; Changed SignUp page so that Tee Choices are always displayed. </td>
            </tr>
            <tr class="vdesc"><td>Admin-006 02/06/2019</td>
                <td>Added a comma after the player's name in the emailed SignUp List to ease loading 
                    the list in a CSV file.&nbsp; Also added the list of TMR SignUp System support people and Version Descriptios to the About Page.</td></tr>

        </table>

    </div>
</asp:Content>
