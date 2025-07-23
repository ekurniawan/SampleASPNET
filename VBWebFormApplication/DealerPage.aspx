<%@ Page Title="Dealer Page" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="DealerPage.aspx.vb" Inherits="VBWebFormApplication.DealerPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-12">
            <h2>Dealer Mitsu</h2>
            <asp:SqlDataSource ID="sdsDealer" runat="server"
                ConnectionString="<%$ ConnectionStrings:AutomotiveDBConnectionString %>"
                DeleteCommand="DeleteDealer"
                InsertCommand="InsertDealer"
                SelectCommand="GetDealers"
                UpdateCommand="UpdateDealer"
                DeleteCommandType="StoredProcedure"
                InsertCommandType="StoredProcedure"
                SelectCommandType="StoredProcedure"
                UpdateCommandType="StoredProcedure"
                OnSelected="sdsDealer_Selected"
                OnSelecting="sdsDealer_Selecting"
                OnInserting="sdsDealer_Inserting"
                OnInserted="sdsDealer_Inserted"
                OnUpdated="sdsDealer_Updated"
                OnUpdating="sdsDealer_Updating"
                OnDeleted="sdsDealer_Deleted">
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
                    <asp:Parameter Name="DealerID" Type="Int32" />
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="PhoneNumber" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="Status" Type="Boolean" />
                </UpdateParameters>
            </asp:SqlDataSource>


            <asp:Literal ID="ltMessage" runat="server" />


            <asp:ValidationSummary ValidationGroup="insert_dealer" ID="vsDealer" runat="server" CssClass="alert alert-danger" 
                HeaderText="Please correct the following errors:" />

            <asp:FormView ID="fvDealer" runat="server" DataKeyNames="DealerID" CssClass="form-view"
                DataSourceID="sdsDealer" DefaultMode="Insert">
                <InsertItemTemplate>
                    <div class="mb-3 mt-3">
                        <label for="Name" class="form-label">Name:</label>
                        <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' CssClass="form-control" />
                        <asp:RequiredFieldValidator ValidationGroup="insert_dealer" ID="rfvName" runat="server" ErrorMessage="Name required" ControlToValidate="NameTextBox" ForeColor="Red" />
                    </div>
                    <div class="mb-3 mt-3">
                        <label for="Address" class="form-label">Address:</label>
                        <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' CssClass="form-control" />
                        <asp:requiredFieldValidator ValidationGroup="insert_dealer" ID="rfvAddress" runat="server" ErrorMessage="Address required" ControlToValidate="AddressTextBox" ForeColor="Red" />
                    </div>
                    <div class="mb-3 mt-3">
                        <label for="PhoneNumber" class="form-label">Phone Number:</label>
                        <asp:TextBox ID="PhoneNumberTextBox" runat="server" Text='<%# Bind("PhoneNumber") %>' CssClass="form-control" />
                        <asp:RequiredFieldValidator ValidationGroup="insert_dealer"  ID="rfvPhoneNumber" runat="server" ErrorMessage="Phone Number required" ControlToValidate="PhoneNumberTextBox" ForeColor="Red" />
                    </div>
                    <div class="mb-3 mt-3">
                        <label for="Email" class="form-label">Email:</label>
                        <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' CssClass="form-control" />
                        <asp:RequiredFieldValidator ValidationGroup="insert_dealer" ID="rfvEmail" runat="server" ErrorMessage="Email required" ControlToValidate="EmailTextBox" ForeColor="Red" />
                        <asp:RegularExpressionValidator ValidationGroup="insert_dealer" ID="revEmail" runat="server" ErrorMessage="Invalid email format" ControlToValidate="EmailTextBox" ForeColor="Red"
                            ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                    </div>
                    <div class="form-check mb-3">
                        <label class="form-check-label">
                            <asp:CheckBox ID="StatusCheckBox" runat="server" Checked='<%# Bind("Status") %>' CssClass="form-check-input" />Status
                        </label>
                    </div>
                    <asp:LinkButton ID="InsertButton" ValidationGroup="insert_dealer" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-primary btn-sm" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" ValidationGroup="insert_dealer" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-primary btn-sm" />
                </InsertItemTemplate>
            </asp:FormView>
            <br />

            <asp:GridView ID="gvDealer" runat="server"
                AutoGenerateColumns="False" DataKeyNames="DealerID"
                DataSourceID="sdsDealer" CssClass="table table-striped">
                <Columns>
                    <asp:BoundField DataField="DealerID" HeaderText="DealerID" InsertVisible="False" ReadOnly="True" SortExpression="DealerID" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" SortExpression="PhoneNumber" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:CheckBoxField DataField="Status" HeaderText="Status" SortExpression="Status" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
            </asp:GridView>
        </div>
    </div>

</asp:Content>
