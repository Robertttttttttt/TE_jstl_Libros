<%@page import="com.emergentes.modelo.GestorLibros"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<% 
  if (session.getAttribute("agenda")==null) {           
          GestorLibros objeto1 = new GestorLibros(); 
          session.setAttribute("agenda", objeto1); 
      } 
%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<!DOCTYPE html> 
<html> 
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <title>JSP Page</title> 
    </head> 
    <body> 
        <h1 style="color:blueviolet">LISTA DE LIBROS</h1> 
        <a href="Controller?op=nuevo">NUEVO</a> 
        <table border="1"> 
            <tr> 
                <th style="color:blue">ID</th> 
                <th style="color:blue">T&Iacute;TULO</th> 
                <th style="color:blue">AUTOR</th> 
                <th style="color:blue">RESUMEN</th> 
                <th style="color:blue" >MEDIO</th> 
                <th style="color:forestgreen"></th> 
                <th style="color:forestgreen"></th> 
            </tr> 
            <c:forEach var="item" items="${sessionScope.agenda.getLista()}"> 
            <tr> 
                <td>${item.id}</td> 
                <td>${item.titulo}</td> 
                <td>${item.autor}</td> 
                <td>${item.resumen}</td> 
                <td>${item.medio}</td> 
                <td style="color:forestgreen"><a href="Controller?op=modificar&id=${item.id}">Modificar</a></td> 
                <td style="color:forestgreen"><a href="Controller?op=eliminar&id=${item.id}">Eliminar</a></td> 
            </tr> 
            </c:forEach> 
        </table> 
    </body> 
</html> 
