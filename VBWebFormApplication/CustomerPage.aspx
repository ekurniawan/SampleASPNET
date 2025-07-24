<%@ Page Title="Customer" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="CustomerPage.aspx.vb" Inherits="VBWebFormApplication.CustomerPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <h2>Customer</h2>
        <br />
        <asp:Literal ID="ltMessage" ViewStateMode="Disabled" runat="server" />
        <div class="col-md-4">
            <div class="mb-3 mt-3">
                <label for="CustomerID" class="form-label">Customer ID :</label>
                <asp:TextBox ID="txtCustomerID" ReadOnly="true" runat="server" CssClass="form-control" />
            </div>
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
            <asp:Button ID="btnNew" runat="server" Text="New" CssClass="btn btn-primary btn-sm" OnClick="btnNew_Click" />
            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-warning btn-sm" OnClick="btnSave_Click" />
            <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-danger btn-sm" />
            <br />

        </div>
        <div class="col-md-8">
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
                            DataNavigateUrlFormatString="CustomerPage.aspx?CustomerID={0}"
                            Text="edit" ControlStyle-CssClass="btn btn-sm btn-warning" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
