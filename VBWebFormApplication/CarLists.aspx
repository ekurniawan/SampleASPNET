<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="CarLists.aspx.vb" Inherits="VBWebFormApplication.CarLists" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-12">
            <h2>List Of Cars</h2>

            <asp:GridView ID="gvCar" AutoGenerateColumns="false" runat="server" CssClass="table table-striped">
                <Columns>
                    <asp:BoundField DataField="CarID" HeaderText="Car ID" />
                    <asp:BoundField DataField="Model" HeaderText="Model" />
                    <asp:BoundField DataField="Type" HeaderText="Type" />
                    <asp:BoundField DataField="BasePrice" HeaderText="BasePrice" DataFormatString="{0:N0}" HtmlEncode="False" />
                    <asp:BoundField DataField="Color" HeaderText="Color" />
                    <asp:BoundField DataField="Stock" HeaderText="Stock" />
                </Columns>
            </asp:GridView>
        </div>

    </div>
</asp:Content>
