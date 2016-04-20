using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminLogin2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Name"] != null)
        {
            panLogin.Visible = false;
            panAlreadyLogged.Visible = true;
        }
        else
        {
            panLogin.Visible = true;
            panAlreadyLogged.Visible = false;
        }
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        DataClassesDataContext dc = new DataClassesDataContext();

        var result = from u in dc.Users
                     where u.FirstName == txtUsername.Text
                     select u;

        try
        {
            User user = (User)result.First();

            if (result != null)
            {
                if (user.Password == txtPassword.Text)
                {
                    Session["Name"] = user.FirstName + " " + user.LastName;

                    Response.Redirect("AdminPanel.aspx");
                }
                else
                {
                    lblIncorrect.Text = "Username or password incorrect!";
                }
            }
        }
        catch (InvalidOperationException ex)
        {
            lblIncorrect.Text = "Username or password incorrect!";
        }
    }
}