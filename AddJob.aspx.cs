using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddJob : System.Web.UI.Page
{
    bool isLoggedIn = false;
    bool isEditMode = false;
    JobsAvailable jobToEdit;

    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["Name"] != null)
        {
            isLoggedIn = true;

            panLoggedIn.Visible = true;
            panNotLoggedIn.Visible = false;
            panSuccess.Visible = false;
            panEditSuccess.Visible = false;
            panEditFailure.Visible = false;
            panAddLocation.Visible = false;
            panAddSector.Visible = false;

            jobToEdit = FindJob(Request.QueryString["Id"]);

            FillLocations();
            FillSectors();

            if (jobToEdit != null)
            {
                isEditMode = true;
                btnAdd.Text = "Save";
                lblTitle.Text = "Edit " + jobToEdit.Title;

                SetLocationDDL(jobToEdit.Location);
                SetSectorDDL(jobToEdit.JobSector);
            }
            else
            {
                btnAdd.Text = "Add Job";
                lblTitle.Text = "Add a new job listing";
            }

            if (!IsPostBack && isEditMode)
            {
                SetControlValues();
            }
        }
        else
        {
            isLoggedIn = false;

            panLoggedIn.Visible = false;
            panNotLoggedIn.Visible = true;
            panSuccess.Visible = false;
            panEditSuccess.Visible = false;
            panEditFailure.Visible = false;
            panAddLocation.Visible = false;
            panAddSector.Visible = false;
        }
        
    }

    protected void FreeTextBox1_TextChanged(object sender, EventArgs e)
    {
       
    }

    protected void btnPreview_Click(object sender, EventArgs e)
    {
        lblLongerDescriptionResult.Text = FreeTextBox1.Text;
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (isLoggedIn)
        {
            if (!isEditMode)
            {
                DataClassesDataContext dc = new DataClassesDataContext();

                JobsAvailable job = new JobsAvailable()
                {
                    Title = txtTitle.Text,
                    ReferenceID = txtRefNo.Text,
                    Location = ddlLocation.SelectedItem.ToString(),
                    JobSector = ddlSectors.SelectedItem.ToString(),
                    ShortDescription = txtShortDescription.Text,
                    JobDescription = FreeTextBox1.Text,
                    ConsultantID = Session["Name"].ToString(),
                    ListedDate = DateTime.Now.Date
                };

                dc.JobsAvailables.InsertOnSubmit(job);

                try
                {
                    dc.SubmitChanges();

                    lblSuccess.Text = "Listing added successfully.";
                    panSuccess.Visible = true;
                    panLoggedIn.Visible = false;
                    panNotLoggedIn.Visible = false;
                    panEditSuccess.Visible = false;
                    panEditFailure.Visible = false;
                    panAddLocation.Visible = false;
                    panAddSector.Visible = false;
                }
                catch (Exception ex)
                {
                    lblSuccess.Text = "An error ocurred. Please try again.";
                    panSuccess.Visible = true;
                    panLoggedIn.Visible = false;
                    panNotLoggedIn.Visible = false;
                    panEditSuccess.Visible = false;
                    panEditFailure.Visible = false;
                    panAddLocation.Visible = false;
                    panAddSector.Visible = false;
                }
            }
            else
            {
                // Update the job listing

                DataClassesDataContext dc = new DataClassesDataContext();

                var result = from r in dc.JobsAvailables
                             where r.Id == jobToEdit.Id
                             select r;

                foreach (JobsAvailable j in result)
                {
                    if (j.Id == jobToEdit.Id)
                    {
                        j.Title = txtTitle.Text;
                        j.ReferenceID = txtRefNo.Text;
                        j.Location = ddlLocation.SelectedItem.ToString();
                        j.JobSector = ddlSectors.SelectedItem.ToString();
                        j.ShortDescription = txtShortDescription.Text;
                        j.JobDescription = FreeTextBox1.Text;
                        j.ConsultantID = Session["Name"].ToString();
                        j.ListedDate = DateTime.Now.Date;
                    }
                }

                try
                {
                    dc.SubmitChanges();

                    lblEditSuccess.Text = "Listing updated successfully.";
                    panSuccess.Visible = false;
                    panLoggedIn.Visible = false;
                    panNotLoggedIn.Visible = false;
                    panEditSuccess.Visible = true;
                    panEditFailure.Visible = false;
                    panAddSector.Visible = false;
                }
                catch (Exception ex)
                {
                    lblEditError.Text = ex.Message;

                    panSuccess.Visible = false;
                    panLoggedIn.Visible = false;
                    panNotLoggedIn.Visible = false;
                    panEditSuccess.Visible = false;
                    panEditFailure.Visible = true;
                    panAddSector.Visible = false;
                }

            }
        }
    }

    protected void btnAddAnother_Click(object sender, EventArgs e)
    {
        panSuccess.Visible = false;
        panLoggedIn.Visible = true;
        panNotLoggedIn.Visible = false;
        panEditSuccess.Visible = false;
        panEditFailure.Visible = false;
        panAddSector.Visible = false;

        ddlLocation.SelectedIndex = 0;
        txtRefNo.Text = "";
        ddlSectors.SelectedIndex = 0;
        txtShortDescription.Text = "";
        txtTitle.Text = "";
        FreeTextBox1.Text = "";
        lblLongerDescriptionResult.Text = "";
    }

    JobsAvailable FindJob(string id)
    {
        DataClassesDataContext dc = new DataClassesDataContext();

        foreach (JobsAvailable j in dc.JobsAvailables)
        {
            if (j.Id.ToString() == id)
            {
                return j;
            }
        }

        return null;
    }

    void SetControlValues()
    {
        txtRefNo.Text = jobToEdit.ReferenceID;
        txtShortDescription.Text = jobToEdit.ShortDescription;
        txtTitle.Text = jobToEdit.Title;
        FreeTextBox1.Text = jobToEdit.JobDescription;
        lblLongerDescriptionResult.Text = jobToEdit.JobDescription;
    }

#region Location Stuff
    void FillLocations()
    {
        DataClassesDataContext dc = new DataClassesDataContext();

        var result = from r in dc.Locations
                     orderby r.name ascending
                     select r.name;

        ddlLocation.DataSource = result;
        ddlLocation.DataBind();
    }

    void SetLocationDDL(string location)
    {
        for (int i = 0; i < ddlLocation.Items.Count; i++)
        {
            if (location == ddlLocation.Items[i].ToString())
            {
                ddlLocation.SelectedIndex = i;
            }
        }
    }

    protected void lnbAddLocation_Click(object sender, EventArgs e)
    {
        panSuccess.Visible = false;
        panLoggedIn.Visible = false;
        panNotLoggedIn.Visible = false;
        panEditSuccess.Visible = false;
        panEditFailure.Visible = false;
        panAddLocation.Visible = true;
        panAddSector.Visible = false;
    }

    protected void btnAddLocation_Click(object sender, EventArgs e)
    {
        if (txtNewLocation.Text != "")
        {
            DataClassesDataContext dc = new DataClassesDataContext();

            Location l = new Location()
            {
                name = txtNewLocation.Text
            };

            bool addedAlready = false;

            foreach (Location loc in dc.Locations)
            {
                if (loc.name == l.name)
                    addedAlready = true;
            }

            if (!addedAlready)
            {
                dc.Locations.InsertOnSubmit(l);

                try
                {
                    dc.SubmitChanges();

                    panSuccess.Visible = false;
                    panLoggedIn.Visible = true;
                    panNotLoggedIn.Visible = false;
                    panEditSuccess.Visible = false;
                    panEditFailure.Visible = false;
                    panAddSector.Visible = false;

                    FillLocations();
                }
                catch (Exception ex)
                {
                    lblEditError.Text = ex.Message;

                    panSuccess.Visible = false;
                    panLoggedIn.Visible = false;
                    panNotLoggedIn.Visible = false;
                    panEditSuccess.Visible = false;
                    panEditFailure.Visible = true;
                    panAddSector.Visible = false;
                }
            }
        }
    }
#endregion

#region Sector Stuff
    void FillSectors()
    {
        DataClassesDataContext dc = new DataClassesDataContext();

        var result = from r in dc.Sectors
                     orderby r.name ascending
                     select r.name;

        ddlSectors.DataSource = result;
        ddlSectors.DataBind();
    }

    void SetSectorDDL(string sector)
    {
        for (int i = 0; i < ddlSectors.Items.Count; i++)
        {
            if (sector == ddlSectors.Items[i].ToString())
            {
                ddlSectors.SelectedIndex = i;
            }
        }
    }

    protected void lnbAddSector_Click(object sender, EventArgs e)
    {
        panSuccess.Visible = false;
        panLoggedIn.Visible = false;
        panNotLoggedIn.Visible = false;
        panEditSuccess.Visible = false;
        panEditFailure.Visible = false;
        panAddLocation.Visible = false;
        panAddSector.Visible = true;
    }

    protected void btnAddSector_Click(object sender, EventArgs e)
    {
        if (txtNewSector.Text != "")
        {
            DataClassesDataContext dc = new DataClassesDataContext();

            Sector s = new Sector()
            {
                name = txtNewSector.Text
            };

            bool addedAlready = false;

            foreach (Sector sec in dc.Sectors)
            {
                if (sec.name == s.name)
                    addedAlready = true;
            }

            if (!addedAlready)
            {
                dc.Sectors.InsertOnSubmit(s);

                try
                {
                    dc.SubmitChanges();

                    panSuccess.Visible = false;
                    panLoggedIn.Visible = true;
                    panNotLoggedIn.Visible = false;
                    panEditSuccess.Visible = false;
                    panEditFailure.Visible = false;
                    panAddSector.Visible = false;

                    FillSectors();
                }
                catch (Exception ex)
                {
                    lblEditError.Text = ex.Message;

                    panSuccess.Visible = false;
                    panLoggedIn.Visible = false;
                    panNotLoggedIn.Visible = false;
                    panEditSuccess.Visible = false;
                    panEditFailure.Visible = true;
                    panAddSector.Visible = false;
                }
            }
        }
    }
    #endregion
}