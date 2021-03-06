﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class About : System.Web.UI.Page
{
    bool loggedIn = false;
    Page page;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Name"] != null)
        {
            loggedIn = true;
            panEditButton.Visible = true;
        }
        else
        {
            loggedIn = false;
            panEditButton.Visible = false;
        }

        panEdit.Visible = false;
        panSuccess.Visible = false;

        // Get the about information
        DataClassesDataContext dc = new DataClassesDataContext();

        var result = from p in dc.Pages
                     where p.name == "About"
                     select p;

        page = result.First() as Page;

        if (!String.IsNullOrEmpty(page.text))
        {
            lblAbout.Text = page.text;
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        DataClassesDataContext dc = new DataClassesDataContext();

        var result = from p in dc.Pages
                     where p.name == "About"
                     select p;

        Page page = result.First() as Page;

        result.First().text = ftbMain.Text;

        try
        {
            dc.SubmitChanges();

            panEdit.Visible = false;
            panEditButton.Visible = false;

            panSuccess.Visible = true;
            lblSuccess.Text = "About page successfully updated.";
        }
        catch (Exception ex)
        {
            panEdit.Visible = false;
            panEditButton.Visible = false;

            panSuccess.Visible = true;
            lblSuccess.Text = "Update unsuccessful - " + ex.Message;
        }
    }

    protected void btnPreview_Click(object sender, EventArgs e)
    {
        lblAbout.Text = ftbMain.Text;

        panEdit.Visible = true;
        panEditButton.Visible = false;
    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        if (loggedIn)
        {
            panEdit.Visible = true;
            panEditButton.Visible = false;

            ftbMain.Text = page.text;
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        panEdit.Visible = false;
    }
}