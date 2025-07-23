<%@ Page Title="Customer" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="CustomerPage.aspx.vb" Inherits="VBWebFormApplication.CustomerPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-12">
            <h2>Customer</h2>
            <asp:Literal ID="ltMessage" runat="server" />
            <asp:Button ID="btnCustomer" Text="Get Data Customer" runat="server" CssClass="btn btn-primary"
                OnClick="btnCustomer_Click" /><br />
            <asp:GridView ID="gvCustomer" AutoGenerateColumns="false" runat="server" CssClass="table table-striped">
                <Columns>
                    <asp:BoundField DataField="CustomerID" HeaderText="Customer ID" />
                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:BoundField DataField="CardID" HeaderText="CardID" />
                    <asp:BoundField DataField="Address" HeaderText="Address" />
                    <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
