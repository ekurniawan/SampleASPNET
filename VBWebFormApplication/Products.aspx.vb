Public Class Products
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
        Dim gender As String
        If rblGender.Text = "Male" Then
            gender = "Mr."
        Else
            gender = "Ms."
        End If

        lblBio.Text = "Thank you for your submission, " & gender & txtFirstName.Text & " " & txtLastName.Text
    End Sub

    Protected Sub btnIncrement_Click(sender As Object, e As EventArgs) Handles btnIncrement.Click
        lblCount.Text = CInt(lblCount.Text) + 1
    End Sub


End Class