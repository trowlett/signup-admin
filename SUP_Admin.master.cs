using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class SiteMaster : System.Web.UI.MasterPage
{
    protected string OrgURL { get; set; }
    public Settings ClubSettings { get; set; }
    protected string txtUserName;
    const string roleGuest = "1";
    const string roleUser = "2";
    const string roleAdmin = "3";
    const string roleMaster = "4";

    protected void Page_Load(object sender, EventArgs e)
    {
        ClubSettings = new Settings();
        this.ClubSettings = (Settings)Session["Settings"];
        HttpCookie authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName];

        // Decrypts the FormsAuthenticationTicket that is held in the cookie's .Value property.
        FormsAuthenticationTicket authTicket = FormsAuthentication.Decrypt(authCookie.Value);

        // The "authTicket" variable now contains your original, custom FormsAuthenticationTicket,
        // complete with User-specific custom data.  You can then check that the FormsAuthenticationTicket's
        // .Name property is for the correct user, and perform the relevant functions with the ticket.
        //
        if (this.ClubSettings != null)
        {
            OrgURL = ClubSettings.ClubInfo.MISGAURL;
            literalOrg.Text = ClubSettings.ClubInfo.ClubName;
            NavigationMenu.Items[0].NavigateUrl = "~/Default.aspx?CLUB=" + ClubSettings.ClubID;
            SetupMenu(NavigationMenu, authTicket.UserData);
        }
        else
        {
            OrgURL = Request.Url.AbsoluteUri; // "http://admin.misga-signup.org";
            literalOrg.Text = "";
            NavigationMenu.Items[0].NavigateUrl = "~/Default.aspx";
        }

    }

    protected void SetupMenu(Menu navigationMenu, string RoleLevel)
    {
        //navigationMenu is already established with the root (home) entry
        MenuItem signupListMenuItem = new MenuItem("Signup List", "Signup List");
        MenuItem playersListMenuItem = new MenuItem("Players List", "Players List", "", "~/Signups/PlayersList.aspx");
        if (RoleLevel == roleGuest)       // Guest Role
        {
            signupListMenuItem.ChildItems.Add(playersListMenuItem);
            navigationMenu.Items.Add(signupListMenuItem);
        }
        else
        {                           
            if (RoleLevel == roleUser)       //  User Role
            {
                signupListMenuItem.ChildItems.Add(playersListMenuItem);
                navigationMenu.Items.Add(signupListMenuItem);
                AddMembersMenu(navigationMenu, RoleLevel);
            }
            else
            {
                // Rolelevel == "3" and "4"        User Admin and Master

                // SIGNUP LIST Menu Items
                MenuItem allSignupListMenuItem = 
                    new MenuItem("All Player's Lists", "All Player's Lists", "", "~/Signups/AllSignups.aspx");
                MenuItem editSignupDBMenuItem =
                    new MenuItem("Edit SignUp DB", "Edit SignUp DB", "", "~/Signups/EditSignupDB.aspx");
                MenuItem removeMarkedEntriesMenuItem =
                    new MenuItem("Remove Marked Entries", "Remove Marked Entries", "", "~/Signups/Remove.aspx");
                MenuItem purgePriorYearEntriesMenuItem =
                    new MenuItem("Purge Prior Year Entries", "Purge prior Year Entries", "", "~/Signups/purge_prior_year.aspx");
                signupListMenuItem.ChildItems.Add(playersListMenuItem);
                signupListMenuItem.ChildItems.Add(editSignupDBMenuItem);
                signupListMenuItem.ChildItems.Add(removeMarkedEntriesMenuItem);
                signupListMenuItem.ChildItems.Add(purgePriorYearEntriesMenuItem);
                signupListMenuItem.ChildItems.Add(allSignupListMenuItem);
                if (RoleLevel == roleMaster)
                {
                    MenuItem testEditSignupDBMenuItem =
                            new MenuItem("Test New Edit DB", "Test New Edit DB", "", "~/Signups/signupDB.aspx");
                    signupListMenuItem.ChildItems.Add(testEditSignupDBMenuItem);
                }
                navigationMenu.Items.Add(signupListMenuItem);

                // EVENTS Menu Items

                MenuItem eventsMenuItem = new MenuItem("Events", "Events");
                MenuItem addEventMenuItem = new MenuItem("Add Event", "Add Event", "", "~/Events/addevent.aspx");
                MenuItem modifyEventMenuItem = new MenuItem("Modify Events", "Modify Events", "", "~/Events/modifyEvents.aspx");
                MenuItem loadEventsMenuItem = new MenuItem("Load Events", "Load Events", "", "~/Events/loadevents.aspx");
                MenuItem purgeEventsMenuItem = new MenuItem("Purge Events", "Purge Events", "", "~/Events/PurgeEvents.aspx");
                eventsMenuItem.ChildItems.Add(addEventMenuItem);
                eventsMenuItem.ChildItems.Add(modifyEventMenuItem);
                eventsMenuItem.ChildItems.Add(loadEventsMenuItem);
                eventsMenuItem.ChildItems.Add(purgeEventsMenuItem);
                navigationMenu.Items.Add(eventsMenuItem);

                // MEMBERS Menu Items

                AddMembersMenu(navigationMenu, RoleLevel);

                //  PARAMETERS Menu Items

                MenuItem parametersMenuItem = new MenuItem("Parameters", "Parameters");
                MenuItem editParametersMenuItem =
                    new MenuItem("Edit Parameters", "Edit Parameters", "", "~/Parameters/EditParam.aspx");
                MenuItem addParameterMenuItem =
                    new MenuItem("Add Parameter", "Add Parameter", "", "~/Parameters/AddParam.aspx");
                MenuItem setDatesMenuItem =
                    new MenuItem("Set First & Last Date", "Set Dates", "", "~/LastDate/LastDate.aspx");
                parametersMenuItem.ChildItems.Add(editParametersMenuItem);
                parametersMenuItem.ChildItems.Add(addParameterMenuItem);
                parametersMenuItem.ChildItems.Add(setDatesMenuItem); 
                navigationMenu.Items.Add(parametersMenuItem);

                if (RoleLevel == roleMaster)           // Master Role
                {
//                    MenuItem utilitiesMenuItem = new MenuItem("Utilities", "Utilities");
                    MenuItem settingsMenuItem = new MenuItem("Settings", "Settings");
                    MenuItem changeClubSubMenuItem = new MenuItem("Change Club", "Change Club", "", "~/Clubs/ChangeClub.aspx");
                    MenuItem clubsSubMenuItem = new MenuItem("Clubs", "Clubs", "", "~/Clubs/Clubsmain.aspx");
                    MenuItem usersSubMenuItem = new MenuItem("List Users", "List Users", "", "~/User/userlist.aspx");
                    MenuItem usersmainSubMenuItem = new MenuItem("Update Users", "Update Users", "", "~/User/usermain.aspx");
                    settingsMenuItem.ChildItems.Add(changeClubSubMenuItem);
                    settingsMenuItem.ChildItems.Add(clubsSubMenuItem);
                    settingsMenuItem.ChildItems.Add(usersSubMenuItem);
                    settingsMenuItem.ChildItems.Add(usersmainSubMenuItem);
//                    utilitiesMenuItem.ChildItems.Add(settingsMenuItem);
                    navigationMenu.Items.Add(settingsMenuItem);
                }
            }
        }
        MenuItem aboutMenuItem = new MenuItem("About", "About", "", "~/About.aspx");
        navigationMenu.Items.Add(aboutMenuItem);

    }

    protected void AddMembersMenu(Menu navigationMenu, string RoleLevel)
    { 
        MenuItem membersMenuItem = 
            new MenuItem("Members", "Members");
        MenuItem editMembersMenuItem = 
            new MenuItem("Edit Members", "Edit Members", "", "~/Members/editmember.aspx");
        MenuItem updateHandicapsMenuItem = 
            new MenuItem("Update Handicaps", "Update Handicaps", "", "~/Members/updateHandicaps.aspx");
        MenuItem lookupHandicapsMenuItem =
            new MenuItem("Lookup Member Handicap", "Lookup Handicap", "", "~/Members/TestHandicaps.aspx");
        MenuItem listMSGAHandicapsMenuItem = 
            new MenuItem("List Handicaps", "List Handicaps", "", "~/Members/ListHandicaps.aspx");
        membersMenuItem.ChildItems.Add(editMembersMenuItem);
        membersMenuItem.ChildItems.Add(updateHandicapsMenuItem);
        membersMenuItem.ChildItems.Add(lookupHandicapsMenuItem);
        membersMenuItem.ChildItems.Add(listMSGAHandicapsMenuItem);
        if (RoleLevel == roleMaster)
        {
            MenuItem inputMenuItem = new MenuItem("Input Members", "Input Members", "", "~/Members/inputMembers.aspx");
            membersMenuItem.ChildItems.Add(inputMenuItem);
        }
        navigationMenu.Items.Add(membersMenuItem);

    }
}
