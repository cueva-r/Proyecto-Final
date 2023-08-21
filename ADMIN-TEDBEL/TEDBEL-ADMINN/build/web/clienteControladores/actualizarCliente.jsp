<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="utilitarios.ConexionMysql" %>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actulizar datos de turista</title>
    </head>
    <body>
        <h1>Actualizar Datos de Turista</h1>
        <%
            try {
                    Connection conexion  = ConexionMysql.retornaConexion();
                    PreparedStatement pst = conexion.prepareStatement("update cliente set nombre=? , apellido=? , correo=? , dni=? , telefono=? where id=? ");
                       pst.setString(1,request.getParameter("nombre"));
                       pst.setString(2,request.getParameter("apellido"));
                       pst.setString(3,request.getParameter("correo"));
                       pst.setInt(4,Integer.parseInt(request.getParameter("dni")));
                       pst.setInt(5,Integer.parseInt(request.getParameter("telefono")));
                       pst.setInt(6,Integer.parseInt(request.getParameter("cod")));
                       
                    pst.executeUpdate();    
                    conexion.close();
                    response.sendRedirect("../vistas/clientes.jsp");
                } catch (Exception e) {
                    out.print(e);
                }  
        %>
        
        
        <%
          HttpSession objeto = request.getSession();
          if(objeto.getAttribute("u")==null)
            response.sendRedirect("../index.html");
        %>
        
    </body>
</html>