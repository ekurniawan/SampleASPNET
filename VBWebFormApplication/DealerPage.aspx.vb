Public Class DealerPage
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub sdsDealer_Selected(sender As Object, e As SqlDataSourceStatusEventArgs)
        If Not IsNothing(e.Exception) Then
            ltMessage.Text = "<div class='alert alert-warning'> An error occurred while retrieving the dealer data: " & e.Exception.Message & "</div>"
            e.ExceptionHandled = True
        End If
    End Sub

    Protected Sub sdsDealer_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs)

    End Sub
End Class