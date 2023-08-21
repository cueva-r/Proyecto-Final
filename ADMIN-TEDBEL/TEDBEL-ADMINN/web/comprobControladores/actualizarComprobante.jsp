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
        <li><a href="#"><i class="fa fa-home"></i>&nbsp;  Clientes</a></li>
        <li><a href="#"><i class="fa fa-book"></i>&nbsp;  Articulos</a></li>
        <li><a href="#"><i class="fa fa-users"></i>&nbsp;  Ventas</a></li>
        <li><a href="#"><i class="fa fa-picture-o"></i>&nbsp;  Servicios</a></li>
        <li><a href="#"><i class="fa fa-phone"></i>&nbsp; Rescate</a></li>
        <li><a href="#"><i class="fa fa-phone"></i>&nbsp; Adopcion</a></li>
        <li><a href="#"><i class="fa fa-phone"></i>&nbsp; Comprobante</a></li>
        
    </ul>
</nav>

<div class="wrapper">
    <br><br>
    <div class="container">
         
        <div class="info">
          
            
            <section class="container">
            
            <div class="row mt-3">
                <div class="col">
                    <a href="../vistas/detalleComprobante.jsp" class="btn btn-danger">Atras</a>
                </div>
            </div>
  <tbody>
      
      
      
    <%
  try {
     Connection conexion = ConexionMysql.retornaConexion();
     PreparedStatement pst = conexion.prepareStatement("update detalle_comprobante set ruc=?, direccion=?, fecha=?, nombre=?, servicios=?, articulos=?, total=? where id=?");
      pst.setInt(1, Integer.parseInt(request.getParameter("ruc")));
      pst.setString(2, request.getParameter("direccion"));
      pst.setDate(3, Date.valueOf(request.getParameter("fecha")));
      pst.setString(4, request.getParameter("nombre"));
      pst.setString(5, request.getParameter("servicios"));
      pst.setString(6, request.getParameter("articulos"));
      pst.setFloat(7, Float.parseFloat(request.getParameter("total")));
      pst.setInt(8, Integer.parseInt(request.getParameter("id")));
      pst.executeUpdate();
      conexion.close();
      response.sendRedirect("../vistas/detalleComprobante.jsp");
     } catch (Exception e) {
    out.print(e);
     }
    %>
  </tbody>
</table>
  
  
  
  
  
  
        </section>
          
      </div>
    </div>
    </div>
</div>
        
        
        
        
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
    </body>
</html>
