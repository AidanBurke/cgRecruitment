using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Xml.Serialization;

public partial class AdminPanel2 : System.Web.UI.Page
{
    bool allowedAccess = false;

    public string panBG1 = "https://dl.dropboxusercontent.com/u/45463976/hr-paper-chain-try2.jpg";

    Page homePanels;

    List<HomePanel> listHomePanels = new List<HomePanel>();

    protected void Page_Load(object sender, EventArgs e)
    {
        editHomePanels.Visible = false;

        if (Session["name"] != null)
        {
            allowedAccess = true;

            panAdminControls.Visible = true;
            panNotLoggedIn.Visible = false;
        }
        else
        {
            panAdminControls.Visible = false;
            panNotLoggedIn.Visible = true;

            lblNotLoggedIn.Text = "You need to be logged in to access the admin panel. ";
        }
    }

    protected void lnbEditHomePanels_Click(object sender, EventArgs e)
    {
        if (allowedAccess)
        {
            Session["editHomePanels"] = "true";

            panAdminControls.Visible = false;
            editHomePanels.Visible = true;

            imgPanBG.ImageUrl = panBG1;

            DataClassesDataContext dc = new DataClassesDataContext();

            var result = from p in dc.Pages
                         where p.name == "HomeContentBoxes"
                         select p;

            homePanels = result.First();

            LoadPanels(homePanels.text);
            SetPanels();
            SetEditPanels(0);
        }
    }

    protected void ddlPanToEdit_SelectedIndexChanged(object sender, EventArgs e)
    {
        InitLoadPanels();

        if (Session["editHomePanels"] != null)
        {
            panAdminControls.Visible = false;
            editHomePanels.Visible = true;
        }

        switch (ddlPanToEdit.SelectedIndex)
        {
            case -1:
                imgPanBG.ImageUrl = panBG1;
                lblPanHeading.Text = "No Panel Selected!";
                lblPanSubHeading.Text = "";
                break;
            case 0:
                SetEditPanels(0);
                break;
            case 1:
                SetEditPanels(1);
                break;
            case 2:
                SetEditPanels(2);
                break;
            default:
                imgPanBG.ImageUrl = panBG1;
                lblPanHeading.Text = "No Panel Selected!";
                lblPanSubHeading.Text = "";
                break;
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (Session["editHomePanels"] != null)
        {
            panAdminControls.Visible = false;
            editHomePanels.Visible = true;
        }

        if (ddlPanToEdit.SelectedIndex != -1)
        {
            imgPanBG.ImageUrl = txtPanImageUrl.Text;
            lblPanHeading.Text = txtPanHeading.Text;
            lblPanSubHeading.Text = txtPanSubHeading.Text;
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (Session["editHomePanels"] != null)
        {
            panAdminControls.Visible = false;
            editHomePanels.Visible = true;
        }

        InitLoadPanels();

        if (ddlPanToEdit.SelectedIndex != -1)
        {
            listHomePanels[ddlPanToEdit.SelectedIndex].Heading = txtPanHeading.Text;
            listHomePanels[ddlPanToEdit.SelectedIndex].SubHeading = txtPanSubHeading.Text;
            listHomePanels[ddlPanToEdit.SelectedIndex].ImageURL = txtPanImageUrl.Text;
            listHomePanels[ddlPanToEdit.SelectedIndex].URL = txtUrlLink.Text;

            SavePanels();

            InitLoadPanels();
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

    void SavePanels()
    {
        XmlSerializer xmlSerializer = new XmlSerializer(typeof(List<HomePanel>));
        StringWriter writer = new StringWriter();

        xmlSerializer.Serialize(writer, listHomePanels);

        DataClassesDataContext dc = new DataClassesDataContext();

        var result = from p in dc.Pages
                     where p.name == "HomeContentBoxes"
                     select p;

        Page panels = result.First();
        panels.text = writer.ToString();

        dc.SubmitChanges();
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

    void SetEditPanels(int panelNumber)
    {
        txtPanHeading.Text = listHomePanels[panelNumber].Heading;
        txtPanSubHeading.Text = listHomePanels[panelNumber].SubHeading;
        txtPanImageUrl.Text = listHomePanels[panelNumber].ImageURL;
        txtUrlLink.Text = listHomePanels[panelNumber].URL;

        imgPanBG.ImageUrl = listHomePanels[panelNumber].ImageURL;
        lblPanHeading.Text = listHomePanels[panelNumber].Heading;
        lblPanSubHeading.Text = listHomePanels[panelNumber].SubHeading;
    }

    void InitLoadPanels()
    {
        DataClassesDataContext dc = new DataClassesDataContext();

        var result = from p in dc.Pages
                     where p.name == "HomeContentBoxes"
                     select p;

        homePanels = result.First();

        LoadPanels(homePanels.text);
        SetPanels();
    }

    protected void btnExit_Click(object sender, EventArgs e)
    {
        panAdminControls.Visible = true;
        editHomePanels.Visible = false;

        Session["editHomePanels"] = null;
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (txtSearchBox.Text != "")
        {
            Response.Redirect("RemoveEdit.aspx?search=" + txtSearchBox.Text);
        }
    }
}