<%@ Page Title="ViewData" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewData.aspx.cs" Inherits="CAPSAM.ViewData" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:UpdatePanel ID="ModeSwitchUpdatePanel" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div>
                <div>
                    <b><button id="ViewData" runat="server" class="switch-btn b" onclick="ViewDataButton_click">View Data</button></b>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <div class="body-container">

        <asp:UpdatePanel ID="ViewDataUpdatePanel" runat="server" UpdateMode="Conditional">
            <ContentTemplate>

                <div class="data-container">

                    

                    <div class="search-container">
                            <asp:Label ID="DataSearchLabel" CssClass="l" runat="server" Text=""></asp:Label>
                            <asp:TextBox ID="DataSearchText" CssClass="t" runat="server" Text=""></asp:TextBox>
                            <asp:Button ID="DataSearchButton" CssClass="b button-anim" runat="server" Text="Search" OnClick="DataSearchButton_Click" />
                        </div>

                    <div id="datagrid">

                        <div>

                            <ctrl:ExGridView ID="DataGridView" runat="server" DataSourceID="MySqlCustomerData" AutoGenerateColumns="False" 
                                BackColor="White" BorderColor="#111111" BorderStyle="Solid" Gridlines="Both"
                                BorderWidth="1px" CellPadding="4" DataKeyNames="ID" GridHeight="100%"
                                ForeColor="Black" AllowSorting="True">
                                <Columns>
                                    <asp:BoundField HeaderStyle-CssClass="dg-id datagrid-numberitem datagrid-header" ItemStyle-CssClass="dg-id datagrid-numberitem" DataField="ID" HeaderText="ID" SortExpression="ID" DataFormatString="{0:d6}" ReadOnly="True" />
                                    <asp:BoundField HeaderStyle-CssClass="dg-name datagrid-longitem datagrid-header" ItemStyle-CssClass="dg-name datagrid-longitem" DataField="Name" HeaderText="Name" SortExpression="Name" />
                                    <asp:BoundField HeaderStyle-CssClass="dg-addr datagrid-longitem datagrid-header" ItemStyle-CssClass="dg-addr datagrid-longitem" DataField="Address" HeaderText="Address" SortExpression="Address" />
                                    <asp:BoundField HeaderStyle-CssClass="dg-cname datagrid-numberitem datagrid-header" ItemStyle-CssClass="dg-cname datagrid-numberitem" DataField="Contact Name" HeaderText="Contact Name" SortExpression="Contact Name" />
                                    <asp:BoundField HeaderStyle-CssClass="dg-cnum datagrid-numberitem datagrid-header" ItemStyle-CssClass="dg-cnum datagrid-numberitem" DataField="Contact Number" HeaderText="Contact Number" SortExpression="Contact Number" />
                                    <asp:BoundField HeaderStyle-CssClass="dg-oo datagrid-numberitem datagrid-header" ItemStyle-CssClass="dg-oo datagrid-numberitem" DataField="Orders Open" HeaderText="Orders Open" SortExpression="Orders Open" />
                                    <asp:BoundField HeaderStyle-CssClass="dg-os datagrid-numberitem datagrid-header" ItemStyle-CssClass="dg-os datagrid-numberitem" DataField="Orders Scheduled" HeaderText="Orders Scheduled" SortExpression="Orders Scheduled" />
                                    <asp:BoundField HeaderStyle-CssClass="dg-op datagrid-numberitem datagrid-header" ItemStyle-CssClass="dg-op datagrid-numberitem" DataField="Orders In Progress" HeaderText="Orders In Progress" SortExpression="Orders In Progress" />
                                    <asp:BoundField HeaderStyle-CssClass="dg-oc datagrid-numberitem datagrid-header" ItemStyle-CssClass="dg-oc datagrid-numberitem" DataField="Orders Complete" HeaderText="Orders Complete" SortExpression="Orders Complete" />
                                </Columns>
                                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                <SortedDescendingHeaderStyle BackColor="#242121" />
                            </ctrl:ExGridView>
                            
                            <asp:SqlDataSource ID="MySqlCustomerData" runat="server" 
                                ConnectionString="server=localhost;user id=remotecustomer;persistsecurityinfo=True;database=customer;password=remotecustomer" 
                                ProviderName="MySql.Data.MySqlClient" SelectCommand="CALL get_data_at_id_name_addr_with_aliases('');" InsertCommandType="StoredProcedure" InsertCommand="add_data">
                                <InsertParameters>
                                    <asp:ControlParameter ControlID="cuIdTextBox" Name="cuId" PropertyName="Text" Type="String" />
                                    <asp:ControlParameter ControlID="cuNameTextBox" Name="cuName" PropertyName="Text" Type="String" />
                                    <asp:ControlParameter ControlID="cuAddrTextBox" Name="cuAddr" PropertyName="Text" Type="String" />
                                    <asp:ControlParameter ControlID="coNameTextBox" Name="coName" PropertyName="Text" Type="String" />
                                    <asp:ControlParameter ControlID="cuNumTextBox" Name="cuNum" PropertyName="Text" Type="String" />
                                    <asp:ControlParameter ControlID="orOpenTextBox" Name="orOpen" PropertyName="Text" Type="Int32" />
                                    <asp:ControlParameter ControlID="orSchedTextBox" Name="orSched" PropertyName="Text" Type="Int32" />
                                    <asp:ControlParameter ControlID="orProgTextBox" Name="orProg" PropertyName="Text" Type="Int32" />
                                    <asp:ControlParameter ControlID="orCompTextBox" Name="orComp" PropertyName="Text" Type="Int32" />
                                </InsertParameters>
                            </asp:SqlDataSource>
                    
                        </div>

                    </div>

                    <div class="addData-container"><h1>Add/Modify Entry</h1><hr />
                        <div id="cuId"><asp:Label CssClass="l" runat="server" Text="Customer ID"></asp:Label><br /><asp:TextBox ID="cuIdTextBox" CssClass="t" runat="server"></asp:TextBox></div>
                        <div id="cuName"><asp:Label CssClass="l" runat="server" Text="Customer Name"></asp:Label><br /><asp:TextBox ID="cuNameTextBox" CssClass="t" runat="server"></asp:TextBox></div>
                        <div id="cuAddr"><asp:Label CssClass="l" runat="server" Text="Customer Address"></asp:Label><br /><asp:TextBox ID="cuAddrTextBox" CssClass="t" runat="server"></asp:TextBox></div>
                        <div id="coName"><asp:Label CssClass="l" runat="server" Text="Contact Name"></asp:Label><br /><asp:TextBox ID="coNameTextBox" CssClass="t" runat="server"></asp:TextBox></div>
                        <div id="cuNum"><asp:Label CssClass="l" runat="server" Text="Contact Number"></asp:Label><br /><asp:TextBox ID="cuNumTextBox" CssClass="t" runat="server"></asp:TextBox></div>
                        <div id="orOpen"><asp:Label CssClass="l" runat="server" Text="Orders Open"></asp:Label><br /><asp:TextBox ID="orOpenTextBox" CssClass="t" runat="server"></asp:TextBox></div>
                        <div id="orSched"><asp:Label CssClass="l" runat="server" Text="Orders Scheduled"></asp:Label><br /><asp:TextBox ID="orSchedTextBox" CssClass="t" runat="server"></asp:TextBox></div>
                        <div id="orProg"><asp:Label CssClass="l" runat="server" Text="Orders In Progress"></asp:Label><br /><asp:TextBox ID="orProgTextBox" CssClass="t" runat="server"></asp:TextBox></div>
                        <div id="orComp"><asp:Label CssClass="l" runat="server" Text="Orders Complete"></asp:Label><br /><asp:TextBox ID="orCompTextBox" CssClass="t" runat="server"></asp:TextBox></div>

                        <div id="commit"><asp:Label CssClass="l" runat="server"></asp:Label><asp:Button ID="commitButton" CssClass="b button-anim" runat="server" Text="Commit" OnClick="commitButton_Click" /></div>
                    </div>

                </div>

            </ContentTemplate>
        </asp:UpdatePanel>

    </div>
</asp:Content>
