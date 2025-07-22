<%@ Page Title="Cars" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" 
    CodeBehind="CarPage.aspx.vb" Inherits="VBWebFormApplication.CarPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-12">
            <h2>List Of Cars</h2>

            <asp:SqlDataSource ID="sdsCar" runat="server" 
                ConnectionString="<%$ ConnectionStrings:AutomotiveDBConnectionString %>"
                SelectCommand="SELECT Car.CarID, Car.Model, Car.Type, Car.BasePrice, Car.Color, Car.Stock, DealerCar.DealerID, DealerCar.Price, DealerCar.Stock AS StockDealer, DealerCar.DiscountPercent, DealerCar.FeePercent FROM Car INNER JOIN DealerCar ON Car.CarID = DealerCar.CarID
where DealerCar.DealerID=@DealerID">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddDealer" Name="DealerID" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource ID="sdsDealer" runat="server" 
                ConnectionString="<%$ ConnectionStrings:AutomotiveDBConnectionString %>" 
                SelectCommand="SELECT [DealerID], [Name], [Address], [PhoneNumber], [Email], [Status] FROM [Dealer] ORDER BY [Name]"></asp:SqlDataSource>

            <asp:DropDownList ID="ddDealer" runat="server" AutoPostBack="true"
                DataSourceID="sdsDealer" DataTextField="Name" DataValueField="DealerID"></asp:DropDownList>

            <asp:GridView ID="gvCar" runat="server" CssClass="table table-striped"
                AutoGenerateColumns="False" DataSourceID="sdsCar" 
                AllowSorting="True" AllowPaging="True" PageSize="3" DataKeyNames="CarID">
                <Columns>
                    <asp:BoundField DataField="CarID" HeaderText="CarID" SortExpression="CarID" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
                    <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                    <asp:BoundField DataField="BasePrice" HeaderText="BasePrice" SortExpression="BasePrice" DataFormatString="{0:N0}" >
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Color" HeaderText="Color" SortExpression="Color" />
                    <asp:BoundField DataField="Stock" HeaderText="Stock" SortExpression="Stock" >
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Price" HeaderText="Price Dealer" DataFormatString="{0:N0}" SortExpression="Price" />
                    <asp:BoundField DataField="StockDealer" HeaderText="Stock Dealer" SortExpression="StockDealer" >
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="DiscountPercent" HeaderText="DiscountPercent" SortExpression="DiscountPercent">
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="FeePercent" HeaderText="FeePercent" SortExpression="FeePercent">
                    <ItemStyle HorizontalAlign="Right" />
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
