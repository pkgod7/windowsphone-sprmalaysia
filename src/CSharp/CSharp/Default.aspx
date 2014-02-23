<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CSharp.Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <center>
        <fieldset style="width:400px;">
            <legend>XML Database Demo</legend>
            <table border="1" width="100%">
                <tr>
                <th>ID</th>
                <td><asp:TextBox runat="server" ID="txtID" /></td>
                </tr>
                <tr>
                <th>First Name</th>
                <td><asp:TextBox runat="server" ID="txtFirstName" /></td>
                </tr>
                <tr>
                <th>Last Name</th>
                <td><asp:TextBox runat="server" ID="txtLastName" /></td>
                </tr>
                <tr>
                <th>City</th>
                <td><asp:DropDownList runat="server" ID="ddlCity"><asp:ListItem Text="Kabul" 
                        Value="Kabul" /><asp:ListItem Text="Kuala Lumpur" Value="Kuala Lumpur" /></asp:DropDownList></td>
                </tr>
                <tr>
                <th>Gender</th>
                <td><asp:RadioButtonList runat="server" ID="rblGender"><asp:ListItem Text="Male" /><asp:ListItem Text="Female" /></asp:RadioButtonList></td>
                </tr>
                <tr>
                <th>Pincode</th>
                <td><asp:TextBox runat="server" ID="txtPincode" /></td>
                </tr>
                <tr>
                <th>Mobile No</th>
                <td><asp:TextBox runat="server" ID="txtMobileNo" /></td>
                </tr>
                <tr>
                <th colspan="2"><asp:Button Text="Insert" runat="server" onclick="Unnamed1_Click" ID="btnSubmit" /></th>
                </tr>
            </table>
            <br/>
            <asp:GridView runat="server" ID="GridView1" CellPadding="4" AllowPaging="True" 
                AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" 
                BorderStyle="None" BorderWidth="1px" 
                AutoGenerateEditButton="True" onrowediting="GridView1_RowEditing" 
                onrowcancelingedit="GridView1_RowCancelingEdit" 
                onrowupdating="GridView1_RowUpdating" >
                <Columns>
                    <asp:TemplateField HeaderText="ID">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ID") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="First Name">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("FirstName") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("FirstName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Last Name">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("LastName") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("LastName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="City">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList2" runat="server" 
                                SelectedValue='<%# Bind("City") %>'>
                                <asp:ListItem>Kabul</asp:ListItem>
                                <asp:ListItem Value="Kuala Lumpur"></asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("City") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Gender">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList3" runat="server" 
                                SelectedValue='<%# Bind("Gender") %>'>
                                <asp:ListItem>Male</asp:ListItem>
                                <asp:ListItem>Female</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("Gender") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Pincode">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Pincode") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("Pincode") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Mobile No">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("MobileNo") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("MobileNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#330099" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                <SortedAscendingCellStyle BackColor="#FEFCEB" />
                <SortedAscendingHeaderStyle BackColor="#AF0101" />
                <SortedDescendingCellStyle BackColor="#F6F0C0" />
                <SortedDescendingHeaderStyle BackColor="#7E0000" />
            </asp:GridView>
            <br />
        </fieldset>
    </center>
    </div>
    </form>
</body>
</html>
