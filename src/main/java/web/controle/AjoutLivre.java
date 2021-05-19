package web.controle;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.LivreManager;
import com.model.Categorie;

/**
 * Servlet implementation class AjoutLivre
 */
@WebServlet("/AjoutLivre")
public class AjoutLivre extends HttpServlet {
	private static final long serialVersionUID = 1L;
     LivreManager lm;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjoutLivre() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		lm = new LivreManager();
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String titre = request.getParameter("titre");
		String auteur = request.getParameter("auteur");
		String categorie = request.getParameter("categorie");
		if(categorie.equals("others")) {
			categorie = request.getParameter("othercategorie");
			lm.addCategorie(categorie);
		}
		Categorie c = lm.findcategorieByName(categorie);
		lm.addLivre(titre, auteur, c);
		response.sendRedirect("listerlivres.jsp?categorie="+categorie);
	}

}
