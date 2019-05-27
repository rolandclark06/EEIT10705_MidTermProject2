
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/webapp/servlet.do")
public class servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		bankdao dao = null;
		try {
			dao = new bankdao();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
//		try {
//			dao.getConnection();
//		} catch (SQLException e1) {
//			// TODO Auto-generated catch block
//			e1.printStackTrace();
//		}
		Map<String, String> errorMessage = new HashMap<>();
		request.setAttribute("ErrorMsg", errorMessage);

		request.setCharacterEncoding("UTF-8");
		String Sbankbranchcode = request.getParameter("bankbranchcode");
		if (Sbankbranchcode == null || Sbankbranchcode.trim().length() == 0) {
			errorMessage.put("id", "銀行代碼必須輸入");
		}
		Pattern pattern = Pattern.compile("^[-\\+]?[\\d]*$");
		if (!pattern.matcher(Sbankbranchcode).matches()) {
			errorMessage.put("id", "銀行代碼請輸入數字");
		}
		if (!errorMessage.isEmpty()) {
			RequestDispatcher rd = request.getRequestDispatcher("/webapp/SystemSelect1.jsp");
			rd.forward(request, response);
			return;
		}

		int bankbranchcode = Integer.parseInt(Sbankbranchcode);

		try {
			bankbean bean = dao.selectOneData(bankbranchcode);
			request.setAttribute("aBean", bean);
		} catch (SQLException e) {
			if (e.getMessage().indexOf("無效") != -1) {
				errorMessage.put("id", "資料格式錯誤");
			}else if(e.getMessage().indexOf("沒有資料列") != -1) {
				errorMessage.put("id2", "無此代碼");
			}else {
				errorMessage.put("exception", "資料庫存取錯誤:" + e.getMessage());
			}
			RequestDispatcher rd = request.getRequestDispatcher("/webapp/SystemSelect1.jsp");
			rd.forward(request, response);
			return;
		}
		RequestDispatcher rd = request.getRequestDispatcher("/webapp/SystemSelect1.jsp");
		rd.forward(request, response);
		return;

	}

}
