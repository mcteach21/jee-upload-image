package mc.afip.main;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

@WebServlet("/main")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger("Main Servlet");

	private static final String VIEW_DIR ="views/";
	private static final String VIEW_SUFFIX =".jsp";

	private static final String DEFAULT_VIEW = "index"+VIEW_SUFFIX;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String page = request.getParameter("page"); 	
		request.setAttribute("page", page);
		String view_name = (page==null)?DEFAULT_VIEW:VIEW_DIR+page.toLowerCase()+VIEW_SUFFIX;	

		if(view_exists(view_name)) {
			getViewModel(request, page);
			display(request, response, view_name);
		}else {
			display(request, response, VIEW_DIR+"404"+VIEW_SUFFIX);
		}	
	}
	
	public static final String IMAGES_FOLDER = "/assets/photos"; 
	public String uploadPath;
	
	private List<String> readFiles() {
		List<String> images = new ArrayList<String>();
		
		uploadPath = getServletContext().getRealPath( IMAGES_FOLDER );
		File uploadDir = new File( uploadPath );
		
		File[] listOfFiles = uploadDir.listFiles();
		for (File file : listOfFiles) {
		    if (file.isFile()) {
		    	images.add(file.getName());
		    	System.out.println(file.getName());
		    }
		}	
		return images;
	}
	
	private void getViewModel(HttpServletRequest request,  String page) {
		if(page==null)
			return;
		if(page.equals("gallery")) {
			List<String> images = readFiles();			
			request.setAttribute("images", images);
		}
	}
	private boolean view_exists(String view_name) {
		String view_fullpath = getServletContext().getRealPath(view_name);	
		try {			
			File view_file = new File(view_fullpath);
			return view_file.exists();		 
		} catch (Exception e) {}
		return false;
	}

	private void display(HttpServletRequest request, HttpServletResponse response, String view_name) {
		RequestDispatcher dispatcher = request.getRequestDispatcher(view_name); 
		try {
			dispatcher.forward(request, response);
		} catch (ServletException | IOException e) {
			logger.error("MainServlet - Error : "+e);
		} 	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		request.setAttribute("action", action);

		if(action==null) {
			//VIEW_DIR+"welcome"+VIEW_SUFFIX
			display(request, response, "index.jsp");
			return;
		}
	}
	
}
