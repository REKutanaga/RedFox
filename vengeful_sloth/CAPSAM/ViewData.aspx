<%@ Page Title="ViewData" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewData.aspx.cs" Inherits="CAPSAM.ViewData" EnableViewState="true" EnableEventValidation="false" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <script type = "text/javascript"> 
        var ref = null, rowID = -1;

        function pageLoad() {

        }

        function MouseEvents(objRef, evt)
        {
            var True = true; False = false, ref = objRef;
   
            if(ref.rowIndex != rowID) 
            {
                if(evt.type == "mouseout")
                {
                    if(ref.rowIndex % 2 == 1)
                    {
                        //Alternating Row Color
                        ref.style.backgroundColor = <%=hexColAlt%>;
                    }
                    else
                    {
                        ref.style.backgroundColor = <%=hexColMain%>;
                    }
                }
                else if(evt.type == "mouseover")
                {
                    ref.style.backgroundColor = "orange";
                }
            }
            else
            {
                ref.style.backgroundColor = <%=hexColSel%>;
            }
        }
    </script>

    <asp:UpdatePanel ID="ModeSwitchUpdatePanel" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div>
                <div>
                    <b><button visible="false" id="ViewDataLink" runat="server" class="switch-btn b" onserverclick="ViewDataButton_Click">View Data</button></b>
                    <b><button visible="false" id="ModDataLink" runat="server" class="switch-btn b" onserverclick="ModDataButton_Click">Add/Modify Data</button></b>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <div class="body-container">

        <asp:UpdatePanel ID="ViewDataUpdatePanel" runat="server" UpdateMode="Conditional">
            <ContentTemplate>

                <div class="data-container">

                    <div id="viewDataContainer" class="" style="display:block;" runat="server">

                        <asp:Button ID="addNewBtn" CssClass="b button-anim" runat="server" Text="New Customer" OnClick="NewCustomer_Click" />
                        <asp:Button ID="delBtn" CssClass="b button-anim" runat="server" Text="Delete Customer" OnClick="DeleteCustomer_Click" />

                        <div class="search-container">
                                <asp:Label ID="DataSearchLabel" CssClass="l" runat="server" Text=""></asp:Label>
                                <asp:TextBox ID="DataSearchText" CssClass="t" runat="server" Text=""></asp:TextBox>
                                <asp:Button ID="DataSearchButton" CssClass="b button-anim" runat="server" Text="Search" OnClick="DataSearchButton_Click" />
                            </div>

                        <div id="viewDataGrid">

                            <div class="grid-border">

                                <ctrl:ExGridView ID="DataGridView" runat="server" DataSourceID="MySqlCustomerData" AutoGenerateColumns="False" 
                                    OnRowDataBound="OnRowDataBound" OnSelectedIndexChanged="OnSelectedIndexChanged" 
                                    BackColor="White" BorderColor="#111111" BorderStyle="Solid" AlternatingRowStyle-BackColor="#D5D5D5" 
                                    BorderWidth="0px" CellPadding="4" DataKeyNames="customer_id" GridHeight="625px"
                                    ForeColor="Black" AllowSorting="True">
                                    <Columns>
                                        <asp:BoundField HeaderStyle-CssClass="dg-id datagrid-numberitem datagrid-header" ItemStyle-CssClass="dg-id datagrid-numberitem" DataField="customer_id" HeaderText="ID" SortExpression="customer_id" ReadOnly="True" />
                                        <asp:BoundField HeaderStyle-CssClass="dg-name datagrid-longitem datagrid-header" ItemStyle-CssClass="dg-name datagrid-longitem" DataField="customer_name" HeaderText="Customer" SortExpression="customer_name" />
                                        <asp:BoundField HeaderStyle-CssClass="dg-addr datagrid-longitem datagrid-header" ItemStyle-CssClass="dg-addr datagrid-longitem" DataField="customer_address" HeaderText="Address" SortExpression="customer_address" />
                                        <asp:BoundField HeaderStyle-CssClass="dg-city datagrid-longitem datagrid-header" ItemStyle-CssClass="dg-city datagrid-longitem" DataField="customer_city" HeaderText="City" SortExpression="customer_city" />
                                        <asp:BoundField HeaderStyle-CssClass="dg-state datagrid-numberitem datagrid-header" ItemStyle-CssClass="dg-state datagrid-numberitem" DataField="customer_state" HeaderText="State" SortExpression="customer_state" />
                                        <asp:BoundField HeaderStyle-CssClass="dg-zip datagrid-numberitem datagrid-header" ItemStyle-CssClass="dg-zip datagrid-numberitem" DataField="customer_zip" HeaderText="ZIP Code" SortExpression="customer_zip" />
                                        <asp:BoundField HeaderStyle-CssClass="dg-clim datagrid-numberitem datagrid-header" ItemStyle-CssClass="dg-clim datagrid-numberitem" DataField="customer_credit_limit" HeaderText="Credit" SortExpression="customer_credit_limit" />
                                        <asp:BoundField HeaderStyle-CssClass="dg-term datagrid-longitem datagrid-header" ItemStyle-CssClass="dg-term datagrid-longitem" DataField="customer_terms" HeaderText="Terms" SortExpression="customer_terms" />
                                        
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
                                
                                <asp:HiddenField Visible="false" ID="hdID" runat="server" />
                                <asp:Button Visible="false" ID="hdBtn" runat="server" />
                                <asp:LinkButton Visible="false" ID="linkDummy" runat="server"></asp:LinkButton>
             
                                <asp:SqlDataSource ID="MySqlCustomerData" runat="server" 
                                    ConnectionString="server=localhost;user id=remotecustomer;persistsecurityinfo=True;database=capsamtst;password=remotecustomer" 
                                    ProviderName="MySql.Data.MySqlClient" SelectCommand="CALL match_customer_info('');" InsertCommand="CALL new_customer_row">
                                </asp:SqlDataSource>
                    
                            </div>


                        </div>

                    </div>

                    <div id="addDataContainer" class="" style="display:normal;" runat="server">

                        <div class="addData-container"><h1>Add/Modify Entry</h1><hr />
                            <div id="did"><asp:Label CssClass="l" runat="server" Text="ID = "></asp:Label><asp:Label ID="idLabel" CssClass="l" runat="server" Text="Null"></asp:Label></div><br />
                            <div id="dname"><asp:Label CssClass="l" runat="server" Text="Name"></asp:Label><br /><asp:TextBox ID="nameTextBox" CssClass="t" runat="server"></asp:TextBox></div><br />
                            <div id="daddress"><asp:Label CssClass="l" runat="server" Text="Address"></asp:Label><br /><asp:TextBox ID="addressTextBox" CssClass="t" runat="server"></asp:TextBox></div><br />
                            <div id="dcity"><asp:Label CssClass="l" runat="server" Text="City"></asp:Label><br /><asp:TextBox ID="cityTextBox" CssClass="t" runat="server"></asp:TextBox></div><br />
                            <div id="dstate"><asp:Label CssClass="l" runat="server" Text="State"></asp:Label><br /><asp:TextBox ID="stateTextBox" CssClass="t" runat="server"></asp:TextBox></div><br />
                            <div id="dzipcode"><asp:Label CssClass="l" runat="server" Text="ZIP Code"></asp:Label><br /><asp:TextBox ID="zipcodeTextBox" CssClass="t" runat="server"></asp:TextBox></div><br />
                            <div id="dcredit"><asp:Label CssClass="l" runat="server" Text="Credit Limit"></asp:Label><br /><asp:TextBox ID="creditTextBox" CssClass="t" runat="server"></asp:TextBox></div><br />
                            <div id="dterms"><asp:Label CssClass="l" runat="server" Text="Terms"></asp:Label><br /><asp:TextBox ID="termsTextBox" CssClass="t" runat="server"></asp:TextBox></div>

                            <div id="reset"><asp:Label CssClass="l" runat="server"></asp:Label><asp:Button ID="resetButton" CssClass="b button-anim" runat="server" Text="Reset" OnClick="resetButton_Click" /></div>
                            <div id="commit"><asp:Label CssClass="l" runat="server"></asp:Label><asp:Button ID="commitButton" CssClass="b button-anim" runat="server" Text="Commit" OnClick="commitButton_Click" /></div>
                        </div>

                    </div>

                </div>

            </ContentTemplate>

           <Triggers>
                <asp:AsyncPostBackTrigger ControlID="ViewDataLink" />
                <asp:AsyncPostBackTrigger ControlID="ModDataLink" />
            </Triggers>

        </asp:UpdatePanel>

        <script>
            function divfade(id,speed, fd) {

                if(fd) $("#" + id).fadeIn(speed);

                else $("#" + id).fadeOut(speed);

            }
        </script>

    </div>
</asp:Content>
