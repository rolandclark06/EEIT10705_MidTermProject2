

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
 * Servlet implementation class servlet2
 */
@WebServlet("/webapp/servlet2.do")
public class servlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		bankdao dao = null;
		try {
			dao = new bankdao();
		} catch (SQLException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		Map<String, String> errorMessage = new HashMap<>();
		request.setAttribute("ErrorMsg", errorMessage);
		String bankheadcode=request.getParameter("bankheadcode");
		
		if(bankheadcode==null||bankheadcode.trim().length()==0) {
			errorMessage.put("bankheadcode", "總部代碼必須輸入");
		}
		else if(!bankheadcode.matches("[0-9]+")) {
			errorMessage.put("bankheadcode", "總部代碼請輸入數字");
		}
		String bankbranchcode=request.getParameter("bankbranchcode");
		if(bankbranchcode==null||bankbranchcode.trim().length()==0) {
			errorMessage.put("bankbranchcode", "分行代碼必須輸入");
		}
		else if(!bankbranchcode.matches("[0-9]+")) {
			errorMessage.put("bankheadcode", "分行代碼請輸入數字");
		}
		String departmentname=request.getParameter("departmentname");
		if(departmentname==null||departmentname.trim().length()==0) {
			errorMessage.put("departmentname", "部門名稱必須輸入");
		}
		else if(!departmentname.matches("[\\u4e00-\\u9fa5]+")) {
			errorMessage.put("departmentname", "部門名稱請輸入中文");
		}
		String departmentaddress=request.getParameter("departmentaddress");
		if(departmentaddress==null||departmentaddress.trim().length()==0) {
			errorMessage.put("departmentaddress", "部門地址必須輸入");
		}
		String departmentphonum=request.getParameter("departmentphonum");
		if(departmentphonum==null||departmentphonum.trim().length()==0) {
			errorMessage.put("departmentphonum", "部門電話必須輸入");
		}
		else if(!departmentphonum.matches("[0-9]+")) {
			errorMessage.put("departmentphonum", "部門電話請輸入數字");
		}
		String departmentprincipal=request.getParameter("departmentprincipal");
		if(departmentprincipal==null||departmentprincipal.trim().length()==0) {
			errorMessage.put("departmentprincipal", "負責人必須輸入");
		}
		String changedate=request.getParameter("changedate");
		if(changedate==null||changedate.trim().length()==0) {
			errorMessage.put("changedate", "修改日期必須輸入");
		}
		else if(!changedate.matches("([0-9]{4})[./]{1}([0-9]{1,2})[./]{1}([0-9]{1,2})")) {
			errorMessage.put("changedate", "修改日期請輸入正確格式");
		}
		if (!errorMessage.isEmpty()) {
			RequestDispatcher rd = request.getRequestDispatcher("/webapp/SystemInsert1.jsp");
			rd.forward(request, response);
			return;
		}
		
		bankbean bean=new bankbean();
		bean.setBankclass(request.getParameter("bankclass")+"銀行");
		bean.setBankheadcode(Integer.parseInt(request.getParameter("bankheadcode")));
		bean.setBankbranchcode(Integer.parseInt(request.getParameter("bankbranchcode")));
		bean.setDepartmentname(request.getParameter("departmentname"));
		bean.setDepartmentaddress(request.getParameter("departmentaddress"));
		bean.setDepartmentphonum(request.getParameter("departmentphonum"));
		bean.setDepartmentprincipal(request.getParameter("departmentprincipal"));
		bean.setBankwebsite(request.getParameter("bankwebsite"));
		try {
			int i=dao.insertOneData(bean);
			request.setAttribute("insertNum", i);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher("/webapp/SystemInsert1.jsp");
		rd.forward(request, response);
		return;
	}

}
