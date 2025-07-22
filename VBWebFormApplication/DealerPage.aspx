<%@ Page Title="Dealer Page" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="DealerPage.aspx.vb" Inherits="VBWebFormApplication.DealerPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-12">
            <h2>Add Dealer</h2>
            <asp:SqlDataSource ID="sdsDealer" runat="server"
                ConnectionString="<%$ ConnectionStrings:AutomotiveDBConnectionString %>"
                DeleteCommand="DELETE FROM [Dealer] WHERE [DealerID] = @DealerID"
                InsertCommand="INSERT INTO [Dealer] ([Name], [Address], [PhoneNumber], [Email], [Status]) VALUES (@Name, @Address, @PhoneNumber, @Email, @Status)"
                SelectCommand="SELECT [DealerID], [Name], [Address], [PhoneNumber], [Email], [Status] FROM [Dealer]"
                UpdateCommand="UPDATE [Dealer] SET [Name] = @Name, [Address] = @Address, [PhoneNumber] = @PhoneNumber, [Email] = @Email, [Status] = @Status WHERE [DealerID] = @DealerID">
                <DeleteParameters>
                    <asp:Parameter Name="DealerID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="PhoneNumber" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="Status" Type="Boolean" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="PhoneNumber" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="Status" Type="Boolean" />
                    <asp:Parameter Name="DealerID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <asp:FormView ID="fvDealer" runat="server" DataKeyNames="DealerID" CssClass="form-view"
                DataSourceID="sdsDealer" DefaultMode="Insert">
                <InsertItemTemplate>

                    <div class="mb-3 mt-3">
                        <label for="Name" class="form-label">Name:</label>
                        <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' CssClass="form-control" />
                    </div>
                    <div class="mb-3 mt-3">
                        <label for="Address" class="form-label">Address:</label>
                        <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' CssClass="form-control" />
                    </div>
                    <div class="mb-3 mt-3">
                        <label for="PhoneNumber" class="form-label">Phone Number:</label>
                        <asp:TextBox ID="PhoneNumberTextBox" runat="server" Text='<%# Bind("PhoneNumber") %>' CssClass="form-control" />
                    </div>
                    <div class="mb-3 mt-3">
                        <label for="Email" class="form-label">Email:</label>
                         <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' CssClass="form-control" />
                    </div>
                    <div class="form-check mb-3">
                        <label class="form-check-label">
                             <asp:CheckBox ID="StatusCheckBox" runat="server" Checked='<%# Bind("Status") %>' CssClass="form-check-input" />Status
                        </label>
                    </div>
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-primary btn-sm" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-primary btn-sm" />
                </InsertItemTemplate>
            </asp:FormView><br />

            <asp:GridView ID="gvDealer" runat="server" 
                AutoGenerateColumns="False" DataKeyNames="DealerID" DataSourceID="sdsDealer" CssClass="table table-striped">
                <Columns>
                    <asp:BoundField DataField="DealerID" HeaderText="DealerID" InsertVisible="False" ReadOnly="True" SortExpression="DealerID" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" SortExpression="PhoneNumber" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:CheckBoxField DataField="Status" HeaderText="Status" SortExpression="Status" />
                </Columns>
            </asp:GridView>
        </div>
    </div>

</asp:Content>
