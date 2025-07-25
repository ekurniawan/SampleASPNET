Imports SampleASPNET.BLL

Public Class CarLists
    Inherits System.Web.UI.Page

    Private _carBL As New CarBL

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            gvCar.DataSource = _carBL.GetAllCars()
            gvCar.DataBind()
        End If
    End Sub

End Class