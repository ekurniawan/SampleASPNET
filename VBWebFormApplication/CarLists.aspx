<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="CarLists.aspx.vb" Inherits="VBWebFormApplication.CarLists" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-12">
            <h2>List Of Cars</h2>

            <asp:GridView ID="gvCar" runat="server"></asp:GridView>
        </div>

    </div>
</asp:Content>
