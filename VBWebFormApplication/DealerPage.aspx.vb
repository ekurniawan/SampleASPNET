Imports System.Data.SqlClient

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

    Protected Sub sdsDealer_Inserting(sender As Object, e As SqlDataSourceCommandEventArgs)
        For Each param As SqlParameter In e.Command.Parameters
            If param.Value Is Nothing Then
                e.Cancel = True
                ltMessage.Text = "<div class='alert alert-warning'> Please fill in all required fields.</div>"
            End If
        Next
    End Sub

    Protected Sub sdsDealer_Inserted(sender As Object, e As SqlDataSourceStatusEventArgs)
        ltMessage.Text = "<div class='alert alert-success'> Dealer added successfully.</div>"
    End Sub

    Protected Sub sdsDealer_Updated(sender As Object, e As SqlDataSourceStatusEventArgs)
        ltMessage.Text = "<div class='alert alert-success'> Dealer updated successfully.</div>"
    End Sub

    Protected Sub sdsDealer_Updating(sender As Object, e As SqlDataSourceCommandEventArgs)
        Dim strParam As New StringBuilder
        For Each param As SqlParameter In e.Command.Parameters
            If param.Value Is Nothing Then
                e.Cancel = True
                strParam.Append(param.ParameterName.Replace("@", String.Empty) & ", ")
            End If
        Next
        ltMessage.Text = "<div class='alert alert-warning'> Please fill (" & strParam.ToString & ") in all required fields.</div>"
    End Sub

    Protected Sub sdsDealer_Deleted(sender As Object, e As SqlDataSourceStatusEventArgs)
        ltMessage.Text = "<div class='alert alert-success'> Dealer deleted successfully.</div>"
    End Sub
End Class