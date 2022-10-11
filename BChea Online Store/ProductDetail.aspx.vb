Imports System.Data
Imports System.Data.SqlClient
Public Class ProductDetail
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Request.QueryString("ProductID") <> "" Then
            Dim strConn As String = System.Configuration.ConfigurationManager.ConnectionStrings("ConnectionStringOnlineStore").ConnectionString
            Dim connProduct As SqlConnection
            Dim cmdProduct As SqlCommand
            Dim drProduct As SqlDataReader
            Dim strSQL As String = "Select * From Product WHERE ID = " & Request.QueryString("ProductID")
            connProduct = New SqlConnection(strConn)
            cmdProduct = New SqlCommand(strSQL, connProduct)
            connProduct.Open()
            drProduct = cmdProduct.ExecuteReader(CommandBehavior.CloseConnection)
            If drProduct.Read() Then
                lblProductType.Text = drProduct.Item("ProductName") & " - " & drProduct.Item("ProductBrand")
                lblProductName.Text = drProduct.Item("ProductName")
                lblProductID.Text = drProduct.Item("ProductID")
                lblProductBrand.Text = drProduct.Item("ProductBrand")
                lblProductDescription.Text = drProduct.Item("ProductDescription")
                lblProductKeyword.Text = drProduct.Item("ProductKeyword")
                imgProductImage.ImageUrl = "\images\product\" & Trim(drProduct.Item("ProductID")) & ".png"
                imgProductPreview.ImageUrl = "\images\product\" & Trim(drProduct.Item("ProductID")) & ".png"
                lblProductRating.Text = drProduct.Item("ProductRating") & "⭐"
                If Session("Username") <> "" Then
                    lblOrigPrice.Visible = True
                    lblOrigPrice.Text = "$" & drProduct.Item("Price")
                    lblSalePrice.Text = "$" & Math.Round(drProduct.Item("Price") * 0.8, 2)
                Else
                    lblOrigPrice.Visible = False
                    lblSalePrice.Text = "$" & drProduct.Item("Price")
                End If
            End If
        ElseIf Request.QueryString("ProductNo") <> "" Then
            Dim strConn As String = System.Configuration.ConfigurationManager.ConnectionStrings("ConnectionStringOnlineStore").ConnectionString
            Dim connProduct As SqlConnection
            Dim cmdProduct As SqlCommand
            Dim drProduct As SqlDataReader
            Dim strSQL As String = "Select * From Product WHERE ProductID = '" & Request.QueryString("ProductNo") & "'"
            connProduct = New SqlConnection(strConn)
            cmdProduct = New SqlCommand(strSQL, connProduct)
            connProduct.Open()
            drProduct = cmdProduct.ExecuteReader(CommandBehavior.CloseConnection)
            If drProduct.Read() Then
                lblProductType.Text = drProduct.Item("ProductName") & " - " & drProduct.Item("ProductBrand")
                lblProductName.Text = drProduct.Item("ProductName")
                lblProductID.Text = drProduct.Item("ProductID")
                lblProductBrand.Text = drProduct.Item("ProductBrand")
                lblProductDescription.Text = drProduct.Item("ProductDescription")
                lblProductKeyword.Text = drProduct.Item("ProductKeyword")
                imgProductImage.ImageUrl = "\images\product\" & Trim(drProduct.Item("ProductID")) & ".png"
                imgProductPreview.ImageUrl = "\images\product\" & Trim(drProduct.Item("ProductID")) & ".png"
                lblProductRating.Text = drProduct.Item("ProductRating") & "⭐"
                If Session("Email") <> "" Then
                    lblOrigPrice.Visible = True
                    lblOrigPrice.Text = "$" & drProduct.Item("Price")
                    lblSalePrice.Text = "$" & drProduct.Item("Price") * 0.9
                Else
                    lblOrigPrice.Visible = False
                    lblSalePrice.Text = "$" & drProduct.Item("Price")
                End If
            End If
        End If
    End Sub

End Class