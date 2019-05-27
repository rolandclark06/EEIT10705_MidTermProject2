import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class bankdao {
	private DataSource ds = null;
	private Connection conn = null;
	private String lookup = "java:comp/env/jdbc/MemberDB";
	private static final String GET_ONE_STMT = "SELECT * FROM financial where [financial_bankbranchcode] = ? ";
	private static final String UPDATE_STMT = "UPDATE financial set [financial_bankwebsite]=? WHERE   [financial_bankbranchcode] = ? ; ";
	private static final String INSERT_STMT = "insert  into  financial  values (?,?,?,?,?,?,?,?,?);";
	private static final String DELETE_STMT = "DELETE FROM financial WHERE [financial_bankbranchcode] = ?;";

	public bankdao() throws SQLException {
		try {
			Context context = new InitialContext();
			ds = (DataSource) context.lookup(lookup);

		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	public bankdao(String dbString) throws SQLException {
		try {
			Context context = new InitialContext();
			ds = (DataSource) context.lookup(dbString);
			conn = ds.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}



	public bankbean selectOneData(int bankbranchcode) throws SQLException {

		try (	Connection conn = ds.getConnection(); 
				PreparedStatement pstmt = conn.prepareStatement(GET_ONE_STMT);
			) {

			pstmt.setInt(1, bankbranchcode);
			ResultSet rs = pstmt.executeQuery();
			bankbean bean = new bankbean();
			rs.next();
			bean.setBankclass(rs.getString("financial_bankclass"));
			bean.setBankheadcode(rs.getInt("financial_bankheadcode"));
			bean.setBankbranchcode(rs.getInt("financial_bankbranchcode"));
			bean.setDepartmentname(rs.getString("financial_departmentname"));
			bean.setDepartmentaddress(rs.getString("financial_departmentaddress"));
			bean.setDepartmentphonum(rs.getString("financial_departmentphonum"));
			bean.setDepartmentprincipal(rs.getString("financial_departmentprincipal"));
			bean.setChangedate(rs.getString("financial_changedate"));
			bean.setBankwebsite(rs.getString("financial_bankwebsite"));
			return bean;
		}

	}

	public int deleteOneData(int bankbranchcode) throws SQLException {
		int deleteCount = 0;
		try (	Connection conn = ds.getConnection(); 
				PreparedStatement pstmt = conn.prepareStatement(DELETE_STMT);
			){
			pstmt.setInt(1, bankbranchcode);
			deleteCount = pstmt.executeUpdate();
			return deleteCount;
		}
		
		
	}

	public int updateOneData(bankbean Fin) throws SQLException {
		int updateCount = 0;
		try (	Connection conn = ds.getConnection(); 
				PreparedStatement pstmt = conn.prepareStatement(UPDATE_STMT);
			) {
			pstmt.setString(1, Fin.getBankwebsite());
			pstmt.setInt(2, Fin.getBankbranchcode());
			updateCount = pstmt.executeUpdate();
			return updateCount;
		}

	}

	public int insertOneData(bankbean Fin) throws SQLException {
		int insertCount = 0;
		try (	Connection conn = ds.getConnection(); 
				PreparedStatement pstmt = conn.prepareStatement(INSERT_STMT);
			){
			pstmt.setString(1, Fin.getBankclass());
			pstmt.setInt(2, Fin.getBankheadcode());
			pstmt.setInt(3, Fin.getBankbranchcode());
			pstmt.setString(4, Fin.getDepartmentname());
			pstmt.setString(5, Fin.getDepartmentaddress());
			pstmt.setString(6, Fin.getDepartmentphonum());
			pstmt.setString(7, Fin.getDepartmentprincipal());
			pstmt.setString(8, Fin.getChangedate());
			pstmt.setString(9, Fin.getBankwebsite());
			insertCount = pstmt.executeUpdate();
			return insertCount;
		}
	}



	public bankbean select(String id) {
		bankbean result = null;
		try (Connection conn = ds.getConnection();
				PreparedStatement stmt = conn.prepareStatement(GET_ONE_STMT);
				ResultSet rset = stmt.executeQuery();) {
			while (rset.next()) {
				bankbean temp = new bankbean();
				temp.setBankclass(rset.getString("bankclass"));
				temp.setBankheadcode(rset.getInt("bankheadcode"));
				temp.setBankbranchcode(rset.getInt("bankbranchcode"));
				temp.setDepartmentname(rset.getString("departmentname"));
				temp.setDepartmentaddress(rset.getString("departmentaddress"));
				temp.setDepartmentphonum(rset.getString("departmentphonum"));
				temp.setDepartmentprincipal(rset.getString("departmentprincipal"));
				temp.setChangedate(rset.getString("getString"));
				temp.setBankwebsite(rset.getString("bankwebsite"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;

	}
}
