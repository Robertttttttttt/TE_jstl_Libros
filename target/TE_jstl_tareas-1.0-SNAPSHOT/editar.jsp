
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<!DOCTYPE html> 
<html> 
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">         <title>JSP Page</title> 
    </head> 
    <body> 
        <h1 style="color:red;"> 
            <c:if test="${requestScope.op=='nuevo'}" var="res" scope="request"> 
                Registrooo de 
            </c:if> 
            <c:if test="${requestScope.op=='modificar'}" var="res" scope="request"> 
                Modificar 
            </c:if> 
            Libro
        </h1> 
        <jsp:useBean id="miTarea" scope="request" class="com.emergentes.modelo.Libro"/> 
        <form action="Controller" method="post"> 
            <table> 
                <tr> 
                    <td style="color:blue" > ID: </td> 
                    <td><input type="text" name="id" value="<jsp:getProperty name="miTarea" property="id"/>"></td> 
                </tr> 
                <tr> 
                    <td style="color:blue">TITULO: </td> 
                    <td><input type="text" name="titulo" value="<jsp:getProperty name="miTarea" property="titulo"/>"></td> 
                </tr> 

                <tr> 
                    <td style="color:blue" >AUTOR: </td> 
                    <td><input type="text" name="autor" value="<jsp:getProperty name="miTarea" property="autor"/>"></td> 
                </tr> 
                <tr> 
                    <td style="color:blue">RESUMEN: </td> 
                    <td><textarea name="resumen" rows=4 cols=17 value="<jsp:getProperty name="miTarea" property="resumen"/>"></textarea></td> 
                </tr> 
        
                

                <tr> 
                    <td style="color:blue">MEDIO: </td> 

                    <td style="color:blueviolet" >  
                <input type="radio" name="medio"  value="fisico" <c:if test="${miTarea.medio=='Fisico'}">
                       </c:if> >fisico
                
                <input type="radio" name="medio"  value="magnetico" <c:if test="${miTarea.medio=='Magnetico'}">
                       </c:if> >Magnetico
                </td> 

                </tr> 
                <tr> 
                    <td> 
                        <input type="hidden" name="opg" value="${requestScope.op}"/> 
                        <input type="hidden" name="op" value="grabar"> 
                    </td> 
                    <td style="color:forestgreen" ><input type="submit" value="Enviar"></td> 
                </tr> 
            </table>     
        </form> 
    </body> 
</html> 
