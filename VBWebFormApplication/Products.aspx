<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Products.aspx.vb" Inherits="VBWebFormApplication.Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <section class="row" aria-labelledby="aspnetTitle">
            <h1 id="aspnetTitle">Products</h1>
            <p class="lead">List of products</p>
        </section>
    </main>
    <div class="row">

        <div class="col-md-6">
            <p>
                <asp:Label ID="lblBio" runat="server" />
            </p>
            <label>FirstName :</label><br />
            <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox><br />
            <label>LastName :</label><br />
            <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox><br />

            <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                CssClass="btn btn-sm btn-success" OnClick="btnSubmit_Click" />
        </div>

    </div>
</asp:Content>
