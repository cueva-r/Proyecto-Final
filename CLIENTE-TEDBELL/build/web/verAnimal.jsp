<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="utilitarios.ConexionMysql" %>
<%@page import="java.sql.*" %>

<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Mouse+Memoirs&display=swap" rel="stylesheet">        
        <link rel="stylesheet" href="styles/estilosAdopcion.css">
        <title>Modulo Adopción</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    </head>
    <body>
        <!-- Header -->
        <!-- Header -->





        <div class="container-fluid mt-3 header-logo" style="background-color: rgb(193, 223, 240)">
            <div class="logo col-12">
                <a href="login.html">
                    <img src="imagenes/Logo2.png" alt="">
                </a>
            </div>
        </div>
        <nav class="navbar navbar-expand-lg sticky-top" style="background-color: rgb(193, 223, 240);">
            <div class="container-fluid navigationbar">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                    <div class="navbar-nav nav-container-1 col-12">
                        <div class="icon-container col-1" style="width: 5%;">
                            <a class="navbar-brand" href="#">
                                <img src="imagenes/pawIcon.png" alt="#">
                            </a>
                        </div>
                        <div class="navbar-nav nav-container-2 col-10" style="width: 90%;">
                            <a class="nav-link active" aria-current="page" href="index.html">Inicio</a>
                            <a class="nav-link" href="servicios.html">Servicios</a>
                            <a class="nav-link" href="shop.jsp">Articulos</a>
                            <ul class="navbar-nav">
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="moduloAdopcion.html" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        Adopción
                                    </a>
                                    <ul class="dropdown-menu" aria-labelledby="navbarDarkDropdownMenuLink" style="background-color: rgb(193, 223, 240);">
                                        <li><a class="dropdown-item" href="moduloAdopcion.html" style="background-color: rgb(193, 223, 240);">Información</a></li>
                                        <li><a class="dropdown-item" href="verAnimal.jsp" style="background-color: rgb(193, 223, 240);">Ver Mascotas en Adopcion</a></li>
                                        <li><a class="dropdown-item" href="registroAdopcion.jsp" style="background-color: rgb(193, 223, 240);">Registro de Adopción</a></li>
                                    </ul>
                                </li>
                            </ul>
                            <a class="nav-link" href="rescate.jsp">Solicitar Rescate</a>
                        </div>
                        <div class="icon-container-2 col-1" style="width: 5%;">
                            <a class="navbar-brand" href="login.html">Iniciar Sesión</a>
                            <a class="navbar-brand" href="CerrarSesion.jsp">Cerrar Sesión


                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-door-open" viewBox="0 0 16 16">
                                <path d="M8.5 10c-.276 0-.5-.448-.5-1s.224-1 .5-1 .5.448.5 1-.224 1-.5 1z"/>
                                <path d="M10.828.122A.5.5 0 0 1 11 .5V1h.5A1.5 1.5 0 0 1 13 2.5V15h1.5a.5.5 0 0 1 0 1h-13a.5.5 0 0 1 0-1H3V1.5a.5.5 0 0 1 .43-.495l7-1a.5.5 0 0 1 .398.117zM11.5 2H11v13h1V2.5a.5.5 0 0 0-.5-.5zM4 1.934V15h6V1.077l-6 .857z"/>
                                </svg>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </nav>
        <!-- Header -->  
        <br><br>
        <div class="container">
            <%
                try {//Traer a la información de la tabla ejemplar
                    //1. Conexion a la base de datos
                    Connection conexion = ConexionMysql.retornaConexion();
                    //2. Preparar la consulta
                    PreparedStatement pst = conexion.prepareStatement("select * from animal");
                    //3. Ejecutar y almacenar en una tabla virtual(RAM)
                    ResultSet tabla = pst.executeQuery();
                    //4. Preparar la tabla de HML
                    out.print("<table class='table table-striped' style='font-size:35px'");
                    out.print("<tr>");
                    out.print("<th>Codigo <th>Nombre <th>Especie <th>Raza <th>Edad  <th>Imágenes ");
                    //5. Mostrar los datos en la Web
                    while (tabla.next()) {
                        out.print("<tr style='vertical-align: middle'>");
                        out.print("<td>" + tabla.getObject("id"));
                        out.print("<td>" + tabla.getObject("nombre"));
                        out.print("<td>" + tabla.getObject("especie"));
                        out.print("<td>" + tabla.getObject("raza"));
                        out.print("<td>" + tabla.getObject("edadAprox"));
                        out.print("<td class='container' style='width:300px'> <img src=\" " + tabla.getObject("image") + "\" class='container' style='width:300px''>");

                    }
                    //6. Cerrar la tabla y liberar recursos
                    out.print("</table>");
                    conexion.close();
                } catch (Exception e) {//Lugar que atrapa el error
                    out.print(e);
                }
            %> 
        </div>


        <br><br>
        <!-- Footer -->
        <footer class="text-center text-lg-start bg-light text-muted">
            <hr>
            <section class="">
                <div class="container text-center text-md-start mt-5">
                    <div class="row mt-3">
                        <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4 logo-footer">
                            <a href="login.html">
                                <img src="imagenes/Logo2.png" alt="">
                            </a>
                        </div>
                        <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
                            <h6 class="text-uppercase fw-bold mb-4">Horarios</h6>
                            <p>Lunes a Sábado:<br /> 13:15 a 15:15 y 20:15 a 22:30</p>
                            <p>Domingos:<br /> 13:15 a 15:15 y de 20:15 a 21:15</p>
                        </div>
                        <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
                            <h6 class="text-uppercase fw-bold mb-4">
                                Links
                            </h6>
                            <p>
                                <a href="carta.html" class="text-reset">Menú</a>
                            </p>
                            <p>
                                <a href="lugares.html" class="text-reset">Reservas</a>
                            </p>
                            <p>
                                <a href="#!" class="text-reset">Trabaja con nosotros</a>
                            </p>
                            <p>
                                <a href="#!" class="text-reset">Política de Privacidad</a>
                            </p>
                        </div>
                        <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
                            <!-- Links -->
                            <h6 class="text-uppercase fw-bold mb-4">Contact</h6>
                            <p><i class="fas fa-home me-3"></i> Lima, Lima 10012, Perú</p>
                            <p>
                                <i class="fas fa-envelope me-3"></i>
                                laboratorio2@zegelipae.com
                            </p>
                            <p><i class="fas fa-phone me-3"></i> 989-249-799</p>
                            <p><i class="fas fa-print me-3"></i> 902-374-687</p>
                        </div>
                    </div>
                </div>
            </section>
            <div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.05);">
                © 2022 Copyright:
                <a class="text-reset fw-bold" href="https://www.zegelipae.edu.pe/">Laboratorio de Integración 2</a>
            </div>

        </footer>
        <!-- Footer -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
    </body>
</html>
