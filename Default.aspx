<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>CastleGlen Recruitment and HR</title>

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
    <div id="contentWrapper">
<%--        <div class="topContentBox">
            <asp:Label ID="lblContentPanels" runat="server" Text=""></asp:Label>
        </div>--%>

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

            <div id="infoArea">
                <h3>Our Services</h3>
                <ul>
                    <li>Recruitment services</li>
                    <li>HR Consultancy</li>
                    <li>CV writing services</li>
                    <li>This is another service</li>
                    <li>And another</li>
                </ul>
            </div>

            <div id="searchBox">
                <h3>Search for a job</h3>
                <table style="width:100%;height:90%">
                    <tr>
                        <td style="width:100%">
                            <asp:TextBox ID="txtKeyWords" runat="server" Text="" ToolTip="Search Keywords" Width="100%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:100%">
                            <asp:DropDownList ID="ddlSector" runat="server" Width="100%">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="width:100%">
                            <asp:DropDownList ID="ddlLocation" runat="server" Width="100%">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="searchButton" OnClick="btnSearch_Click"/>
                        </td>
                    </tr>
                </table>
            </div>

            <div id="latestPositions">
                <h3>Latest Positions</h3>
                <asp:ListView ID="lstLatestJobs" runat="server">
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td>
                                    <asp:LinkButton ID="lnkJob" runat="server" OnClick="lnkJob_Click" CommandArgument='<%#Eval("Id")%>'><%#Eval("Title")%></asp:LinkButton>
                                    -
                                    <asp:Label ID="lblDesc" runat="server" Text=""><%#Eval("Location")%></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:ListView>
            </div>
            <div id="serviceDescription">
                <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. 
                Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p>

                <p>Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. 
                Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. 
                Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. 
                Aenean vulputate eleifend</p>

            </div>
            <div class="floatFixer"></div>
        </div>
</asp:Content>

