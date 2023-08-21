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
        <h1>Actualizar Datos de Articulo</h1>
        <%
            try {
                    Connection conexion  = ConexionMysql.retornaConexion();
                    PreparedStatement pst = conexion.prepareStatement("update productos set nombre=?, img_producto=? , id_categoria=? , precio=? , stock=? where id_producto=? ");
                       pst.setString(1,request.getParameter("nombre"));
                       pst.setString(2,request.getParameter("img_producto"));
                       pst.setInt(3,Integer.parseInt(request.getParameter("id_categoria")));
                       pst.setFloat(4,Float.parseFloat(request.getParameter("precio")));
                       pst.setInt(5,Integer.parseInt(request.getParameter("stock")));
                       pst.setInt(6,Integer.parseInt(request.getParameter("id_producto")));
                       
                    pst.executeUpdate();    
                    conexion.close();
                    response.sendRedirect("../vistas/articulos.jsp");
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