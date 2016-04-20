<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Recruitment.aspx.cs" Inherits="Recruitment" validateRequest="false" %>
<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Recruitment services</title>
    <link href="css/contentPages.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="PagesContentContainer">
        <asp:Panel ID="panSuccess" runat="server">
            <asp:Label ID="lblSuccess" runat="server" Text=""></asp:Label><br />
            <a href="Default.aspx">Return to home page.</a><br />
        </asp:Panel>

        <asp:Panel ID="panEditButton" runat="server">
            <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="recruitmentButton" OnClick="btnEdit_Click"/>
        </asp:Panel>

        <asp:Panel ID="panEdit" runat="server">
            <FTB:FreeTextBox id="ftbMain" SupportFolder="FreeTextBox/" Width="700" JavaScriptLocation="ExternalFile" 
            ButtonImagesLocation="ExternalFile" ToolbarImagesLocation="ExternalFile" 
            runat="server"/>

            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="recruitmentButton" OnClick="btnSave_Click" />
            <asp:Button ID="btnPreview" runat="server" Text="Preview" CssClass="recruitmentButton" OnClick="btnPreview_Click" />
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="recruitmentButton" OnClick="btnCancel_Click" />
        </asp:Panel>

        <h2>Recruitment Services</h2>
        <asp:Label ID="lblrecruitment" runat="server" Text=""></asp:Label>
    </div>

    <div class="PagesContactBox">
        <h3>Contact us about our Recruitment Services</h3>
        <asp:HyperLink ID="lnkEmail" runat="server"></asp:HyperLink><br />
        <p><asp:Label ID="lblPhoneNo" runat="server" Text=""></asp:Label></p>
    </div>

    <div class="floatFixer"></div>

</asp:Content>

