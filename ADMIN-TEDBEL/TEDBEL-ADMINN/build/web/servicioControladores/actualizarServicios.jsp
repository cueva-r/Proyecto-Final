<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="utilitarios.ConexionMysql"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Actualiza Postulante SAPE</h1>
        
        <%
            try {
                    //2. Conexion a la base de datos
                    Connection conexion  = ConexionMysql.retornaConexion();
                    //3. Preparar instruccion para actualizar "update"
                    PreparedStatement pst = conexion.prepareStatement("update servicio set precio=? , nombre=? , idMascota=? ,id_cliente=? where id=? ");
                       //3.1.  Agregar los  parametros
                       
                       
                       pst.setDouble(1,Double.parseDouble(request.getParameter("VERprecio")));
                       pst.setString(2,request.getParameter("VERnombre"));
                       pst.setInt(3,Integer.parseInt(request.getParameter("VERidMascota")));
                       pst.setInt(4,Integer.parseInt(request.getParameter("VERid_cliente")));
                       pst.setInt(5,Integer.parseInt(request.getParameter("VERID")));
                       
                       
                       
                       
                    //4. Ejecutar la instruccion
                    pst.executeUpdate();
                    //5. Liberar recursos
                    conexion.close();
                    //Opcional -- Mostrar la pagina principal
                    response.sendRedirect("../vistas/servicios.jsp");
                } catch (Exception e) {
                    out.print(e);
                }  
        %>
    </body>
</html>
