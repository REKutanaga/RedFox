<%@ Page Title="ViewData" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewData.aspx.cs" Inherits="CAPSAM.ViewData" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron-head">
        <div>
            <h1>View Data</h1>
        </div>
    </div>

    <div class="body-container">

        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                
                <div class="data-container">

                    <div class="datagrid1">

                        <div class="search-container">
                            <asp:Label ID="DataSearchLabel" runat="server" Text=""></asp:Label>
                            <asp:TextBox ID="DataSearchText" runat="server" Text=""></asp:TextBox>
                            <asp:Button ID="DataSearchButton" runat="server" Text="Search" OnClick="DataSearchButton_Click" />
                        </div>

                        <asp:GridView ID="GridView1" runat="server" DataSourceID="MySqlCustomerData" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="ID" ForeColor="Black" GridLines="Horizontal">
                            <Columns>
                                <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" DataFormatString="{0:d4}" ReadOnly="True" />
                                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                                <asp:BoundField DataField="Contact Name" HeaderText="Contact Name" SortExpression="Contact Name" />
                                <asp:BoundField DataField="Contact Number" HeaderText="Contact Number" SortExpression="Contact Number" />
                                <asp:BoundField DataField="Orders Open" HeaderText="Orders Open" SortExpression="Orders Open" />
                                <asp:BoundField DataField="Orders Scheduled" HeaderText="Orders Scheduled" SortExpression="Orders Scheduled" />
                                <asp:BoundField DataField="Orders In Progress" HeaderText="Orders In Progress" SortExpression="Orders In Progress" />
                                <asp:BoundField DataField="Orders Complete" HeaderText="Orders Complete" SortExpression="Orders Complete" />
                            </Columns>
                            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F7F7F7" />
                            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                            <SortedDescendingCellStyle BackColor="#E5E5E5" />
                            <SortedDescendingHeaderStyle BackColor="#242121" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="MySqlCustomerData" runat="server" ConnectionString="server=localhost;user id=remotecustomer;persistsecurityinfo=True;database=customer;password=remotecustomer" ProviderName="MySql.Data.MySqlClient" SelectCommand="CALL get_data_at_id_name_addr_with_aliases('');"></asp:SqlDataSource>
                    
                    </div>

                </div>

                <div><%--placeholder for data insert stuff--%>

                </div>

            </ContentTemplate>
        </asp:UpdatePanel>

    </div>
</asp:Content>
