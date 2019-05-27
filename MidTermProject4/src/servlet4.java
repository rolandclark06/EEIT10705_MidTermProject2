
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class servlet4
 */
@WebServlet("/webapp/servlet4.do")
public class servlet4 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String bankbranchcodeS=request.getParameter("bankbranchcode");
		
		request.setCharacterEncoding("UTF-8");
		
		String bankwebsite=request.getParameter("bankwebsite");
		bankdao dao = null;
		try {
			dao = new bankdao();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Map<String, String> errorMessage = new HashMap<>();
		request.setAttribute("ErrorMsg", errorMessage);
		if(bankbranchcodeS==null||bankbranchcodeS.trim().length()==0) {
			errorMessage.put("bankbranchcode", "分行代碼必須輸入");
		}
		else if(!bankbranchcodeS.matches("[0-9]+")) {
			errorMessage.put("bankheadcode", "請輸入數字");
		}
		if (!errorMessage.isEmpty()) {
			RequestDispatcher rd = request.getRequestDispatcher("/webapp/SystemUpdate1.jsp");
			rd.forward(request, response);
			return;
		}
		int bankbranchcode = Integer.parseInt(bankbranchcodeS);
		bankbean bean=new bankbean();
		bean.setBankbranchcode(bankbranchcode);
		bean.setBankwebsite(bankwebsite);
		try {

			int i=dao.updateOneData(bean);
			request.setAttribute("updateNum", i);
			
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher("/webapp/SystemUpdate1.jsp");
		rd.forward(request, response);
		return;
	}

}
