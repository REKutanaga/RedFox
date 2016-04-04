<%@ Page Title="ViewData" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="ViewData.aspx.cs" Inherits="CAPSAM.ViewData" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div>
        <div class="jumbotron"><h1>View Data</h1></div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:GridView ID="GridView1" CssClass="datagrid1" runat="server" DataSourceID="MySqlCustomerData" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                        <asp:BoundField DataField="Contact Name" HeaderText="Contact Name" SortExpression="Contact Name" />
                        <asp:BoundField DataField="Contact Number" HeaderText="Contact Number" SortExpression="Contact Number" />
                        <asp:BoundField DataField="Orders Open" HeaderText="Orders Open" SortExpression="Orders Open" />
                        <asp:BoundField DataField="Orders Scheduled" HeaderText="Orders Scheduled" SortExpression="Orders Scheduled" />
                        <asp:BoundField DataField="Orders In Progress" HeaderText="Orders In Progress" SortExpression="Orders In Progress" />
                        <asp:BoundField DataField="Orders Complete" HeaderText="Orders Complete" SortExpression="Orders Complete" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="MySqlCustomerData" runat="server" ConnectionString="server=localhost;user id=remotecustomer;persistsecurityinfo=True;database=customer;password=remotecustomer" ProviderName="MySql.Data.MySqlClient" SelectCommand="CALL get_data_with_aliases();"></asp:SqlDataSource>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
