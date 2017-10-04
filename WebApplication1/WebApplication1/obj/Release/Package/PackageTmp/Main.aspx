<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="WebApplication1.Main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Order Food</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />  
</head>
<body>
    <form id="form1" runat="server">
        <fieldset>
        <div id="mainBody"> 
            <asp:Image ID="headImage" runat="server" ImageUrl="~/Images/242452.png"  Width="200" Height="200"/>
            <h1><asp:Label ID="heading" runat="server" ForeColor="#66cc99" Text="ORDER FOOD"></asp:Label></h1>

            <asp:Table style="margin-right:auto; margin-left:auto; text-align:center" Width="50%" ID="orderTable" CellPadding="10" runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="firstName" runat="server" CssClass="lblFont" Text=" First Name" Width="200px"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtFirstName" runat="server" CssClass="textBox"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lastName" runat="server" CssClass="lblFont" Text=" Last Name"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtLastName" runat="server" CssClass="textBox"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="city" runat="server" CssClass="lblFont" Text=" City"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtCity" runat="server" CssClass="textBox"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="postalCode" runat="server" CssClass="lblFont" Text=" Postal Code"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtPostalcode" runat="server" CssClass="textBox"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="phoneNum" runat="server" CssClass="lblFont" Text=" Phone Number"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtPhone" runat="server" CssClass="textBox"></asp:TextBox> 
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="province" runat="server" CssClass="lblFont" Text=" Province"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                         <asp:DropDownList ID="listProvince" runat="server" CssClass="listStyle" Font-Size="Medium" >
                            <asp:ListItem>Ontario</asp:ListItem>
                            <asp:ListItem>British Columbia</asp:ListItem>
                            <asp:ListItem>Quebec</asp:ListItem>
                            <asp:ListItem>Alberta</asp:ListItem>
                            <asp:ListItem>Nova Scotia</asp:ListItem>
                            <asp:ListItem>Manitoba</asp:ListItem>
                        </asp:DropDownList>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="food" runat="server" CssClass="lblFont" Text=" Food"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell  HorizontalAlign="Center">
                        <asp:CheckBoxList ID="foodCheckbox" runat="server" CssClass="chkStyle">
                            <asp:ListItem>Korean BBQ</asp:ListItem>
                            <asp:ListItem>Tonkotsu Ramen</asp:ListItem>
                            <asp:ListItem>Dumpling</asp:ListItem>
                            <asp:ListItem>Miso Ramen</asp:ListItem>
                            <asp:ListItem>Tan Tan Ramen</asp:ListItem>
                            <asp:ListItem>Shoyu Ramen</asp:ListItem>
                        </asp:CheckBoxList>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="option" runat="server" CssClass="lblFont" Text=" Option"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RadioButton ID="RadioButton1" runat="server" Text="Pick Up      "  />
                        <asp:RadioButton ID="RadioButton2" runat="server" Text="Delivery" />
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="comment" runat="server" CssClass="lblFont" Text=" Comments"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtComment" runat="server" CssClass="textBoxComment" TextMode="MultiLine" Rows="5"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>

            <asp:Button ID="btnOrder" runat="server" CssClass="btnOrder" Text="ORDER" />

        </div>
            </fieldset>
    </form>
</body>
</html>
