<%@ Page Title="Customer" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="CustomerPage.aspx.vb" Inherits="VBWebFormApplication.CustomerPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-12">
            <h2>Customer</h2>
            <br />
            <asp:Literal ID="ltMessage" ViewStateMode="Disabled" runat="server" />
            <br />

           <%-- <div class="mb-3 mt-3">
                <label for="CustomerID" class="form-label">Customer ID :</label>
                <asp:TextBox ID="txtCustomerID" runat="server" CssClass="form-control" />
            </div>--%>
            <div class="mb-3 mt-3">
                <label for="Name" class="form-label">Name :</label>
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-3 mt-3">
                <label for="CardID" class="form-label">Card ID :</label>
                <asp:TextBox ID="txtCardID" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-3 mt-3">
                <label for="Address" class="form-label">Address :</label>
                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-3 mt-3">
                <label for="PhoneNumber" class="form-label">Phone Number :</label>
                <asp:TextBox ID="txtPhoneNumber" runat="server" TextMode="Phone" CssClass="form-control" />
            </div>
            <div class="mb-3 mt-3">
                <label for="Email" class="form-label">Email :</label>
                <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control" />
            </div>
            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary btn-sm" OnClick="btnSave_Click" />
            <hr />
            <div class="row">
                <div class="col">
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" />
                </div>
                <div class="col">
                    <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary btn-sm" OnClick="btnSearch_Click" />
                </div>
                <asp:GridView ID="gvCustomer" AutoGenerateColumns="False" runat="server"
                    CssClass="table table-striped">
                    <Columns>
                        <asp:BoundField DataField="CustomerID" HeaderText="Customer ID" />
                        <asp:BoundField DataField="Name" HeaderText="Name" />
                        <asp:BoundField DataField="CardID" HeaderText="CardID" />
                        <asp:BoundField DataField="Address" HeaderText="Address" />
                        <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" />
                        <asp:BoundField DataField="Email" HeaderText="Email" />
                        <asp:HyperLinkField DataNavigateUrlFields="CustomerID"
                            DataNavigateUrlFormatString="CustomerEdit.aspx?CustomerID={0}"
                            Text="edit" ControlStyle-CssClass="btn btn-sm btn-warning" />
                    </Columns>
                </asp:GridView>
            </div>

            <br />

        </div>
    </div>
</asp:Content>
