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
                    <a href="../vistas/detalleComprobante.jsp" class="btn btn-danger">Atras</a>
                </div>
            </div>
            
         
                
                
                <%
                        try {//Evalua si hay error
                            //2. Conexion  a base de datos
                            Connection conexion = ConexionMysql.retornaConexion();
                            //3. Crear instruccion de consulta "select"
                            PreparedStatement pst = conexion.prepareStatement("select * from registro_rescate where id=?");
                            //3.1.  Agregar dato del codigo en el parametro de entrada
                                pst.setInt(1, Integer.parseInt(request.getParameter("idRescate")));
                            //4. Ejecutar y retornar la información
                            ResultSet tabla = pst.executeQuery();
                            //4.1 Leer los datos
                            tabla.next();
                            //5. Mostrar en la web
                            out.print("<form class='text-center' action='actualizarRescate.jsp' method='post'>");
                                out.print("<p><input type='text' name='id' value="+tabla.getInt(1)+">");
                                out.print("<p><input type='text' name='idRescatista' value="+tabla.getInt(2)+">");
                                out.print("<p><input type='text' name='idAnimal' value="+tabla.getInt(3)+">");
                                out.print("<p><input type='text' name='fecha' value="+tabla.getDate(4)+">");
                                out.print("<p><input type='text' name='estado' value="+tabla.getString(5)+">");
                                out.print("<p><input type='text' name='peso' value="+tabla.getFloat(6)+">");
                                out.print("<p><input type='text' name='lugar' value="+tabla.getString(7)+">");
                                out.print("<p><input type='text' name='descripcion' value="+tabla.getString(8)+">");
                                out.print("<p><input type='submit' name='btnactualizar' value='Actualizar'>");
                            out.print("</from>");
                            //6. Liberar recursos
                            conexion.close();
                        } catch (Exception e) {//Atrapar el error
                            out.print(e);
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
