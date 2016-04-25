<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CAPSAM._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

        <div class="jumbotron-head">
            <div>
                <h1>ASP.NET</h1>
            </div>
        </div>
        
        <div class="body-container" style="margin-left:15px; margin-right:15px;">

            <div class="jumbotron" style="width:450px;">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <fieldset>
                            <div class="col-md-4">
                                <asp:button CssClass="btn btn-norm btn-lg" runat="server" onclick="btnPanel_Click" Text="Click &raquo;"></asp:button>
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="Label1" runat="server"></asp:Label>
                            </div>
                        </fieldset>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

            <hr />

            <div class="row" style="width:99%;">
                <div class="col-md-4">
                    <h2>Getting started</h2>
                    <p>
                        ASP.NET Web Forms lets you build dynamic websites using a familiar drag-and-drop, event-driven model.
                    A design surface and hundreds of controls and components let you rapidly build sophisticated, powerful UI-driven sites with data access.
                    </p>
                    <p>
                        <a class="btn btn-norm" href="http://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
                    </p>
                </div>
                <div class="col-md-4">
                    <h2>Get more libraries</h2>
                    <p>
                        NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
                    </p>
                    <p>
                        <a class="btn btn-norm" href="http://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
                    </p>
                </div>
                <div class="col-md-4">
                    <h2>Web Hosting</h2>
                    <p>
                        You can easily find a web hosting company that offers the right mix of features and price for your applications.
                    </p>
                    <p>
                        <a class="btn btn-norm" href="http://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
                    </p>
                </div>
            </div>

        </div>
</asp:Content>
