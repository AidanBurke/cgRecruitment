<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>
<%@ Register TagPrefix="recaptcha" Namespace="Recaptcha" Assembly="Recaptcha" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="bgLayout">
        <h2>Contact us <asp:Label ID="lblContact" runat="server" Text=""></asp:Label></h2>
        <asp:Panel ID="panStandard" runat="server">
            <table>
                <tr>
                    <td class="contactTd">Name *</td>
                    <td class="contactTd">
                        <asp:TextBox ID="txtStandName" runat="server" Width="400"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtStandName" 
                            ErrorMessage="Name Required" CssClass="contactErrorMessage"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="contactTd">Email *</td>
                    <td class="contactTd">
                        <asp:TextBox ID="txtStandEmail" runat="server" Width="400"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtStandEmail" 
                            ErrorMessage="Email Required" CssClass="contactErrorMessage"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="vertical-align:top" class="contactTd">Other Comments *</td>
                    <td class="contactTd">
                        <asp:TextBox ID="txtStandMessage" TextMode="MultiLine" runat="server" Width="400" Height="100"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtStandMessage"
                            ErrorMessage="Comments Required" CssClass="contactErrorMessage"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="contactTd"></td>
                    <td class="contactTd">
                        <recaptcha:RecaptchaControl
                            ID="RecaptchaControl1"
                            runat="server"
                            PublicKey="6Lc96-4SAAAAADw3_OHsa9KICMWWfZlgx4kTasIG"
                            PrivateKey="6Lc96-4SAAAAANkqVqStlsujCvhJVvmk65BFO00O"
                            />
                        <asp:Label ID="lblCaptcha2" runat="server" Text="" CssClass="contactErrorMessage"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="contactTd"></td>
                    <td class="contactTd">
                        <asp:Button ID="btnStandSubmit" runat="server" Text="Send" CssClass="contactButton" OnClick="btnStandSubmit_Click"/>
                    </td>
                </tr>
            </table>
        </asp:Panel>

        <asp:Panel ID="panJobApp" runat="server">
            <table>
                <tr>
                    <td class="contactTd">Name *</td>
                    <td class="contactTd">
                        <asp:TextBox ID="txtName" runat="server" Width="400"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" 
                            ErrorMessage="Name Required" CssClass="contactErrorMessage"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="contactTd">Email *</td>
                    <td class="contactTd">
                        <asp:TextBox ID="txtEmail" runat="server" Width="400"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" 
                            ErrorMessage="Email Required" CssClass="contactErrorMessage"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="vertical-align:top" class="contactTd">Other Comments</td>
                    <td class="contactTd"><asp:TextBox ID="txtComments" TextMode="MultiLine" runat="server" Width="400" Height="100"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="contactTd">Upload CV </td>
                    <td class="contactTd">
                        <asp:FileUpload ID="fupCV" runat="server" AllowMultiple="false"/>
                        <asp:RegularExpressionValidator ID="regValUpload" CssClass="contactErrorMessage" 
                            ControlToValidate="fupCV" runat="server" ErrorMessage="Only pdf, doc, or docx files accepted"
                             ValidationExpression="^([a-zA-Z].*|[1-9].*)\.(((p|P)(d|D)(f|F))|((d|D)(o|O)(c|C))||((d|D)(o|O)(c|C)(x|X)))$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="contactTd"></td>
                    <td class="contactTd">
                        <recaptcha:RecaptchaControl
                            ID="recaptcha"
                            runat="server"
                            PublicKey="6Lc96-4SAAAAADw3_OHsa9KICMWWfZlgx4kTasIG"
                            PrivateKey="6Lc96-4SAAAAANkqVqStlsujCvhJVvmk65BFO00O"
                            />
                        <asp:Label ID="lblCaptcha" runat="server" Text="" CssClass="contactErrorMessage"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="contactTd"></td>
                    <td class="contactTd"><asp:Button ID="btnSendJobapp" runat="server" Text="Send" OnClick="btnSendJobapp_Click"  CssClass="contactButton"/></td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="panSuccess" runat="server">
            <asp:Label ID="lblSuccess" runat="server" Text=""></asp:Label>
        </asp:Panel>
    </div>
</asp:Content>

