package com.emergentes.controlador;

import com.emergentes.modelo.GestorLibros;
import com.emergentes.modelo.Libro;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Controller", urlPatterns = {"/Controller"})
public class Controller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Libro objTarea = new Libro();
        int id;
        int pos;
        String opcion = request.getParameter("op");
        String op = (opcion != null) ? request.getParameter("op") : "view";
        if (op.equals("nuevo")) {
            HttpSession sesion = request.getSession();
            GestorLibros agenda = (GestorLibros) sesion.getAttribute("agenda");
            objTarea.setId(agenda.obtieneId());
            request.setAttribute("op", op);
            request.setAttribute("miTarea", objTarea);
            request.getRequestDispatcher("editar.jsp").forward(request, response);
        }
        if (op.equals("modificar")) {
            id = Integer.parseInt(request.getParameter("id"));
            HttpSession sesion = request.getSession();
            GestorLibros agenda = (GestorLibros) sesion.getAttribute("agenda");
            pos = agenda.ubicarTarea(id);
            objTarea = agenda.getLista().get(pos);
            request.setAttribute("op", op);
            request.setAttribute("miTarea", objTarea);
            request.getRequestDispatcher("editar.jsp").forward(request, response);
        }
        if (op.equals("eliminar")) {
            id = Integer.parseInt(request.getParameter("id"));
            HttpSession sesion = request.getSession();
            GestorLibros agenda = (GestorLibros) sesion.getAttribute("agenda");
            pos = agenda.ubicarTarea(id);
            agenda.eliminarTarea(pos);
            sesion.setAttribute("agenda", agenda);
            response.sendRedirect("index.jsp");
        }
        if (op.equals("view")) {
            response.sendRedirect("index.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Libro objTarea = new Libro();
        int pos;
        String op = request.getParameter("op");
        if (op.equals("grabar")) {
            objTarea.setId(Integer.parseInt(request.getParameter("id")));
            objTarea.setTitulo(request.getParameter("titulo"));
            objTarea.setAutor(request.getParameter("autor"));
            objTarea.setResumen(request.getParameter("resumen"));
            objTarea.setMedio(request.getParameter("medio"));
            HttpSession sesion = request.getSession();
            GestorLibros agenda = (GestorLibros) sesion.getAttribute("agenda");
            String opg = request.getParameter("opg");
            if (opg.equals("nuevo")) {
                agenda.insertarTarea(objTarea);
            } else {
                pos = agenda.ubicarTarea(objTarea.getId());
                agenda.modificarTarea(pos, objTarea);
            }
            sesion.setAttribute("agenda", agenda);
            response.sendRedirect("index.jsp");
        }
    }
}
