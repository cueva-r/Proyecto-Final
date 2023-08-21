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
                            <a class="nav-link" href="rescate.html">Solicitar Rescate</a>
                        </div>
                        <div class="icon-container-2 col-1" style="width: 5%;">

                            <a class="navbar-brand" href="login.html">Iniciar Sesión</a>
                            <a class="navbar-brand" href="CerrarSesion.jsp">Cerrar Sesion


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
        <div class="form-container container border border-info-subtle border-5 rounded-5" style="font-size:35px">
            <form action="rescate.jsp" class="row g-3" method="post">
                <div class="form1 container">
                    <br>
                    <div class="col-12">
                        <label for="inputAddress2" class="form-label">Número de Documento</label>
                        <input type="text" class="form-control" name="txtdoc" placeholder="Ej.12354879"   style="font-size:30px">
                    </div>
                    <div class="col-md-12">
                        <label for="inputPassword4" class="form-label">Apellidos</label>
                        <input type="text" class="form-control" name="txtape" placeholder="Apellidos paterno y materno" style="font-size:30px">
                    </div>
                    <div class="col-md-12">
                        <label for="inputEmail4" class="form-label">Nombres</label>
                        <input type="text" class="form-control" name="txtnom" placeholder="Nombres Completos" style="font-size:30px">
                    </div>
                    <div class="col-12">
                        <label for="inputAddress" class="form-label">Edad Aproximado del Animal</label>
                        <input type="text" class="form-control" name="txtedad" placeholder="Ej. 28" style="font-size:30px">
                    </div>
                    <div class="col-12">
                        <label for="inputAddress" class="form-label">Estado del Animal a Rescatar</label>
                        <input type="text" class="form-control" name="txtestado" placeholder="Ej. Muy Mal" style="font-size:30px">
                    </div>

                    <div class="col-12">
                        <label for="inputAddress" class="form-label">Animal</label>
                        <input type="text" class="form-control" name="txtanimal" placeholder="Ej. Perro" style="font-size:30px">
                    </div>


                    <div class="col-12">
                        <label for="inputAddress2" class="form-label">Celular</label>
                        <input type="text" class="form-control" name="txtcel" placeholder="Ej. +51 546546874" style="font-size:30px">
                    </div>
                    <div class="col-12">
                        <label for="inputCity" class="form-label">Dirección</label>
                        <input type="text" class="form-control" name="txtdir" placeholder="Ej. Mz F Lote Lurigancho Chosica" style="font-size:30px">
                    </div>

                    <div class="col-12">
                        <label for="inputCity" class="form-label">Correo Electronico</label>
                        <input type="text" class="form-control" name="txtcorr" placeholder="asdahdkj@gmail.com" style="font-size:30px">
                    </div>
                </div>

                <br>

                <br>
                <p><input type="submit" name="btnRegistrar" class="btn btn-primary" style="font-size:35px" value="Solicitar Rescate"></p>
        </div>


    </form>

</div>


<%
    //Evaluar si el usuario presiono clic en el boton
    if (request.getParameter("btnRegistrar") != null) {
        try {//Guardar los datos en  la base de datos
            //2. Conexion a base de datos
            Connection conexion = ConexionMysql.retornaConexion();
            //3. Preparar la instruccion SQL  ---->  Motor de BD
            PreparedStatement pst = conexion.prepareStatement("insert into solicitar_rescate values(null,?,?,?,?,?,?,?,?,?)");
            //3.1. //Establecer los valores en los parametros "?"
            pst.setInt(1, Integer.parseInt(request.getParameter("txtdoc")));
            pst.setString(2, request.getParameter("txtape"));
            pst.setString(3, request.getParameter("txtnom"));
            pst.setInt(4, Integer.parseInt(request.getParameter("txtedad")));
            pst.setString(5, request.getParameter("txtestado"));
            pst.setString(6, request.getParameter("txtanimal"));
            pst.setInt(7, Integer.parseInt(request.getParameter("txtcel")));
            pst.setString(8, request.getParameter("txtdir"));
            pst.setString(9, request.getParameter("txtcorr"));
            //4. Ejecutar en la base de datos
            pst.executeUpdate();
            //5. Liberar los recursos
            conexion.close();
            //6. Abrir la pagina 
            response.sendRedirect("rescate.jsp");
        } catch (Exception e) {
            out.print(e);
        }
    }
%> 



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
