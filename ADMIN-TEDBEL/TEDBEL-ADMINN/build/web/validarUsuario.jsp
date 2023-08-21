<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Importar Librerias -->
<%@page import="java.sql.*"%>
<%@page import="utilitarios.ConexionMysql" %>
<%@page session="true"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>validar usuario</title>
    </head>
    <body>
        <%
            if (request.getParameter("login") != null)
            {
                String correo = request.getParameter("correo");
                String clave = request.getParameter("contrasena");
                Connection conexion = ConexionMysql.retornaConexion();
                String sql = "select * from empleado where correo=? && pass=?";
                PreparedStatement pst = conexion.prepareStatement(sql);
                pst.setString(1, correo);
                pst.setString(2, clave);
                ResultSet tabla = pst.executeQuery();
                if (tabla.next())
                {
                    HttpSession objeto = request.getSession();
                    objeto.setAttribute("u", correo);
                    response.sendRedirect("vistas/principal.jsp");
                } else
                {
                    response.sendRedirect("login.html");
                }
            }

        %>
    </body>
</html>