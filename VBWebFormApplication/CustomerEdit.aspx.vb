Public Class CustomerEdit
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ltMessage.Text = "Customer ID: " & Request.QueryString("CustomerID")
        End If
    End Sub

End Class