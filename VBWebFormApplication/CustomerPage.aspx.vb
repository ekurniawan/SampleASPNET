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

        LoadData()
    End Sub

    Private Sub LoadData()
        Try
            Dim strSql As String = "select * from Customer order by Name asc"
            cmd = New SqlCommand(strSql, conn)
            conn.Open()
            Dim da As New SqlDataAdapter
            da.SelectCommand = cmd
            Dim ds As New DataSet
            da.Fill(ds, "Customer")

            gvCustomer.DataSource = ds.Tables("Customer")
            gvCustomer.DataBind()
        Catch ex As Exception
            ltMessage.Text = "<span class='alert alert-warning'>" & ex.Message & "</span>"
        Finally
            cmd.Dispose()
            conn.Close()
        End Try
    End Sub

    Protected Sub btnCustomer_Click(sender As Object, e As EventArgs)

    End Sub
End Class