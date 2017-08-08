<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogInPage.aspx.cs" Inherits="_1stProject.LogInPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 210px;
        }
        .auto-style3 {
            width: 210px;
            height: 26px;
        }
        .auto-style4 {
            height: 26px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">Name Of The Candidate</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" Width="200px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">Email Id</td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" Width="199px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">Ph.No.</td>
                <td>
                    <asp:TextBox ID="TextBox3" runat="server" Width="200px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">DOB</td>
                <td>
                    <asp:TextBox ID="TextBox4" runat="server" Width="200px"></asp:TextBox>
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/MainStreets_CalendarIcon_small.png" OnClick="ImageButton1_Click" Width="18px" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>
                    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" Width="220px" OnSelectionChanged="Calendar1_SelectionChanged">
                        <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                        <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                        <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                        <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                        <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                        <WeekendDayStyle BackColor="#CCCCFF" />
                    </asp:Calendar>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">Country</td>
                <td>
                    <asp:DropDownList ID="ddlCountry" runat="server" AutoPostBack="True" DataTextField="CountryName" DataValueField="CountryId"  OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged">
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">State</td>
                <td>
                    <asp:DropDownList ID="ddlState" runat="server" AutoPostBack="True" DataTextField="StateName" DataValueField="StateId" OnSelectedIndexChanged="ddlState_SelectedIndexChanged">
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">City</td>
                <td class="auto-style4">
                    <asp:DropDownList ID="ddlCity" runat="server" DataTextField="CityName" DataValueField="CityId">
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style4"></td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit Data" OnClick="btnSubmit_Click" />
                </td>
                <td>
                    <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
