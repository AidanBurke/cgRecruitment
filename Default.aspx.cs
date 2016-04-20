using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Xml.Serialization;

public partial class Default2 : System.Web.UI.Page
{
    List<JobsAvailable> jobs = new List<JobsAvailable>();
    List<HomePanel> listHomePanels = new List<HomePanel>();

    protected void Page_Load(object sender, EventArgs e)
    {
        DataClassesDataContext dc = new DataClassesDataContext();

        var result = from r in dc.JobsAvailables
                     orderby r.ListedDate descending
                     select r;

        if (!IsPostBack)
        {
            FillLocations();
            FillSectors();
        }

        if (result.Count() > 9)
        {

            lstLatestJobs.DataSource = result.Take(9);
            lstLatestJobs.DataBind();

            jobs = result.Take(9).ToList();
        }
        else
        {
            lstLatestJobs.DataSource = result;
            lstLatestJobs.DataBind();

            jobs = result.ToList();
        }

        var panResult = from p in dc.Pages
                     where p.name == "HomeContentBoxes"
                     select p;

        Page panels = panResult.First();
        LoadPanels(panels.text);
        SetPanels();
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

    void LoadPanels(string objectsXml)
    {
        StringReader stReader = new StringReader(objectsXml);
        XmlSerializer xmls = new XmlSerializer(typeof(List<HomePanel>));
        XmlTextReader xmlReader = new XmlTextReader(stReader);

        listHomePanels = (List<HomePanel>)xmls.Deserialize(xmlReader);

        xmlReader.Close();
        stReader.Close();
    }

    void SetPanels()
    {
        // Panel 1
        imgPan1BG.ImageUrl = listHomePanels[0].ImageURL;
        lnkPan1Heading.Text = listHomePanels[0].Heading;
        lnkPan1Heading.NavigateUrl = listHomePanels[0].URL;
        lnkPan1Sub.Text = listHomePanels[0].SubHeading;
        lnkPan1Sub.NavigateUrl = listHomePanels[0].URL;

        // Panel 2
        imgPan2BG.ImageUrl = listHomePanels[1].ImageURL;
        lnkPan2Heading.Text = listHomePanels[1].Heading;
        lnkPan2Heading.NavigateUrl = listHomePanels[1].URL;
        lnkPan2Sub.Text = listHomePanels[1].SubHeading;
        lnkPan2Sub.NavigateUrl = listHomePanels[1].URL;


        //Panel 3
        imgPan3BG.ImageUrl = listHomePanels[2].ImageURL;
        lnkPan3Heading.Text = listHomePanels[2].Heading;
        lnkPan3Heading.NavigateUrl = listHomePanels[2].URL;
        lnkPan3Sub.Text = listHomePanels[2].SubHeading;
        lnkPan3Sub.NavigateUrl = listHomePanels[2].URL;
    }
}