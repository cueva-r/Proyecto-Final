
<%@page import="classes.Producto"%>
<%@page import="controllers.ControladorProducto"%>
<%@page import="classes.Articulo"%>
<%@page import="java.util.ArrayList"%>
<%
    HttpSession sesion = request.getSession(true);
    ArrayList<Articulo> articulos = sesion.getAttribute("carrito") == null ? null : (ArrayList) sesion.getAttribute("carrito");
%>
<!DOCTYPE html>
<html lang="en">

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Cart | E-Shopper</title>
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
    <!--/head-->

    <link rel="stylesheet" href="css/estilosAdopcion.css">

    <body>
        <!-- Header -->

        <div class="container-fluid mt-3 header-logo" style="background-color: rgb(193, 223, 240)">
            <div class="logo col-12">
                <a href="login.html">
                    <img src="imagenes/Logo2.png" alt="">
                </a>
            </div>
        </div>
        <!-- Header -->  
        <br>
        <section id="cart_items">
            <div class="container">

                <section id="cart_items">


                    <div class="table-responsive cart_info" id="cart-container" >
                        <table class="table table-condensed" id="shop-table">
                            <thead >
                                <tr class="cart_menu" >
                                    <td class="image">Producto</td>
                                    <td class="description"></td>
                                    <td class="price">Precio</td>
                                    <td class="quantity">Unid</td>
                                    <td class="total">Total</td>
                                    <td></td>
                                </tr>
                            </thead>
                            <tbody>


                                <%
                                    ControladorProducto cp = new ControladorProducto();
                                    double total = 0;
                                    if (articulos != null) {
                                        for (Articulo a : articulos) {
                                            Producto producto = cp.getProducto(a.getIdProducto());
                                            total += a.getCantidad() * producto.getPrecio();


                                %>

                                <tr>
                                    <td class="cart_product">
                                        <a href=""><img src="<%= producto.getImg()%>" alt="" width="120"></a>
                                    </td>
                                    <td class="cart_description">
                                        <h4><a href=""><%= producto.getNombre()%></a></h4>
                                        <p>Web ID: <%= producto.getId()%></p>
                                    </td>
                                    <td class="cart_price">
                                        <p>S/.<%= producto.getPrecio()%></p>
                                    </td>
                                    <td >
                                        <div>
                                            <a class="cart_quantity_input"><%= a.getCantidad()%></a>

                                        </div>
                                    </td>
                                    <td class="cart_total">
                                        <p class="cart_total_price">S/.<%= Math.round(producto.getPrecio() * a.getCantidad() * 100.0) / 100.0%></p>
                                    </td>
                                    <td class="cart_delete">
                                        <span id="idarticulo" style="display:none;"><%= producto.getId()%></span>
                                        <a class="cart_quantity_delete" href="" id="deleteitem"><i class="fa fa-times"></i></a>
                                    </td>
                                </tr>

                                <%}
                                    }%>

                            </tbody>
                        </table>
                        <% if (articulos == null) {%>
                        <h4>No hay Articulos en el carro</h4>
                        <%}%>
                    </div> 
                    <p style="text-align: center;">
                        <a href="javascript:window.history.go(-2);" class="btn btn-primary btn-lg btn-block">Seguir Comprando</a>
                    </p>    
            </div>
        </section> <!--/#cart_items-->

        <section id="do_action">
            <div class="container">
                <div class="heading">
                    <h3>Resumen de la compra</h3>
                </div>

                <div class="col-sm-12">
                    <div class="total_area">
                        <ul>
                            <li>Sub Total <span id="txt-subtotal">S/.<%= Math.round(total * 100.0) / 100.0%></span></li>
                            <li>IGV(18%)<span>Incluido</span></li>
                            <li>Descuento<span>0.00</span></li>
                            <li>Total <span id="txt-total">S/.<%= Math.round(total * 100.0) / 100.0%></span></li>
                        </ul>
                        <p style="text-align: center;">
                            <a class="btn btn-default update" href="shop.jsp">CANCELAR</a>
                            <a class="btn btn-default update" href="CompraExitosa.jsp">COMPRAR</a>
                        </p>

                    </div>
                </div>


            </div>
        </section><!--/#do_action-->




        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/main.js"></script>
        <script src="js/carrito.js"></script>
    </body>
</html>