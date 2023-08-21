<%@page import="controllers.ControladorProducto"%>
<%@page import="classes.Producto"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    Producto producto = new ControladorProducto().getProducto(id);
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Product Details | E-Shopper</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/prettyPhoto.css" rel="stylesheet">
        <link href="css/price-range.css" rel="stylesheet">
        <link href="css/animate.css" rel="stylesheet">
        <link href="css/main.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">
        <link rel="stylesheet" href="css/detalle.css">
        <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->       
        <link rel="shortcut icon" href="images/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">

    </head><!--/head-->

    <body>
        <div class="container-fluid mt-3 header-logo" style="background-color: rgb(193, 223, 240)">
            <div class="logo col-12">
                <a href="login.html">
                    <img src="imagenes/Logo2.png" alt="">
                </a>
            </div>
        </div>



        <section>
            <br><br><br><br><br>
            <div class="container-lg-6">




                <div class="col-sm-12 padding-right">
                    <div class="product-details"><!--product-details-->
                        <div class="col-sm-5">
                            <div class="view-product">
                                <img src="<%= producto.getImg()%>" alt="" />

                            </div>


                        </div>
                        <div class="col-sm-7">
                            <div class="product-information"><!--/product-information-->
                                <img src="imagenes/product-details/new.jpg" class="newarrival" alt="" />
                                <h2><%= producto.getNombre()%></h2>
                                <p>Web ID: <%= producto.getId()%></p>
                                <img src="imagenes/product-details/rating.png" alt="" />
                                <form action="agregarproducto" method="post">
                                    <span>
                                        <span>S/.<%= producto.getPrecio()%></span>
                                        <label>Cantidad:</label>
                                        <input type="hidden" value="<%= producto.getId()%>" name="idproducto">
                                        <input type="text" value="1" id="txt-cantidad" name="cantidad"/>
                                        <br><br><br>
                                        <button type="submit" class="btn btn-fefault cart">
                                            Añadir al carrito
                                        </button>
                                    </span>


                                </form>
                                <p><b>Disponibilidad:</b> En Stock</p>
                                <p><b>Condición:</b> Nuevo</p>
                                <p><b>Categoria:</b> Alimentos</p>
                                <a href=""><img src="imagenes/product-details/share.png" class="share img-responsive"  alt="" /></a>
                            </div><!--/product-information-->
                        </div>
                    </div><!--/product-details-->


                    <p style="text-align: center;">
                        <a href="shop.jsp" class="btn btn-primary btn-lg btn-block">Seguir Comprando</a>
                    </p>

                </div>

            </div>
        </section>




        <script src="js/jquery.js"></script>
        <script src="js/price-range.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>