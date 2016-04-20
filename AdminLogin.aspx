<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminLogin.aspx.cs" Inherits="AdminLogin2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/adminPages.css" rel="stylesheet" />
    <title>Admin Login</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="adminLoginMain">
        <asp:Panel ID="panLogin" runat="server">
                        <table class="adLoginTable">
                <tr>
                    <td></td>
                    <td><h3>Admin Login</h3></td>
                </tr>
                <tr>
                    <td>Username :</td>
                    <td>
                        <asp:TextBox ID="txtUsername" runat="server" CssClass="adTextbox"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" 
                            ErrorMessage="Username Required" ControlToValidate="txtUsername">
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>Password :</td>
                    <td>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="adTextbox"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" 
                            ErrorMessage="Password Required" ControlToValidate="txtPassword">
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" CssClass="adLoginButton"/>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Label ID="lblIncorrect" runat="server" Text=""></asp:Label></td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="panAlreadyLogged" runat="server" ViewStateMode="Disabled">
            <p>You are already logged in. <a href="AdminPanel.aspx">Click here to procede to the admin panel.</a></p>
        </asp:Panel>
        </div>
</asp:Content>

