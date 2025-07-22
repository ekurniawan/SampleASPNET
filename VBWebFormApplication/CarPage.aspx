<%@ Page Title="Cars" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" 
    CodeBehind="CarPage.aspx.vb" Inherits="VBWebFormApplication.CarPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-6">
            <h2>List Of Cars</h2>
            <asp:SqlDataSource ID="sdsCar" runat="server" 
                ConnectionString="<%$ ConnectionStrings:AutomotiveDBConnectionString %>" 
                ProviderName="<%$ ConnectionStrings:AutomotiveDBConnectionString.ProviderName %>" 
                SelectCommand="SELECT [CarID], [Model], [Type], [BasePrice], [Color], [Stock] FROM [Car]">
            </asp:SqlDataSource>

            <asp:GridView ID="gvCar" runat="server" CssClass="table table-striped"
                AutoGenerateColumns="False" DataKeyNames="CarID" DataSourceID="sdsCar">
                <Columns>
                    <asp:BoundField DataField="CarID" HeaderText="CarID" InsertVisible="False" ReadOnly="True" SortExpression="CarID" />
                    <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
                    <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                    <asp:BoundField DataField="BasePrice" HeaderText="BasePrice" SortExpression="BasePrice" />
                    <asp:BoundField DataField="Color" HeaderText="Color" SortExpression="Color" />
                    <asp:BoundField DataField="Stock" HeaderText="Stock" SortExpression="Stock" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
