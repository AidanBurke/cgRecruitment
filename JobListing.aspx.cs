using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JobListing : System.Web.UI.Page
{
    int id;
    JobsAvailable job;

    protected void Page_Load(object sender, EventArgs e)
    {
        id = Convert.ToInt32(Request.QueryString["id"]);

        DataClassesDataContext dc = new DataClassesDataContext();

        job = null;

        foreach (JobsAvailable j in dc.JobsAvailables)
        {
            if (id == j.Id)
            {
                job = j;
            }
        }

        if (job == null)
        {
            lblJobTitle.Text = "Job does not exist!";
        }
        else
        {
            SetUpPage(job);
        }

        foreach (User user in dc.Users)
        {
            if (user.Id.ToString() == job.ConsultantID)
            {
                lblName.Text = user.FirstName + " " + user.LastName;
                lnkEmail.Text = user.Email;
                lnkEmail.NavigateUrl = "mailto:" + user.Email;
                lblNumber.Text = user.PhoneNo;
            }
        }


    }

    void SetUpPage(JobsAvailable job)
    {
        lblJobTitle.Text = job.Title;
        lblLocation.Text = job.Location;
        lblReference.Text = job.ReferenceID;
        lblDescription.Text = job.JobDescription;

        Title = job.Title;
    }

    protected void lnbApply_Click(object sender, EventArgs e)
    {
        Response.Redirect("Contact.aspx?id=" + job.Id);
    }
}