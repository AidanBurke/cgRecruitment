using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Contact : System.Web.UI.Page
{
    int id;
    JobsAvailable job;

    string jobAppAddress = "aidanburke1992@gmail.com";
    string contactAddress = "aidanburke1992@gmail.com";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString.Count > 0)
        {
            if (Request.QueryString["id"] != null)
            {
                id = Convert.ToInt32(Request.QueryString["id"]);

                panJobApp.Visible = true;
                panStandard.Visible = false;
                panSuccess.Visible = false;

                Title = "Contact us about job application";
                lblContact.Text = "about a job";

                GetJob(id);
            }
        }
        else
        {
            panJobApp.Visible = false;
            panStandard.Visible = true;
            panSuccess.Visible = false;

            Title = "Contact Us";
        }
    }

    protected void btnSendJobapp_Click(object sender, EventArgs e)
    {
        if (fupCV.HasFile && Page.IsValid)
        {
            MailMessage message = new MailMessage(
                txtEmail.Text,
                jobAppAddress,
                "Job Application",
                txtName.Text + " is applying for " + job.Title + ". With the reference ID : " + job.ReferenceID +  "</ br>" + "<h3>Attached Comments(if any)</h3>" + txtComments.Text);
            message.IsBodyHtml = true;

            HttpPostedFile cvFile = fupCV.PostedFile;
            Attachment emailAttachment = new Attachment(fupCV.PostedFile.InputStream, fupCV.PostedFile.FileName);

            message.Attachments.Add(emailAttachment);

            try
            {
                SmtpClient client = new SmtpClient();
                client.Credentials = new System.Net.NetworkCredential("dummyemail36464@gmail.com", "wZM5QXD?^Q@k7(X");
                client.Port = 587;
                client.Host = "smtp.gmail.com";
                client.EnableSsl = true;

                client.Send(message);
            }
            catch (Exception ex)
            {
                lblSuccess.Text = ex.Message;
            }

            panJobApp.Visible = false;
            panSuccess.Visible = true;

            lblSuccess.Text = "Sent Successfully!";
        }

        if (!Page.IsValid)
        {
            lblCaptcha.Text = "Incorrect";
        }
    }

    protected void btnStandSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            lblCaptcha2.Text = "";

            MailMessage message = new MailMessage(
                txtStandEmail.Text,
                contactAddress,
                txtStandName.Text + " Has contacted you",
                "<h3>Attached Comments(if any)</h3>" + txtStandMessage.Text + "<h4>Their Email<h4>" + txtStandEmail.Text);
            message.IsBodyHtml = true;

            try
            {
                SmtpClient client = new SmtpClient();
                client.Credentials = new System.Net.NetworkCredential("dummyemail36464@gmail.com", "wZM5QXD?^Q@k7(X");
                client.Port = 587;
                client.Host = "smtp.gmail.com";
                client.EnableSsl = true;

                client.Send(message);
            }
            catch (Exception ex)
            {
                lblSuccess.Text = ex.Message;
            }

            panStandard.Visible = false;
            panSuccess.Visible = true;

            lblSuccess.Text = "Sent Successfully!";
        }

        if (!Page.IsValid)
        {
            lblCaptcha2.Text = "Incorrect";
        }
    }

    void GetJob(int id)
    {
        DataClassesDataContext dc = new DataClassesDataContext();

        job = null;

        foreach (JobsAvailable j in dc.JobsAvailables)
        {
            if (id == j.Id)
            {
                job = j;
            }
        }
    }
}