using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Name"] != null)
        {
            panLogin.Visible = true;

            lblUserName.Text = "Hi " + Session["Name"] + "!";
            lnkLogout.Text = "Logout";
        }
    }

    protected void lnkLogout_Click(object sender, EventArgs e)
    {
        Session.Clear();

        Response.Redirect("Default.aspx");

        panLogin.Visible = false;
    }
}
