using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SearchResults2 : System.Web.UI.Page
{
    string keyword;
    string sector;
    string location;

    List<JobsAvailable> jobs = new List<JobsAvailable>();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillLocations();
            FillSectors();
        }

        try
        {
            keyword = Request.QueryString["Keyword"].ToLower();
            sector = Request.QueryString["Sector"];
            location = Request.QueryString["Location"];

            if (keyword != "none")
            {
                Title = "Search results for " + keyword;
            }
            else
            {
                Title = "Search results for \"\"";
            }

            Search();
        }
        catch(Exception ex)
        {
            lblSearchResults.Text = "No search parameters entered!";
        }
    }

    void Search()
    {
        DataClassesDataContext dc = new DataClassesDataContext();

        if (sector != "Any Sector")
        {
            var result = from r in dc.JobsAvailables
                         where r.JobSector == sector
                         select r;

            if (location != "Any Location")
            {
                var locResluts = from l in result
                                 where l.Location == location
                                 select l;

                if (keyword != "none") // if keyword entered
                {
                    var actResults = from a in locResluts
                                     where a.Title.ToLower().Contains(keyword)
                                     select a;

                    lstView.DataSource = actResults;
                    lstView.DataBind();

                    jobs = actResults.ToList();

                    lblSearchResults.Text = "Search results for \"" + keyword + "\"" + " in \"" + sector + "\" in \"" + location + "\"";
                }
                else // no keyword entered
                {
                    lstView.DataSource = locResluts;
                    lstView.DataBind();

                    jobs = locResluts.ToList();

                    lblSearchResults.Text = "Search results for \"\"" + " in \"" + sector + "\" in \"" + location + "\"";
                }
            }
            else // If any location
            {
                if (keyword != "none")
                {
                    var actResults = from a in result
                                     where a.Title.ToLower().Contains(keyword)
                                     select a;

                    lstView.DataSource = actResults;
                    lstView.DataBind();

                    jobs = actResults.ToList();

                    lblSearchResults.Text = "Search results for \"" + keyword + "\"" + " in \"" + sector + "\" in \"" + location + "\"";
                }
                else // no keyword entered
                {
                    lstView.DataSource = result;
                    lstView.DataBind();

                    jobs = result.ToList();

                    lblSearchResults.Text = "Search results for \"\"" + " in \"" + sector + "\" in \"" + location + "\"";
                }
            }
        }
        else // if no sector selected
        {
            var result = from r in dc.JobsAvailables
                         select r;

            if (location != "Any Location") // Sector selected
            {
                var locResluts = from l in result
                                 where l.Location == location
                                 select l;

                if (keyword != "none") // if no keyword entered
                {
                    var actResults = from a in locResluts
                                     where a.Title.ToLower().Contains(keyword)
                                     select a;

                    lstView.DataSource = actResults;
                    lstView.DataBind();

                    jobs = actResults.ToList();

                    lblSearchResults.Text = "Search results for \"" + keyword + "\"" + " in \"" + sector + "\" in \"" + location + "\"";
                }
                else // no sector located, location selected, no keyword selected
                {
                    lstView.DataSource = locResluts;
                    lstView.DataBind();

                    jobs = locResluts.ToList();

                    lblSearchResults.Text = "Search results for \"\"" + " in \"" + sector + "\" in \"" + location + "\"";
                }
            }
            else // If any location
            {
                if (keyword != "none")
                {
                    var actResults = from a in result
                                     where a.Title.ToLower().Contains(keyword)
                                     select a;

                    lstView.DataSource = actResults;
                    lstView.DataBind();

                    jobs = actResults.ToList();

                    lblSearchResults.Text = "Search results for \"" + keyword + "\"" + " in \"" + sector + "\" in \"" + location + "\"";
                }
                else // no sector selected, no location selected, no keyword entered
                {
                    lstView.DataSource = result;
                    lstView.DataBind();

                    jobs = result.ToList();

                    lblSearchResults.Text = "Search results for \"\"" + " in \"" + sector + "\" in \"" + location + "\"";
                }
            }
        }
    }
    protected void lstView_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        DataPager1.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);

        lstView.DataSource = jobs;
        lstView.DataBind();
    }

    protected void lnkJob_Click(object sender, EventArgs e)
    {
        foreach (JobsAvailable j in jobs)
        {
            if (j.Id.ToString() == ((LinkButton)sender).CommandArgument)
            {
                Response.Redirect("JobListing.aspx?id=" + j.Id);
            }
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string queryString = "?";

        if (txtKeyWords.Text != "")
        {
            queryString += "Keyword=" + txtKeyWords.Text;
        }
        else
        {
            queryString += "Keyword=none";
        }

        queryString += "&Sector=" + ddlSector.SelectedItem.Text;
        queryString += "&Location=" + ddlLocation.SelectedItem.Text;

        Response.Redirect("SearchResults.aspx" + queryString);
    }

    void FillLocations()
    {
        DataClassesDataContext dc = new DataClassesDataContext();

        var result = from r in dc.Locations
                     orderby r.name ascending
                     select r.name;

        ddlLocation.DataSource = result;
        ddlLocation.DataBind();

        ddlLocation.Items.Add("Any Location");
        ddlLocation.SelectedIndex = ddlLocation.Items.Count - 1;
    }

    void FillSectors()
    {
        DataClassesDataContext dc = new DataClassesDataContext();

        var result = from r in dc.Sectors
                     orderby r.name ascending
                     select r.name;

        ddlSector.DataSource = result;
        ddlSector.DataBind();

        ddlSector.Items.Add("Any Sector");
        ddlSector.SelectedIndex = ddlSector.Items.Count - 1;
    }
}