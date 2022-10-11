Public Class Category
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Request.QueryString("MainCategoryID") <> "" Then
            sqlDSSubCategory.SelectCommand = "SELECT * FROM Category WHERE Parent = " & CInt(Request.QueryString("MainCategoryID"))
            rpSubCategory.DataBind()
            lblMainCategoryName.Text = Request.QueryString("MainCategoryName")
            lblBCMainCategory.Text = Request.QueryString("MainCategoryName")
            If Request.QueryString("SubCategoryID") <> "" Then
                lblProductType.Text = Request.QueryString("SubCategoryName") & " " & Request.QueryString("MainCategoryName")
                sqlDSProducts.SelectCommand = "SELECT * FROM Product WHERE SubCategoryID = " & CInt(Request.QueryString("SubCategoryID"))
                sqlDSProducts.DataBind()
                lblBCSubCategory.Text = Request.QueryString("SubCategoryName")
            Else
                sqlDSProducts.SelectCommand = "SELECT * FROM Product WHERE Featured = 'y' AND MainCategoryID = " & Request.QueryString("MainCategoryID")
                lblProductType.Text = "Featured Items"
            End If
        ElseIf Request.QueryString("SearchString") <> "" Then
            sqlDSProducts.SelectCommand = "SELECT * FROM Product WHERE ProductName Like '%" & Request.QueryString("SearchString") & "%'"
            rpProducts.DataBind()
            If Not rpProducts.DataSource Then
                lblProductType.Text = "Search results for: " & Request.QueryString("SearchString")
            Else
                lblProductType.Text = "No products found!"
            End If
        End If
    End Sub

    Public Function CalculatePrice()
        Dim ProductPrice As Double = Eval("Price")
        If Session("Username") <> "" Then
            ProductPrice = Math.Round(ProductPrice * 0.8, 2)
        End If
        Return ProductPrice
    End Function

End Class