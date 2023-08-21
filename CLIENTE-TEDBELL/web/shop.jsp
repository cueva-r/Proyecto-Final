<%@page import="controllers.ControladorProducto"%>
<%
    ControladorProducto cp = new ControladorProducto();
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Shop | E-Shopper</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/prettyPhoto.css" rel="stylesheet">
        <link href="css/price-range.css" rel="stylesheet">
        <link href="css/animate.css" rel="stylesheet">
        <link href="css/main.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">
        <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->       
        <link rel="shortcut icon" href="images/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">



        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Mouse+Memoirs&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/estilosAdopcion.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>

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
                            <a class="nav-link" href="rescate.jsp">Solicitar Rescate</a>
                        </div>

                    </div>
                </div>
            </div>
        </nav>
        <!-- Header -->  












        <section>






            <div class="col-sm-12 padding-right">


                <%= cp.getProductos()%>						

            </div>


        </section>










        <!-- Footer -->
        <footer class="text-center text-lg-start bg-light text-muted">
            <hr>
            <section class="">
                <div class="container text-center text-md-start mt-5">
                    <div class="row mt-3">
                        <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4 logo-footer">
                            <a href="login.html">
                                <img src="imagenes/logo.jpg" alt="">
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
                                <a href="artigiano.html" class="text-reset">Servicios</a>
                            </p>
                            <p>
                                <a href="#!" class="text-reset">Articulos</a>
                            </p>
                            <p>
                                <a href="#!" class="text-reset">Adopcion de Mascotas</a>
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
                                LaboratorioPeru@zegelipae.com
                            </p>
                            <p><i class="fas fa-phone me-3"></i> 989-249-799</p>
                            <p><i class="fas fa-print me-3"></i> 902-374-687</p>
                        </div>
                    </div>
                </div>
            </section>
            <div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.05);">
                © 2022 Copyright:
                <a class="text-reset fw-bold" href="https://www.zegelipae.edu.pe/">Laboratorio</a>
            </div>

        </footer>
        <!-- Footer -->





        <script src="js/jquery.js"></script>
        <script src="js/price-range.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
