Public Class CarDealerPage
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub CleanForm()
        txtPrice.Text = "0"
        txtStock.Text = "0"
        txtDiscount.Text = "0"
        txtFeePercent.Text = "0"
        ddCar.SelectedIndex = 0
        ddDealer.SelectedIndex = 0
    End Sub

    Protected Sub btnRegister_Click(sender As Object, e As EventArgs)
        Try
            sdsCarDealer.InsertParameters("CarID").DefaultValue = ddCar.SelectedValue
            sdsCarDealer.InsertParameters("DealerID").DefaultValue = ddDealer.SelectedValue
            sdsCarDealer.InsertParameters("Price").DefaultValue = txtPrice.Text
            sdsCarDealer.InsertParameters("Stock").DefaultValue = txtStock.Text
            sdsCarDealer.InsertParameters("DiscountPercent").DefaultValue = txtDiscount.Text
            sdsCarDealer.InsertParameters("FeePercent").DefaultValue = txtFeePercent.Text
            sdsCarDealer.Insert()
            ltMessage.Text = "<span class='text-success'>Car Dealer registered successfully.</span>"
            CleanForm()
        Catch ex As Exception
            ltMessage.Text = "<span class='text-danger'>Error: " & ex.Message & "</span>"
        End Try
    End Sub

    Protected Sub btnGetCar_Click(sender As Object, e As EventArgs)
        Dim stringResult As New StringBuilder
        Dim results As DataView = sdsCar.Select(DataSourceSelectArguments.Empty)

        gvCar.DataSource = results
        gvCar.DataBind()

        ddCarManual.DataSource = results
        ddCarManual.DataTextField = "Model"
        ddCarManual.DataValueField = "CarID"
        ddCarManual.DataBind()

        For Each item As DataRowView In results
            stringResult.AppendLine($"CarID: {item("CarID")}, CarName: {item("Model")}")
        Next
        ltMessage.Text = "<span class='text-info'>Cars:</span><br/>" & stringResult.ToString()
    End Sub
End Class