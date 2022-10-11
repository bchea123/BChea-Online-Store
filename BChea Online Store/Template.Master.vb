Imports System.Data
Imports System.Data.SqlClient
Public Class Template
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim strConn As String = System.Configuration.ConfigurationManager.ConnectionStrings("ConnectionStringOnlineStore").ConnectionString
        Dim connMainCategory As SqlConnection
        Dim cmdMainCategory As SqlCommand
        Dim drMainCategory As SqlDataReader
        Dim strSQL As String = "SELECT * FROM Category WHERE Parent = 0"
        connMainCategory = New SqlConnection(strConn)
        cmdMainCategory = New SqlCommand(strSQL, connMainCategory)
        connMainCategory.Open()
        drMainCategory = cmdMainCategory.ExecuteReader(CommandBehavior.CloseConnection)
        Dim strMainCategory As String = ""
        Do While drMainCategory.Read()
            strMainCategory = strMainCategory + "<li><a href=''>" + Trim(drMainCategory("CategoryName")) + "</a></li>"
        Loop
        lblMainCategory.Text = strMainCategory
        If Session("Username") <> "" Then
            hlLogout.Visible = True
            hlLogin.Visible = False
            hrefCustomer.InnerText = Session("Username")
        Else
            hlLogout.Visible = False
            hlLogin.Visible = True
            hrefCustomer.InnerText = ""
        End If
    End Sub

    Protected Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        If tbSearchString.Text <> "" Then
            Dim strCheck = " "
            Dim strSearch = Trim(tbSearchString.Text)
            If Not strSearch.Contains(strCheck) Then
                Dim strConn As String = System.Configuration.ConfigurationManager.ConnectionStrings("ConnectionStringOnlineStore").ConnectionString
                Dim connProductSearch As SqlConnection
                Dim cmdProductSearch As SqlCommand
                Dim drProductSearch As SqlDataReader
                Dim strSQL As String = "Select * From Product WHERE ProductID = '" & Trim(tbSearchString.Text) & "'"
                connProductSearch = New SqlConnection(strConn)
                cmdProductSearch = New SqlCommand(strSQL, connProductSearch)
                connProductSearch.Open()
                drProductSearch = cmdProductSearch.ExecuteReader(CommandBehavior.CloseConnection)
                Dim strURL As String
                If drProductSearch.Read() Then
                    strURL = "ProductDetail.aspx?ProductNo=" & strSearch
                    Response.Redirect(strURL)
                Else
                    strURL = "Category.aspx?SearchString=" & strSearch
                    Response.Redirect(strURL)
                End If
            End If
        End If
    End Sub
End Class