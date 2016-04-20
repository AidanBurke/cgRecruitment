<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SearchResults.aspx.cs" Inherits="SearchResults2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/search.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="searchContainer">
        <h3>
            <asp:Label ID="lblSearchResults" runat="server" Text="Label"></asp:Label>
        </h3>

        <asp:ListView ID="lstView" runat="server" OnPagePropertiesChanging="lstView_PagePropertiesChanging">
            <ItemTemplate>
                <table class="searchTable">
                    <tr>
                        <td>
                            <asp:LinkButton ID="lnkJob" runat="server" CssClass="jobLinkStyle" OnClick="lnkJob_Click" CommandArgument='<%#Eval("Id")%>'>
                                <%#Eval("Title")%></asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblLocation" runat="server" Text="" CssClass="jobLocation"><%#Eval("Location")%></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblShortDesc" runat="server" Text=""><%#Eval("ShortDescription")%></asp:Label>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
            <AlternatingItemTemplate>
                <table class="searchTableAlt">
                    <tr>
                        <td>
                            <asp:LinkButton ID="lnkJob" runat="server" CssClass="jobLinkStyle" OnClick="lnkJob_Click" CommandArgument='<%#Eval("Id")%>'>
                                <%#Eval("Title")%></asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblLocation" runat="server" Text="" CssClass="jobLocation"><%#Eval("Location")%></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblShortDesc" runat="server" Text=""><%#Eval("ShortDescription")%></asp:Label>
                        </td>
                    </tr>
                </table>
            </AlternatingItemTemplate>
        </asp:ListView>

        <asp:DataPager ID="DataPager1" runat="server" PagedControlID="lstView" PageSize="10">
            <Fields>
                <asp:NextPreviousPagerField ShowNextPageButton="false"/>
                <asp:NumericPagerField ButtonCount="5" />
                <asp:NextPreviousPagerField ShowPreviousPageButton="false"/>
            </Fields>
        </asp:DataPager>
    </div>
    <div class="searchBox">
        <h3>Search for a job</h3>
        <table style="width:100%;height:100%">
            <tr>
                <td style="padding:5px;vertical-align:middle"><asp:TextBox ID="txtKeyWords" runat="server" CssClass="searchFields"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="padding:5px;vertical-align:middle"><asp:DropDownList ID="ddlSector" runat="server" CssClass="searchFields">
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td style="padding:5px;vertical-align:middle">
                    <asp:DropDownList ID="ddlLocation" runat="server" CssClass="searchFields">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="padding:5px;vertical-align:middle">
                    <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="searchButton" OnClick="btnSearch_Click"/>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

