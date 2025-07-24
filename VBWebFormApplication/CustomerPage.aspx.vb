Imports System.Data.SqlClient
Imports System.Web.Configuration

Public Class CustomerPage
    Inherits System.Web.UI.Page

    Private conn As SqlConnection
    Private cmd As SqlCommand
    Private strConn As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        strConn = WebConfigurationManager.ConnectionStrings("AutomotiveDBConnectionString").ConnectionString
        conn = New SqlConnection(strConn)

        Dim results = GetDataCustomers()
        gvCustomer.DataSource = results
        gvCustomer.DataBind()
    End Sub

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

    Protected Sub btnCustomer_Click(sender As Object, e As EventArgs)

    End Sub
End Class