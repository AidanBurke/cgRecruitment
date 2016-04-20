<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="JobListing.aspx.cs" Inherits="JobListing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/jobListing.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="listingContainer">
        <asp:Label ID="lblJobTitle" runat="server" Text="" Font-Size="X-Large" Font-Bold="true"></asp:Label>
        <table>
            <tr>
                <td>
                    <asp:Label ID="lblLocation" runat="server" Text=""></asp:Label> - 
                    <asp:Label ID="lblReference" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblDescription" runat="server" Text=""></asp:Label>
                </td>
            </tr>
        </table>
    </div>

    <div class="contactCard">
        <h3>Contact Job Consultant</h3>
        <asp:Label ID="lblName" runat="server" Text=""></asp:Label><br />
        <asp:HyperLink ID="lnkEmail" runat="server"></asp:HyperLink><br />
        <asp:Label ID="lblNumber" runat="server" Text=""></asp:Label><br />
        <asp:LinkButton ID="lnbApply" runat="server" OnClick="lnbApply_Click">Apply for position</asp:LinkButton>
    </div>
</asp:Content>

