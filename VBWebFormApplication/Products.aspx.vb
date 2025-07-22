Public Class Products
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs)
        lblBio.Text = "Thank you for your submission, " & txtFirstName.Text & " " & txtLastName.Text
    End Sub

    'Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
    '    lblBio.Text = "Thank you for your submission, " & txtFirstName.Text
    'End Sub
End Class