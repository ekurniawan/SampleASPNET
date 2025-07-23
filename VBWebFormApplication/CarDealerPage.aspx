<%@ Page Title="Register Dealer and Car" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="CarDealerPage.aspx.vb" Inherits="VBWebFormApplication.CarDealerPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-12">


            <div>
                <asp:SqlDataSource ID="sdsCar" runat="server" ConnectionString="<%$ ConnectionStrings:AutomotiveDBConnectionString %>" SelectCommand="SELECT [CarID], [Model] FROM [Car] ORDER BY [Model]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="sdsDealer" runat="server" ConnectionString="<%$ ConnectionStrings:AutomotiveDBConnectionString %>" SelectCommand="GetDealerDropDown" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <asp:SqlDataSource ID="sdsCarDealer" runat="server" ConnectionString="<%$ ConnectionStrings:AutomotiveDBConnectionString %>"
                    DeleteCommand="DELETE FROM [DealerCar] WHERE [DealerCarID] = @DealerCarID"
                    InsertCommand="INSERT INTO [DealerCar] ([CarID], [DealerID], [Price], [Stock], [DiscountPercent], [FeePercent]) VALUES (@CarID, @DealerID, @Price, @Stock, @DiscountPercent, @FeePercent)"
                    SelectCommand="SELECT [DealerCarID], [CarID], [DealerID], [Price], [Stock], [DiscountPercent], [FeePercent] FROM [DealerCar]"
                    UpdateCommand="UPDATE [DealerCar] SET [CarID] = @CarID, [DealerID] = @DealerID, [Price] = @Price, [Stock] = @Stock, [DiscountPercent] = @DiscountPercent, [FeePercent] = @FeePercent WHERE [DealerCarID] = @DealerCarID">
                    <DeleteParameters>
                        <asp:Parameter Name="DealerCarID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="CarID" Type="Int32" />
                        <asp:Parameter Name="DealerID" Type="Int32" />
                        <asp:Parameter Name="Price" Type="Double" />
                        <asp:Parameter Name="Stock" Type="Int32" />
                        <asp:Parameter Name="DiscountPercent" Type="Double" />
                        <asp:Parameter Name="FeePercent" Type="Double" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="CarID" Type="Int32" />
                        <asp:Parameter Name="DealerID" Type="Int32" />
                        <asp:Parameter Name="Price" Type="Double" />
                        <asp:Parameter Name="Stock" Type="Int32" />
                        <asp:Parameter Name="DiscountPercent" Type="Double" />
                        <asp:Parameter Name="FeePercent" Type="Double" />
                        <asp:Parameter Name="DealerCarID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>

                <asp:Literal ID="ltMessage" runat="server" /><br />

                <h2>Register Dealer and Car</h2>

                <div class="mb-3 mt-3">
                    <label for="Car" class="form-label">Car :</label>
                    <asp:DropDownList ID="ddCar" runat="server" CssClass="form-select" DataSourceID="sdsCar"
                        DataTextField="Model" DataValueField="CarID" AppendDataBoundItems="True">
                        <asp:ListItem Text="- Select Car -" Value="" />
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator
                        ID="rfvCar" runat="server"  ValidationGroup="add" ControlToValidate="ddCar" ErrorMessage="Car is required." CssClass="text-danger" />
                </div>
                <div class="mb-3 mt-3">
                    <label for="Dealer" class="form-label">Dealer :</label>
                    <asp:DropDownList ID="ddDealer" runat="server" CssClass="form-select" DataSourceID="sdsDealer"
                        DataTextField="Name" DataValueField="DealerID" AppendDataBoundItems="True">
                        <asp:ListItem Text="- Select Dealer -" Value="" />
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator
                        ID="rfvDealer" runat="server"  ValidationGroup="add" ControlToValidate="ddDealer" ErrorMessage="Dealer is required." CssClass="text-danger" />
                </div>
                <div class="mb-3 mt-3">
                    <label for="Price" class="form-label">Dealer Price :</label>
                    <asp:TextBox ID="txtPrice" TextMode="Number" runat="server" Text="0" CssClass="form-control" />
                    <asp:RequiredFieldValidator  ValidationGroup="add" ID="rfvPrice" runat="server" ControlToValidate="txtPrice" ErrorMessage="Price is required." CssClass="text-danger" />
                </div>
                <div class="mb-3 mt-3">
                    <label for="Stock" class="form-label">Dealer Stock :</label>
                    <asp:TextBox ID="txtStock" TextMode="Number" runat="server" Text="0" CssClass="form-control" />
                    <asp:RequiredFieldValidator  ValidationGroup="add" ID="rfvStock" runat="server" ControlToValidate="txtStock" ErrorMessage="Stock is required." CssClass="text-danger" />
                </div>
                <div class="mb-3 mt-3">
                    <label for="Discount" class="form-label">Discount :</label>
                    <asp:TextBox ID="txtDiscount" TextMode="Number" Text="0" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator  ValidationGroup="add" ID="rfvDiscount" runat="server" ControlToValidate="txtDiscount" ErrorMessage="Discount is required." CssClass="text-danger" />
                </div>
                <div class="mb-3 mt-3">
                    <label for="Percent" class="form-label">Fee Percent :</label>
                    <asp:TextBox ID="txtFeePercent" TextMode="Number" runat="server" Text="0" CssClass="form-control" />
                    <asp:RequiredFieldValidator  ValidationGroup="add" ID="rfvFeePercent" runat="server" ControlToValidate="txtFeePercent" ErrorMessage="Fee Percent is required." CssClass="text-danger" />
                </div>
                <asp:Button ID="btnRegister" ValidationGroup="add" runat="server" Text="Register" CssClass="btn btn-primary" OnClick="btnRegister_Click" />
            </div>

        </div>
    </div>
</asp:Content>
