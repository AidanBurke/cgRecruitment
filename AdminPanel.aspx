<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminPanel.aspx.cs" Inherits="AdminPanel2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/adminPages.css" rel="stylesheet" />
    <title>Admin Panel</title>

        <!-- include jQuery library -->
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
    <!-- include Cycle plugin -->
    <script type="text/javascript" src="javascript/jquery.cycle.all.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.topContentBox').cycle({
                fx: 'fade' // choose your transition type, ex: fade, scrollUp, shuffle, etc...
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="adminMainContent">
        <asp:Panel ID="panAdminControls" runat="server">
            <div id="adminPanel">
                <h2>Admin Panel</h2>
                <ul>
                    <li>
                        <a href="AddJob.aspx">Add a new job listing.</a>
                    </li>
                    <li>
                        <a href="RemoveEdit.aspx">Remove or edit a listing.</a>
                    </li>
                    <li>
                        <a href="About.aspx">Edit about page.</a>
                    </li>
                    <li>
                        <a href="HR.aspx">Edit HR page.</a>
                    </li>
                    <li>
                        <a href="Recruitment.aspx">Edit recruitment page.</a>
                    </li>
                    <li>
                        <a href="CVTips.aspx">Edit CV tips page.</a>
                    </li>
                    <li>
                        <asp:LinkButton ID="lnbEditHomePanels" runat="server" OnClick="lnbEditHomePanels_Click">Edit home panels</asp:LinkButton>
                    </li>
                </ul>
            </div>
            <div id="adminQuickSearch">
                <h2>Quick Search By ID</h2>
                <asp:TextBox ID="txtSearchBox" Height="25" runat="server" Font-Size="Large" Width="250" CssClass="adminSearchTextbox"></asp:TextBox><br />
                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="adminSearchButton" OnClick="btnSearch_Click" />
                <div class="floatFixer"></div>
            </div>
            <div class="floatFixer"></div>



        </asp:Panel>

        <asp:Panel ID="panNotLoggedIn" runat="server">
            <asp:Label ID="lblNotLoggedIn" runat="server" Text=""></asp:Label>
            <a href="Default.aspx">Back to the home page.</a>
        </asp:Panel>

        <asp:Panel ID="editHomePanels" runat="server">
            <h2>Edit Home Panels</h2>
            <div id="editHomePanelsDiv">
                <table class="editPanelsTable">
                    <tr>
                        <td>
                            Panel to edit
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlPanToEdit" runat="server" Width="200" OnSelectedIndexChanged="ddlPanToEdit_SelectedIndexChanged" AutoPostBack="true">
                                <asp:ListItem>Panel 1</asp:ListItem>
                                <asp:ListItem>Panel 2</asp:ListItem>
                                <asp:ListItem>Panel 3</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>Heading : </td>
                        <td><asp:TextBox ID="txtPanHeading" runat="server" Width="500"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="vertical-align:top">Url Link : </td>
                        <td><asp:TextBox ID="txtUrlLink" runat="server" Width="500"></asp:TextBox><br />
                            <p>Navigate to the url you wish to link to and paste it in this text box</p>
                        </td>
                    </tr>
                    <tr>
                        <td>Sub-heading : </td>
                        <td><asp:TextBox ID="txtPanSubHeading" runat="server" Width="500"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="vertical-align:top">Image Url :</td>
                        <td><asp:TextBox ID="txtPanImageUrl" runat="server" Width="500"></asp:TextBox><br />
                            <p>For best results use image cropped to 220 pixels high and 1030 long. A default image will appear if no URL in specified</p>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="editPanelsButton" OnClick="btnUpdate_Click"/>
                            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="editPanelsButton" OnClick="btnSave_Click"/>
                            
                        </td>
                        <td><asp:Button ID="btnExit" runat="server" Text="Exit" CssClass="editPanelsButton" OnClick="btnExit_Click" /></td>
                    </tr>
                </table>
            </div>

            <div class="scrollingContentBox">
                <asp:Image ID="imgPanBG" runat="server" CssClass="panImg"/>
                <div class="panSubDiv">
                    <asp:Label ID="lblPanHeading" runat="server" Text="Heading 1" CssClass="panelHeading"></asp:Label><br />
                    <asp:Label ID="lblPanSubHeading" runat="server" Text="Here is a Sub heading"></asp:Label>
                </div>
            </div>

            <asp:Panel ID="Panel1" runat="server" Visible="true">
                
                    <div class="topContentBox" id="homeContentScroller" runat="server">
                        <div class="scrollingContentBox">
                            <asp:Image ID="imgPan1BG" runat="server" CssClass="panImg"/>
                            <div class="panSubDiv">
                                <asp:HyperLink ID="lnkPan1Heading" CssClass="panelHeading" runat="server"></asp:HyperLink><br />
                                <asp:HyperLink ID="lnkPan1Sub" runat="server"></asp:HyperLink>
                            </div>
                        </div>

                        <div class="scrollingContentBox">
                            <asp:Image ID="imgPan2BG" runat="server" CssClass="panImg"/>
                            <div class="panSubDiv">
                                <asp:HyperLink ID="lnkPan2Heading" CssClass="panelHeading" runat="server"></asp:HyperLink><br />
                                <asp:HyperLink ID="lnkPan2Sub" runat="server"></asp:HyperLink>
                            </div>
                        </div>

                        <div class="scrollingContentBox">
                            <asp:Image ID="imgPan3BG" runat="server" CssClass="panImg"/>
                            <div class="panSubDiv">
                                <asp:HyperLink ID="lnkPan3Heading" CssClass="panelHeading" runat="server"></asp:HyperLink><br />
                                <asp:HyperLink ID="lnkPan3Sub" runat="server"></asp:HyperLink>
                            </div>
                        </div>
                    </div>
               
            </asp:Panel>


        </asp:Panel>

    </div>
</asp:Content>

