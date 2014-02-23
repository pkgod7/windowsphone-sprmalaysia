<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Voter.aspx.cs" Inherits="CSharp.Voter" %>

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
            <table border="1" width="50%">
                <tr>
                <th>NRIC</th>
                <td><asp:TextBox runat="server" ID="txtNric" Width="95%" /></td>
                </tr>
                <tr>
                <th>Name</th>
                <td><asp:TextBox runat="server" ID="txtName" Width="95%" /></td>
                </tr>
                <tr>
                <th>Gender</th>
                <td><asp:DropDownList runat="server" ID="txtGender"><asp:ListItem Text="Male" 
                        Value="Male" /><asp:ListItem Text="Female" Value="Female" /></asp:DropDownList></td>
                </tr>
                <tr>
                <th>Parlimen</th>
                <td>
                    <asp:DropDownList ID="txtParlimen" runat="server">
                        <asp:ListItem Value="101-BUKIT JALIL"></asp:ListItem>
                        <asp:ListItem Value="102-SERDANG"></asp:ListItem>
                        <asp:ListItem Value="103-PUCHONG"></asp:ListItem>
                        <asp:ListItem Value="104-KELANA JAYA"></asp:ListItem>
                        <asp:ListItem Value="105-KAJANG"></asp:ListItem>
                        <asp:ListItem Value="106-PETALING JAYA"></asp:ListItem>
                        <asp:ListItem Value="107-SUBANG"></asp:ListItem>
                        <asp:ListItem Value="108-SHAH ALAM"></asp:ListItem>
                        <asp:ListItem Value="109-KEPONG"></asp:ListItem>
                        <asp:ListItem Value="110-PUTRAJAYA"></asp:ListItem>
                    </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                <th colspan="2"><asp:Button Text="Insert" runat="server" onclick="Unnamed1_Click" ID="txtSubmit" /></th>
                </tr>
            </table>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" 
            AllowPaging="True" AutoGenerateEditButton="True" 
            onrowcancelingedit="GridView1_RowCancelingEdit" 
            onrowediting="GridView1_RowEditing" onrowupdating="GridView1_RowUpdating" 
            Width="80%">
            <Columns>
                <asp:TemplateField HeaderText="NRIC">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("nric") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Gender">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" 
                            SelectedValue='<%# Bind("gender") %>'>
                            <asp:ListItem Value="Male"></asp:ListItem>
                            <asp:ListItem Value="Female"></asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("gender") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Parlimen">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" 
                            SelectedValue='<%# Bind("parlimen") %>'>
                            <asp:ListItem>101-BUKIT JALIL</asp:ListItem>
                            <asp:ListItem>102-SERDANG</asp:ListItem>
                            <asp:ListItem>103-PUCHONG</asp:ListItem>
                            <asp:ListItem>104-KELANA JAYA</asp:ListItem>
                            <asp:ListItem>105-KAJANG</asp:ListItem>
                            <asp:ListItem>106-PETALING JAYA</asp:ListItem>
                            <asp:ListItem>107-SUBANG</asp:ListItem>
                            <asp:ListItem>108-SHAH ALAM</asp:ListItem>
                            <asp:ListItem>109-KEPONG</asp:ListItem>
                            <asp:ListItem>110-PUTRAJAYA</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("parlimen") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
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
