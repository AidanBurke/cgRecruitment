<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About"  validateRequest="false" %>
<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>About us</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="bgLayout">
        <asp:Panel ID="panSuccess" runat="server">
            <asp:Label ID="lblSuccess" runat="server" Text=""></asp:Label><br />
            <a href="Default.aspx">Return to home page.</a><br />
        </asp:Panel>
        <asp:Panel ID="panEditButton" runat="server">
            <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="aboutButton" OnClick="btnEdit_Click" />
        </asp:Panel>
        <asp:Panel ID="panEdit" runat="server">
            <FTB:FreeTextBox id="ftbMain" SupportFolder="FreeTextBox/" Width="1018" JavaScriptLocation="ExternalFile" 
            ButtonImagesLocation="ExternalFile" ToolbarImagesLocation="ExternalFile" 
            runat="server"/>

            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="aboutButton" OnClick="btnSave_Click" />
            <asp:Button ID="btnPreview" runat="server" Text="Preview" CssClass="aboutButton" OnClick="btnPreview_Click" />
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="aboutButton" OnClick="btnCancel_Click" />
        </asp:Panel>

        <h2>About Us</h2>
        <asp:Label ID="lblAbout" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>

