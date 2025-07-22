Public Class SearchPage
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Page.PreviousPage IsNot Nothing Then
            'Dim contentPlaceHolder As ContentPlaceHolder = CType(Master.Page.FindControl("MainContent"), ContentPlaceHolder)
            'Dim txtSearch As TextBox = CType(contentPlaceHolder.FindControl("txtSearch"), TextBox)
            Dim txtSearch As TextBox = CType(Master.Page.FindControl("txtSearch"), TextBox)
            lblSearch.Text = "You searched for: " & txtSearch.Text
        End If
    End Sub

End Class