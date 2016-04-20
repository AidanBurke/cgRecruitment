<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddJob.aspx.cs" Inherits="AddJob" validateRequest="false" %>
<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/adminPages.css" rel="stylesheet" />
    <title>Add a Job</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="addJobMain">
        <h2><asp:Label ID="lblTitle" runat="server" Text=""></asp:Label></h2>
        <asp:Panel ID="panLoggedIn" runat="server">
            <table>
                <tr>
                    <td class="addJobTable">Job Title :</td>
                    <td class="addJobTable"><asp:TextBox ID="txtTitle" runat="server" MaxLength="100" CssClass="addJobTextBox"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="addJobTable">Reference Number(if any) :</td>
                    <td class="addJobTable"><asp:TextBox ID="txtRefNo" runat="server" MaxLength="50" CssClass="addJobTextBox"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="addJobTable">Location :</td>
                    <td class="addJobTable">
                        <asp:DropDownList ID="ddlLocation" runat="server" Width="250"></asp:DropDownList>
                        <asp:LinkButton ID="lnbAddLocation" runat="server" OnClick="lnbAddLocation_Click">Add a new location</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td class="addJobTable">Short Description :</td>
                    <td class="addJobTable"><asp:TextBox ID="txtShortDescription" runat="server" MaxLength="140" CssClass="addJobTextBox"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="addJobTable">Job Sector :</td>
                    <td class="addJobTable">
                        <asp:DropDownList ID="ddlSectors" runat="server" Width="250"></asp:DropDownList>
                        <asp:LinkButton ID="lnbAddSector" runat="server" OnClick="lnbAddSector_Click">Add a new job sector</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td class="addJobTable">Longer Description :</td>
                    <td style="padding:5px;">
                        <FTB:FreeTextBox id="FreeTextBox1" SupportFolder="FreeTextBox/" JavaScriptLocation="ExternalFile" 
                        ButtonImagesLocation="ExternalFile" ToolbarImagesLocation="ExternalFile" 
                        runat="server" OnTextChanged="FreeTextBox1_TextChanged" /><br />

                        <asp:Button ID="btnPreview" runat="server" Text="Preview"  CssClass="addJobBtn" OnClick="btnPreview_Click"/>
                    
                    </td>
                </tr>
                <tr>
                    <td class="addJobTable"></td>
                    <td class="addJobTable"><asp:Button ID="btnAdd" runat="server" Text="Add Job" CssClass="addJobBtn" OnClick="btnAdd_Click"/></td>
                </tr>
                <tr>
                    <td class="addJobTable">Longer rescription<br /> Preview :</td>
                    <td class="addJobTable"><asp:Label ID="lblLongerDescriptionResult" runat="server" Text=""></asp:Label></td>
                </tr>
            </table>
        </asp:Panel>

        <asp:Panel ID="panNotLoggedIn" runat="server" Visible="false">
            <p>You must be signed in to add a new job listing. <a href="AdminLogin.aspx">Go to login page.</a></p>
        </asp:Panel>

        <asp:Panel ID="panSuccess" runat="server">
            <asp:Label ID="lblSuccess" runat="server" Text=""></asp:Label><a href="AdminPanel.aspx"> Click to return to the admin panel.</a><br />
            <asp:Button ID="btnAddAnother" runat="server" Text="Add another listing" OnClick="btnAddAnother_Click" CssClass="addJobBtn"/>
        </asp:Panel>

        <asp:Panel ID="panEditSuccess" runat="server">
            <asp:Label ID="lblEditSuccess" runat="server" Text=""></asp:Label>
            <a href="RemoveEdit.aspx">Click to return to the Remove and Edit page.</a>
        </asp:Panel>

        <asp:Panel ID="panEditFailure" runat="server">
            The following error occured.<br />
            <asp:Label ID="lblEditError" runat="server" Text=""></asp:Label><br />
            <asp:Button ID="btnTryEditAgain" runat="server" Text="Try Again" />
        </asp:Panel>

        <asp:Panel ID="panAddLocation" runat="server">
            <p>Add a location</p>
            <asp:TextBox ID="txtNewLocation" runat="server" MaxLength="150" Width="250" CssClass="addLocSecTextbox"></asp:TextBox><br />
            <asp:Button ID="btnAddLocation" runat="server" Text="Add Location" OnClick ="btnAddLocation_Click"/>
        </asp:Panel>

        <asp:Panel ID="panAddSector" runat="server">
            <p>Add a job sector</p>
            <asp:TextBox ID="txtNewSector" runat="server" MaxLength="150" Width="250" CssClass="addLocSecTextbox"></asp:TextBox><br />
            <asp:Button ID="btnAddSector" runat="server" Text="Add Sector" OnClick="btnAddSector_Click" />
        </asp:Panel>
    </div>
</asp:Content>

