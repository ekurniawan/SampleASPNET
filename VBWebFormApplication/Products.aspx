﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Products.aspx.vb" Inherits="VBWebFormApplication.Products" %>

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
            <label>Gender :</label><br />
            <asp:RadioButtonList ID="rblGender" runat="server">
                <asp:ListItem Selected="True">Male</asp:ListItem>
                <asp:ListItem>Female</asp:ListItem>
            </asp:RadioButtonList>
            <label>Country :</label><br />

            <asp:DropDownList ID="ddlCountry" runat="server">
                <asp:ListItem>India</asp:ListItem>
                <asp:ListItem>Japan</asp:ListItem>
                <asp:ListItem>UK</asp:ListItem>
                <asp:ListItem>Indonesia</asp:ListItem>
            </asp:DropDownList><br />


            <asp:Button ID="btnSubmit" runat="server" Text="Submit"
                CssClass="btn btn-sm btn-success" OnClick="btnSubmit_Click" />
            <hr />
            <asp:Label ID="lblCount" Text="0" runat="server" />
            <asp:Button ID="btnIncrement" Text="Increment" CssClass="btn btn-success btn-sm" runat="server" />
            <hr />
            <label>Search :</label>
            <asp:TextBox ID="txtSearch" runat="server" /><br />
            <asp:Button ID="btnCross" Text="Cross Page" PostBackUrl="SearchPage.aspx" runat="server" />
        </div>

    </div>
</asp:Content>
