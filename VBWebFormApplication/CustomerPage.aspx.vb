Imports System.Data.SqlClient
Imports System.Web.Configuration

Public Class CustomerPage
    Inherits System.Web.UI.Page

    Private conn As SqlConnection
    Private cmd As SqlCommand
    Private strConn As String =
        WebConfigurationManager.ConnectionStrings("AutomotiveDBConnectionString").ConnectionString


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        txtCustomerID.Enabled = False

        'check fist time load   
        If Not IsPostBack Then

            conn = New SqlConnection(strConn)

            LoadDataCustomers()
        End If
    End Sub

#Region "CRUD Customers"

    Private Sub LoadDataCustomers()
        Dim results = GetDataCustomers()
        gvCustomer.DataSource = results
        gvCustomer.DataBind()
    End Sub

    Private Function InsertCustomer(customer As Customer) As Boolean
        Using conn As New SqlConnection(strConn)
            Dim strSql = "insert into Customer (Name, CardID, Address, PhoneNumber, Email) " &
                         "values (@Name, @CardID, @Address, @PhoneNumber, @Email)"
            Dim cmd As New SqlCommand(strSql, conn)

            cmd.Parameters.AddWithValue("@Name", customer.Name)
            cmd.Parameters.AddWithValue("@CardID", customer.CardID)
            cmd.Parameters.AddWithValue("@Address", customer.Address)
            cmd.Parameters.AddWithValue("@PhoneNumber", customer.PhoneNumber)
            cmd.Parameters.AddWithValue("@Email", customer.Email)
            Try
                conn.Open()
                Dim result = cmd.ExecuteNonQuery()
                Return result > 0
            Catch sqlEx As SqlException
                ltMessage.Text = "<span class='alert alert-warning'>Error: " & sqlEx.Message & "</span>"
            Catch ex As Exception
                ltMessage.Text = "<span class='alert alert-warning'>Error: " & ex.Message & "</span>"
            Finally
                cmd.Dispose()
                conn.Close()
            End Try
        End Using
    End Function

    Private Function GetDataCustomers() As List(Of Customer)
        Dim customers As New List(Of Customer)
        Using conn As New SqlConnection(strConn)
            Dim cmd As New SqlCommand("SELECT * FROM Customer ORDER BY Name ASC", conn)
            conn.Open()

            Dim reader As SqlDataReader = cmd.ExecuteReader()

            While reader.Read()
                Dim customer As New Customer With {
                    .CustomerID = Convert.ToInt32(reader("CustomerID")),
                    .Name = reader("Name").ToString(),
                    .CardID = reader("CardID").ToString(),
                    .Address = reader("Address").ToString(),
                    .PhoneNumber = reader("PhoneNumber").ToString(),
                    .Email = reader("Email").ToString()
                }
                customers.Add(customer)
            End While
            Return customers
        End Using
    End Function

    Private Function GetCustomerByName(name As String) As List(Of Customer)
        Dim customers As New List(Of Customer)
        Using conn As New SqlConnection(strConn)
            Dim cmd As New SqlCommand("GetCustomersByName", conn)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@Name", "%" & name & "%")
            conn.Open()
            Dim reader As SqlDataReader = cmd.ExecuteReader()
            While reader.Read()
                Dim customer As New Customer
                customer.CustomerID = Convert.ToInt32(reader("CustomerID"))
                customer.Name = reader("Name").ToString()
                customer.CardID = reader("CardID").ToString()
                customer.Address = reader("Address").ToString()
                customer.PhoneNumber = reader("PhoneNumber").ToString()
                customer.Email = reader("Email").ToString()

                customers.Add(customer)
            End While

            reader.Close()
            cmd.Dispose()
            conn.Close()

            Return customers
        End Using
    End Function

    Private Function LoadData() As DataTable
        Try
            Dim strSql As String = "select * from Customer order by Name asc"
            cmd = New SqlCommand(strSql, conn)
            conn.Open()
            Dim da As New SqlDataAdapter
            da.SelectCommand = cmd
            Dim ds As New DataSet
            da.Fill(ds, "Customer")

            Return ds.Tables("Customer")
        Catch ex As Exception
            ltMessage.Text = "<span class='alert alert-warning'>" & ex.Message & "</span>"
        Finally
            cmd.Dispose()
            conn.Close()
        End Try
    End Function

    Private Sub ClearForm()
        txtName.Text = String.Empty
        txtCardID.Text = String.Empty
        txtAddress.Text = String.Empty
        txtPhoneNumber.Text = String.Empty
        txtEmail.Text = String.Empty
    End Sub

#End Region



    Protected Sub btnSearch_Click(sender As Object, e As EventArgs)
        Dim results = GetCustomerByName(txtSearch.Text.Trim())
        If results.Count > 0 Then
            gvCustomer.DataSource = results
            gvCustomer.DataBind()
        Else
            ltMessage.Text = "<span class='alert alert-warning'>No customers found.</span>"
        End If
    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs)
        Try
            Dim newCustomer As New Customer With {
           .Name = txtName.Text.Trim(),
           .CardID = txtCardID.Text.Trim(),
           .Address = txtAddress.Text.Trim(),
           .PhoneNumber = txtPhoneNumber.Text.Trim(),
           .Email = txtEmail.Text.Trim()
           }
            Dim isInserted = InsertCustomer(newCustomer)
            If isInserted Then
                LoadDataCustomers()
                ClearForm()
                ltMessage.Text = "<span class='alert alert-success'>Customer added successfully.</span>"
            Else
                ltMessage.Text = "<span class='alert alert-warning'>Failed to add customer.</span>"
            End If
        Catch ex As Exception
            ltMessage.Text = "<span class='alert alert-warning'>Error: " & ex.Message & "</span>"
        End Try
    End Sub
End Class