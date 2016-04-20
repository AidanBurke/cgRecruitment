<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="HR.aspx.cs" Inherits="HR"  validateRequest="false" %>
<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>HR services</title>
    <link href="css/contentPages.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="PagesContentContainer">
        <asp:Panel ID="panSuccess" runat="server">
            <asp:Label ID="lblSuccess" runat="server" Text=""></asp:Label><br />
            <a href="Default.aspx">Return to home page.</a><br />
        </asp:Panel>

        <asp:Panel ID="panEditButton" runat="server">
            <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="hrButton" OnClick="btnEdit_Click"/>
        </asp:Panel>

        <asp:Panel ID="panEdit" runat="server">
            <FTB:FreeTextBox id="ftbMain" SupportFolder="FreeTextBox/" Width="700" JavaScriptLocation="ExternalFile" 
            ButtonImagesLocation="ExternalFile" ToolbarImagesLocation="ExternalFile" 
            runat="server"/>

            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="hrButton" OnClick="btnSave_Click"/>
            <asp:Button ID="btnPreview" runat="server" Text="Preview" CssClass="hrButton" OnClick="btnPreview_Click"/>
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="hrButton" OnClick="btnCancel_Click"/>
        </asp:Panel>

        <h2>HR Services</h2>
        <asp:Label ID="lblHRServices" runat="server" Text=""></asp:Label>
    </div>
    <div class="PagesContactBox">
        <h3>Contact us about our HR Services</h3>
        <asp:HyperLink ID="lnkEmail" runat="server"></asp:HyperLink><br />
        <p><asp:Label ID="lblPhoneNo" runat="server" Text=""></asp:Label></p>
    </div>
    <div class="floatFixer"></div>
   

</asp:Content>

