

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

@WebServlet("/webapp/servlet3.do")
public class servlet3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String bankbranchcodeS=request.getParameter("bankbranchcode");
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
			RequestDispatcher rd = request.getRequestDispatcher("/webapp/SystemDelete1.jsp");
			rd.forward(request, response);
			return;
		}
		int bankbranchcode = Integer.parseInt(request.getParameter("bankbranchcode"));
		try {

			int i=dao.deleteOneData(bankbranchcode);
			request.setAttribute("deleteNum", i);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher("/webapp/SystemDelete1.jsp");
		rd.forward(request, response);
		return;

	
	
	}

}
