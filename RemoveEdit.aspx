<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RemoveEdit.aspx.cs" Inherits="RemoveEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/adminPages.css" rel="stylesheet" />
    <title>Remove and edit job listings</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="adminListingPanel">
        <asp:Panel ID="panEditDelete" runat="server">
            <h2>Remove or Edit Job Listing</h2>

            <asp:TextBox ID="txtSearch" runat="server" Height="20"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="addJobBtn" OnClick="btnSearch_Click"/><br />
            <asp:Label ID="lblSearch" runat="server" Text="" Font-Size="Large" Font-Bold="true"></asp:Label>

            <asp:ListView ID="lstJobs" runat="server" OnPagePropertiesChanging="lstJobs_PagePropertiesChanging">
                <ItemTemplate>
                    <div class="jobEditArea">
                        <table>
                            <tr>
                                <td><asp:Label ID="Label1" runat="server" Text="" Font-Size="Medium" Font-Bold="true"><%#Eval("Title")%> - Reference : <%#Eval("ReferenceID")%></asp:Label>
                                    <ul class="removeEditAdminControls">
                                        <li><asp:LinkButton ID="lnkView" runat="server" CommandArgument='<%#Eval("Id")%>' OnClick="lnkView_Click">View</asp:LinkButton></li>
                                        <li><asp:LinkButton ID="lnkEdit" runat="server" CommandArgument='<%#Eval("Id")%>' OnClick="lnkEdit_Click">Edit</asp:LinkButton></li>
                                        <li><asp:LinkButton ID="lnkDelete" runat="server" CommandArgument='<%#Eval("Id")%>' OnClick="lnkDelete_Click">Delete</asp:LinkButton></li>
                                    </ul>
                                </td>
                            </tr>
                            <tr>
                                <td><asp:Label ID="Label2" runat="server" Text=""><%#Eval("ShortDescription")%></asp:Label></td>
                            </tr>
                            <tr>
                                <td><asp:Label ID="Label3" runat="server" Text="" Font-Size="Small"><%#Eval("ListedDate")%></asp:Label></td>
                            </tr>
                        </table>
                    </div>
                </ItemTemplate>
            </asp:ListView>

            <asp:DataPager ID="DataPager1" runat="server" PagedControlID="lstJobs" PageSize="10">
                <Fields>
                    <asp:NextPreviousPagerField ShowNextPageButton="false"/>
                    <asp:NumericPagerField ButtonCount="5" />
                    <asp:NextPreviousPagerField ShowPreviousPageButton="false"/>
                </Fields>
            </asp:DataPager>
        </asp:Panel>

        <asp:Panel ID="panNotLoggedIn" runat="server" Visible="false">
            <p>You must be signed in to add a new job listing. <a href="AdminLogin.aspx">Go to login page.</a></p>
        </asp:Panel>

        <asp:Panel ID="panDelete" runat="server" Visible="false">
            Are you sure you want to delete this entry?<br />
            <asp:Button ID="btnYes" runat="server" Text="Yes" CssClass="confirmationButtons" OnClick="btnYes_Click" />
            <asp:Button ID="btnNo" runat="server" Text="No" CssClass="confirmationButtons" OnClick="btnNo_Click"/>

        </asp:Panel>

        <asp:Panel ID="panDeleteOutcome" runat="server" Visible="false">
            <asp:Label ID="lblOutcome" runat="server" Text=""></asp:Label><br />
            <asp:Button ID="btnBackToList" runat="server" Text="Back to List"  CssClass="confirmationButtons" OnClick="btnBackToList_Click"/>
        </asp:Panel>
    </div>
</asp:Content>

