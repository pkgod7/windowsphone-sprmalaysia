<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CSharp.Login1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            font-family: "Yu Gothic";
            font-weight: bold;
        }
        .style2
        {
            font-family: "Yu Gothic";
            font-style: italic;
            font-size: small;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div align="center">
     <a href="Voter.aspx">Malaysia Voter Management</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="Login.aspx">SPR Login Management</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="SPR.aspx">Logout</a><br /><br />
     <asp:Image ID="Image1" runat="server" Height="121px" ImageUrl="~/spr.jpg" 
            Width="121px" />
        <br />
        <br />
        <span class="style1">Surahanjaya Pilihan Raya Malaysia</span><br />
        Election Commission of Malaysia<br />
        <span class="style2">&quot;Cekap dan Telus&quot;</span><br />
        <br />
        <br />
        <table border="1" width="30%">
                <tr>
                <th>Username</th>
                <td><asp:TextBox runat="server" ID="txtUsername" Width="95%" /></td>
                </tr>
                <tr>
                <th>Password</th>
                <td><asp:TextBox runat="server" ID="txtPassword" Width="95%" /></td>
                </tr>
                <tr>
                <th colspan="2"><asp:Button Text="Insert" runat="server" onclick="Unnamed1_Click" ID="txtSubmit" /></th>
                </tr>
            </table>
        <br />
        <asp:GridView ID="GridView1" runat="server" BackColor="White" 
            BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="40%">
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="Red" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <br />
        <br />
    </div>
    </form>
</body>
</html>
