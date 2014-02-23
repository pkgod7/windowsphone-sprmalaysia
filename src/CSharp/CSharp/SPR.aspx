<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SPR.aspx.cs" Inherits="CSharp.Login" %>

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
    
    
        <asp:Image ID="Image1" runat="server" Height="121px" ImageUrl="~/spr.jpg" 
            Width="121px" />
        <br />
        <br />
        <span class="style1">Surahanjaya Pilihan Raya Malaysia</span><br />
        Election Commission of Malaysia<br />
        <span class="style2">&quot;Cekap dan Telus&quot;</span><br />
        <br />
        <br />
    
    
        Username :
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        Password :
        <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
        <br />
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Login" />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    
    
    </div>
    </form>
</body>
</html>
