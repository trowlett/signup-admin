<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Account_Logon" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Logon for MISGA Sign Up Database Administration and Maintenance</title>
    <link href="Styles/Site.css" rel="stylesheet" type="text/css" />

<style type="text/css">
        div.details {
            margin-bottom: 20px;
        }
        div {
            margin-top: 5px;
        }
        label {
            width: 90px;
            display: inline-block;
        }
        button {
            margin: 10px 10px 0 0;
        }
        tr {
            height: 50px;
        }
        .Logonbox {
            min-width: 400px; 
            max-width: 500px;
            min-height: 200px;  
            margin-left: auto;
            margin-right: auto;
            padding: 50px;
            background-color: lightyellow;
            border: double thin black;
        }
.button1 {border-radius: 2px;}
.button2 {border-radius: 4px;}
.button3 {border-radius: 8px;}
.button4 {border-radius: 12px;}
.button5 {border-radius: 50%;}
    </style>   

</head>
<body style="background-color: white;">
    <form id="form1" runat="server">
        <p style="text-align: right;font-size: small;margin-bottom: 0px;padding-bottom: 0px;">
            Version: <%: global_asax.aplVersion %>&nbsp;Update<span style="font-weight: bold;">           </span></p>
        <h2 style="text-align: center;">TMR Sign Up System Administration Web Site</h2>
        <br />
        <div class="Logonbox">
    <div>
        <h2>Log In</h2>



    <div class="Logon_container">
        <table>
            <tr>
                <td>
                  User ID:&nbsp;&nbsp;</td>
                <td>   
                    <asp:TextBox ID="tbUserName" runat="server" Width="380px" Height="40px" BackColor="White"></asp:TextBox>
                    </td>
                <td>
                    <ASP:RequiredFieldValidator ControlToValidate="tbUserName"
                    Display="Static" ErrorMessage="*" runat="server" 
                    ID="vUserName" ForeColor="Red" />
                </td>
            </tr>
            <tr>
                <td>
                    Password:&nbsp;&nbsp;
                </td>
                <td>
                    <asp:TextBox id="tbUserPass" runat="server" Height="40px" TextMode="Password" Width="380px" background-color="white" BackColor="White" />
                </td>
                <td>
                    <ASP:RequiredFieldValidator ControlToValidate="tbUserPass"
                    Display="Static" ErrorMessage="*" runat="server" 
                    ID="vUserPass" ForeColor="Red" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblPersistenCookie" runat="server" Text="Persistent Cookie:" Visible="False"></asp:Label>
                </td>
                <td>
                    <ASP:CheckBox id="chkPersistCookie" runat="server" autopostback="false" Visible="False" />
                </td>
            </tr>
            <tr>
                <td></td><td style="text-align: center">
                            <asp:Button ID="btnLogon" runat="server" Text="Log On" 
                                OnClick="btnLogon_Click" Height="40px" Width="180px" 
                    BackColor="Tomato" Font-Bold="True" Font-Names="Arial" Font-Size="12pt" 
                    ForeColor="White" BorderColor="Black" BorderStyle="Solid" 
                    BorderWidth="2px" CssClass="button4" />
                         </td>
            </tr>
   </table>
      <p>
            <asp:Label id="lblMsg" ForeColor="red"  runat="server" Font-Names="Verdana" Font-Size="Medium" />
      
   </p>
    </div>
 
    </div>
    </div>
    
    </form>
</body>
</html>
