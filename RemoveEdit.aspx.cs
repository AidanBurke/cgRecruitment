using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RemoveEdit : System.Web.UI.Page
{
    bool isLoggedIn = false;
    List<JobsAvailable> jobs = new List<JobsAvailable>();

    string idToBeDeleted;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Name"] != null)
        {
            isLoggedIn = true;

            panEditDelete.Visible = true;
            panNotLoggedIn.Visible = false;
        }
        else
        {
            isLoggedIn = false;

            panEditDelete.Visible = false;
            panNotLoggedIn.Visible = true;
        }

        if (isLoggedIn)
        {
            DataClassesDataContext dc = new DataClassesDataContext();

            if (Request.QueryString["search"] != null)
            {
                var result = from r in dc.JobsAvailables
                             where r.ReferenceID.ToLower().Contains(Request.QueryString["search"].ToLower())
                             select r;

                lstJobs.DataSource = result;
                lstJobs.DataBind();

                jobs = result.ToList();

                lblSearch.Text = "Search Results for " + Request.QueryString["search"];
            }
            else
            {
                var result = from r in dc.JobsAvailables
                             select r;

                lstJobs.DataSource = result;
                lstJobs.DataBind();

                jobs = result.ToList();
            }
        }
    }

    protected void lstJobs_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        DataPager1.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);

        lstJobs.DataSource = jobs;
        lstJobs.DataBind();
    }

    protected void lnkView_Click(object sender, EventArgs e)
    {
        Response.Redirect("JobListing.aspx?id=" + ((LinkButton)sender).CommandArgument);
    }

    protected void lnkEdit_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddJob.aspx?id=" + ((LinkButton)sender).CommandArgument);
    }

    protected void lnkDelete_Click(object sender, EventArgs e)
    {
        Session["IdToBeDeleted"] = ((LinkButton)sender).CommandArgument;

        panEditDelete.Visible = false;
        panDelete.Visible = true;
    }

    protected void btnYes_Click(object sender, EventArgs e)
    {
        DataClassesDataContext dc = new DataClassesDataContext();

        try
        {
            var result = from j in dc.JobsAvailables
                         where j.Id.ToString() == Session["IdToBeDeleted"] 
                         select j;

            //foreach (JobsAvailable j in result)
            //{
            //    if (j.Id.ToString() == idToBeDeleted)
            //    {
            //        dc.JobsAvailables.DeleteOnSubmit(j);
            //    }
            //}

            dc.JobsAvailables.DeleteOnSubmit((JobsAvailable)result.First());

            dc.SubmitChanges();

            lstJobs.DataSource = dc.JobsAvailables;
            lstJobs.DataBind();

            panEditDelete.Visible = false;
            panDelete.Visible = false;
            panDeleteOutcome.Visible = true;

            lblOutcome.Text = "Listing deleted successfully!";
        }
        catch (Exception ex)
        {
            lblOutcome.Text = "The following error occured - " + ex.Message;

            panEditDelete.Visible = false;
            panDelete.Visible = false;
            panDeleteOutcome.Visible = true;
        }
    }

    protected void btnNo_Click(object sender, EventArgs e)
    {
        panEditDelete.Visible = true;
        panDelete.Visible = false;
        panDeleteOutcome.Visible = false;
    }

    protected void btnBackToList_Click(object sender, EventArgs e)
    {
        panEditDelete.Visible = true;
        panDelete.Visible = false;
        panDeleteOutcome.Visible = false;
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (txtSearch.Text != "")
        {
            DataClassesDataContext dc = new DataClassesDataContext();

            var results = from j in dc.JobsAvailables
                          where j.Title.Contains(txtSearch.Text)
                          select j;

            lstJobs.DataSource = results;
            lstJobs.DataBind();
        }
    }
}