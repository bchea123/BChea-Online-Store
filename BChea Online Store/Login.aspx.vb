Imports System.Data
Imports System.Data.SqlClient
Public Class Login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnLogin_Click(sender As Object, e As EventArgs) Handles btnLogin.Click
        Dim strUsername As String = Trim(username.Value)
        Dim strPassword As String = Trim(password.Value)
        If strUsername <> "" Then
            Dim strConn As String = System.Configuration.ConfigurationManager.ConnectionStrings("ConnectionStringOnlineStore").ConnectionString
            Dim connLogin As SqlConnection
            Dim cmdLogin As SqlCommand
            Dim drLogin As SqlDataReader
            Dim strSQL As String = "Select * From Customer WHERE Username = '" & strUsername & "' AND Password = '" & strPassword & "'"
            connLogin = New SqlConnection(strConn)
            cmdLogin = New SqlCommand(strSQL, connLogin)
            connLogin.Open()
            drLogin = cmdLogin.ExecuteReader(CommandBehavior.CloseConnection)
            If drLogin.Read() Then
                Session("Username") = strUsername
                Response.Redirect("Default.aspx")
            Else
                lblMessage.Text = "Invalid account! Please try logging in again!"
            End If
        End If
    End Sub
End Class