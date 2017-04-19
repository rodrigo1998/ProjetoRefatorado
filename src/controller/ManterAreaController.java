package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Area;
import service.AreaService;

/**
 * Servlet implementation class ManterAreaController
 */
@WebServlet("/ManterArea.do")
public class ManterAreaController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    
    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pNome = request.getParameter("nome");
        
        //instanciar o javabean
        Area area = new Area();
        area.setNome(pNome);

        
        //instanciar o service
        AreaService cs = new AreaService();
        cs.criar(area);
        cs.carregar(area.getId());
        
        //enviar para o jsp
        request.setAttribute("area", area);
        
        RequestDispatcher view = 
        request.getRequestDispatcher("Area.jsp");
        view.forward(request, response);
        
    }
    
}