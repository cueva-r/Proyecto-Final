<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page session="true"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
          HttpSession objeto = request.getSession();
          objeto.invalidate();
          response.sendRedirect("index.html");
        %>
        
        <h2>Sesión cerrada!</h2>
    </body>
</html>
