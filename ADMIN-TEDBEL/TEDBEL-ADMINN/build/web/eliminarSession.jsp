<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page session="true"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">

        <title>Saliste de sesión</title>
    </head>
    <body style="background-color: black;">
        <%
          HttpSession objeto = request.getSession();
          objeto.invalidate();
        %>

        <div class="container text-center">
            <div class="col-md-auto">

                <h1 class="text-white" style="font-size: 50px; margin-top: 200px;">TU SESIÓN HA SIDO CERRADA</h1>
                <br>
                <br>
                <p style="text-align: center;">
                    <a href="index.html" class="btn btn-secondary btn-lg btn-block">Salir</a>
                </p>
            </div>
            </div>
        
    </body>
</html>  