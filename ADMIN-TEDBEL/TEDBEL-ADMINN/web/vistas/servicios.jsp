<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="utilitarios.ConexionMysql" %>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <title>Sistema de Bilioteca</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"/>
        <style>
            

body{
    margin:0;
    padding:0;
    font-family:'montserrat';
    background:#e3e9f7;
}

.logo{
    padding:20px;
}

nav ul{
    margin:0;
    padding:0;
    height:100%;
    width:260px;
    position:fixed;
    top:0;
    left:0;
    background-color:#2b2626;
}

nav ul li{
    list-style:none;
}


nav ul li a{
    display:block;
    font-family:'montserrat';
    text-decoration:none;
    text-transform:uppercase;
    font-size:17px;
    color:#fff;
    position:relative;
    padding:15px 0px 15px 25px;
    transition:all 0.5s;
}

nav ul li a:before{
    content:'';
    position:absolute;
    top:0;
    right:0;
    height:100%;
    background:#e3e9f7;
    border-radius:40px 0 0 40px;
    z-index:-1;
    transition:all 1s;
}

nav ul li a:hover{
    color:#2b2626;
}

nav ul li a:hover:before{
    width:95%;
}


.wrapper{
    margin-left:260px;
}

.section{
    display:grid;
    place-items:center;
    min-height:100vh;
    text-align:center;
}

.box-area h2{
    text-transform:uppercase;
    font-size:30px;
}
        </style>
        
    </head>
    <body>
        <nav>
    <ul>
        <li class="logo"><img src="https://i.imgur.com/E26Pj54.png"></li>
        <li><a href="clientes.jsp"><i class="fa fa-users"></i>&nbsp;  Clientes</a></li>
        <li><a href="articulos.jsp"><i class="fa fa-shopping-basket"></i>&nbsp;  Articulos</a></li>
        <li><a href="ventas.jsp"><i class="fa fa-cart-arrow-down"></i>&nbsp;  Ventas</a></li>
        <li><a href="servicios.jsp"><i class="fa fa-briefcase"></i>&nbsp;  Servicios</a></li>
        <li><a href="rescate.jsp"><i class="fa fa-id-badge"></i>&nbsp; Rescate</a></li>
        <li><a href="adopcion.jsp"><i class="fa fa-address-card"></i>&nbsp; Adopcion</a></li>
        <li><a href="detalleComprobante.jsp"><i class="fa fa-building-o"></i>&nbsp; Comprobante</a></li>
        <li><a href="../CerrarSesion.jsp"><i class="fa fa-user-circle"></i>&nbsp; Cerrar Session....</a></li>
        
    </ul>
</nav>

<div class="wrapper">
    <br><br>
    <div class="container">
         
        <div class="info">
          
            
            <section class="container">
            
            <div class="row mt-3">
                <div class="col">
                    <a href="../servicioControladores/registrarServicios.jsp" class="btn btn-dark">Registrar Servicios</a>
                </div>
            </div>
            
         
            
            <div class="row mt-3">
                <div class="col">
                    <%
                        try {//Traer a la información de la tabla ejemplar
                            //1. Conexion a la base de datos
                            Connection conexion = ConexionMysql.retornaConexion();
                            //2. Preparar la consulta
                            PreparedStatement  pst  = conexion.prepareStatement("select * from servicio");
                            //3. Ejecutar y almacenar en una tabla virtual(RAM)
                            ResultSet tabla = pst.executeQuery();
                            //4. Preparar la tabla de HML
                            out.print("<table class='table table-striped'>");
                            out.print("<tr>");
                            out.print("<th>ID <th>Precio <th>Nombre <th>ID Mascota <th>ID Cliente <th colspan=3>Operaciones");
                            //5. Mostrar los datos en la Web
                            while(tabla.next()){
                                out.print("<tr>");
                                out.print("<td>"+tabla.getObject("id"));
                                out.print("<td>"+tabla.getObject("precio"));
                                out.print("<td>"+tabla.getObject("nombre"));
                                out.print("<td>"+tabla.getObject("idMascota"));
                                out.print("<td>"+tabla.getObject("id_cliente"));
                                
                                out.print("<td><a href=\"../servicioControladores/verServicios.jsp?idServicio="+tabla.getObject("id")+"\" class='btn btn-primary'> Ver </a>");
                                out.print("<td><a href=\"../servicioControladores/editarServicios.jsp?idServicio="+tabla.getObject("id")+"\" class='btn btn-secondary'> Editar </a>");
                                out.print("<td><a href=\"../servicioControladores/eliminarServicios.jsp?idServicio="+tabla.getObject("id")+"\" class='btn btn-danger'> Eliminar </a>");
                            }
                            //6. Cerrar la tabla y liberar recursos
                            out.print("</table>");
                                conexion.close();
                            } catch (Exception e) {//Lugar que atrapa el error
                                out.print(e);
                            }        
                    %>     
                </div>
            </div>
        </section>
          
      </div>
    </div>
    </div>
</div>
        
        
        <%
          HttpSession objeto = request.getSession();
          if(objeto.getAttribute("u")==null)
            response.sendRedirect("../index.html");
        %>
        
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
    </body>
</html>
