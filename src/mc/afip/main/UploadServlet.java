package mc.afip.main;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.log4j.Logger;


@WebServlet("/upload")
@MultipartConfig( 	fileSizeThreshold = 1024 * 1024, 
maxFileSize = 1024 * 1024 * 5,
maxRequestSize = 1024 * 1024 * 5 * 5 )

public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = Logger.getLogger("Upload Servlet");

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	public static final String IMAGES_FOLDER = "/assets/photos";    
	public String uploadPath;

	@Override
	public void init() throws ServletException {
		logger.info("init..");

		uploadPath = getServletContext().getRealPath( IMAGES_FOLDER );
		logger.info("init..uploadPath = "+uploadPath);

		File uploadDir = new File( uploadPath );
		logger.info("init..uploadDir = "+uploadDir.getAbsolutePath());

		if (!uploadDir.exists()) uploadDir.mkdir();
	}
	private String getFileName( Part part ) {
		String fileName="";
		String param_value;
		
		String[] tokens = part.getHeader("content-disposition" ).split( ";" ) ;

		logger.info("========================================");
		logger.info("tokens  : "+part.getHeader("content-disposition" ));
		for (String token : tokens) {
			logger.info("token  : "+token);

			if (token.trim().startsWith("filename")) {
				fileName = token.substring(token.indexOf("=") + 2, token.length()-1);
				
				File uploadedFile = new File(fileName);
				fileName = uploadedFile.getName();
				
			}

		}	
		return fileName;
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/**
		 * Upload file
		 */
		logger.info("**********************************************");
		String fileName="";
		try {
			for ( Part part : request.getParts() ) {

				fileName = getFileName( part );		
				if(!"".equals(fileName)) {
					String fullPath = uploadPath + File.separator + fileName;
					part.write( fullPath );

					logger.info("========================================");
					logger.info("file  '"+fullPath+"' uploaded with success!");
					logger.info("========================================");
				}
			}

			request.getSession().setAttribute("img", fileName);
			response.sendRedirect(request.getContextPath()+"/");

		} catch (Exception e) {
			logger.info("Upload file ==> Error : "+e);				
			e.printStackTrace();
		}
		logger.info("**********************************************");
	}

}
