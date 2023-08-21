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
        <li><a href="../vistas/clientes.jsp"><i class="fa fa-users"></i>&nbsp;  Clientes</a></li>
        <li><a href="../vistas/articulos.jsp"><i class="fa fa-shopping-basket"></i>&nbsp;  Articulos</a></li>
        <li><a href="../vistas/ventas.jsp"><i class="fa fa-cart-arrow-down"></i>&nbsp;  Ventas</a></li>
        <li><a href="../vistas/servicios.jsp"><i class="fa fa-briefcase"></i>&nbsp;  Servicios</a></li>
        <li><a href="../vistas/rescate.jsp"><i class="fa fa-id-badge"></i>&nbsp; Rescate</a></li>
        <li><a href="../vistas/adopcion.jsp"><i class="fa fa-address-card"></i>&nbsp; Adopcion</a></li>
        <li><a href="../vistas/detalleComprobante.jsp"><i class="fa fa-building-o"></i>&nbsp; Comprobante</a></li>
        
    </ul>
</nav>

<div class="wrapper">
    <br><br>
    <div class="container">
         
        <div class="info">
          
            
            <section class="container">
            
            <div class="row mt-3">
                <div class="col">
                    <a href="../vistas/articulos.jsp" class="btn btn-danger">Atras</a>
                </div>
            </div>
    
                
                
                
                
                
         <div class="container p-2  bg-dark text-white">
                    <h1>Registrar Articulos</h1>
                    
                        <form>
                            <div class="row">
                              <div class="col">
                                  Ingresar El Nombre del Producto
                                <input type="text" class="form-control"  name="Nombre">
                              </div>
                              <div class="col">
                                  Ingresar ubicacion de la Imagen (CARPETA)
                                <input type="text" class="form-control"  name="imagen">
                              </div>
                            </div>
                            
                            <div class="row">
                              <div class="col">
                                  Ingresar el Id de la Categoria
                                <input type="text" class="form-control"  name="Categoria">
                              </div>
                              <div class="col">
                                  Ingresar El Precio
                                <input type="text" class="form-control" name="Precio">
                              </div>
                            </div>
                            
                            <div class="row">
                                <div class="col">
                                  Ingresar El Stock
                                <input type="text" class="form-control" name="Stock">
                              </div>
                                
                              <div class="col">
                                  <br>
                                  <p><button type="submit" class="btn btn-primary" name="btnRegistrar" velue="Registrar">registrar</button>
                                  <a href="../vistas/rescate.jsp" class="btn btn-danger">Cancelar</a>
                              </div>
                            </div>
                            
                            
                            

                            
                          </form>
                    
                    
                    
                    
   <%
   if (request.getParameter("btnRegistrar") != null) {
      try {
         //2. Conexión a la base de datos
         Connection conexion = ConexionMysql.retornaConexion();
         //3. Preparar la instrucción SQL
         PreparedStatement pst = conexion.prepareStatement("insert into productos (nombre,img_producto, id_categoria, precio, stock) values (?,?,?,?,?)");
         //3.1 Establecer los valores en los parámetros "?"
         pst.setString(1, request.getParameter("Nombre"));
         pst.setString(2, request.getParameter("imagen"));
         pst.setInt(3, Integer.parseInt(request.getParameter("Categoria")));
         pst.setFloat(4, Float.parseFloat(request.getParameter("Precio")));
         pst.setInt(5, Integer.parseInt(request.getParameter("Stock")));
         //4. Ejecutar en la base de datos
          pst.executeUpdate();
        //5. Liberar los recursos
       conexion.close();
        //6. Abrir la página
        response.sendRedirect("../vistas/articulos.jsp");
         } catch (Exception e) {
            out.print(e);
     }
     }
     %>
  
  
  
  
  
  
        </section>
          
      </div>
    </div>
    </div>
</div>
        
        
        
        
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
    </body>
</html>
