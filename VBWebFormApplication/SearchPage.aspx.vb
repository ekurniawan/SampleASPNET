Public Class SearchPage
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        Dim contentPlaceHolder As ContentPlaceHolder = CType(Master.FindControl("MainContent"), ContentPlaceHolder)
        Dim txtSearch As TextBox = CType(contentPlaceHolder.FindControl("txtSearch"), TextBox)

        lblSearch.Text = "You searched for: " & txtSearch.Text

    End Sub

End Class