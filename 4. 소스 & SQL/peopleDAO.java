package movie;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class peopleDAO {

	private static peopleDAO instance = new peopleDAO();
	
	//DB 연결 - getInstance
	public static peopleDAO getInstance() {
		return instance;
	}
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs  = null;

	
	//DB 연결 - getInstance
	public Connection getConnection() {
		String Driver = "oracle.jdbc.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "admin";
		String pass = "1234";
		
		try {
			Class.forName(Driver);
			 conn = DriverManager.getConnection(url, id, pass);
			System.out.println("데이터베이스 연동에 성공하였습니다.");
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("데이터베이스 연동에 실패하였습니다.");
		}		
		return conn;		
	}
	
	//로그인
	public int userCheck(String id, String pw)throws Exception {
		String dbpw="";
		int x=-1;
		try {
			getConnection();
			String sql = "select pw from people where id = ?";
			/* conn = getConnection(); */
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs= pstmt.executeQuery();//select일 때만 실행하고, 나머지는 updateQuery를 쓴다.
		if(rs.next()){
					dbpw= rs.getString("pw");
					if(dbpw.equals(pw)) {
						x= 1; //인증 성공
System.out.println("로그인성공");
					}else {
						x= 0; //비밀번호 틀림
System.out.println("비밀번호 오류");
					}
			}else {
					x= -1;//해당 아이디 없음
System.out.println("아이디가없음");
			}
				} catch(Exception ex) {
					ex.printStackTrace();
				} finally {
			if (rs != null)
				try { rs.close(); 
				} catch(SQLException ex) {
				}if (pstmt != null) 
					try { pstmt.close(); 
					} catch(SQLException ex) {
						
			}if (conn != null) 
				try { conn.close(); 
				} catch(SQLException ex) {
					
				}
			}
		return x;//1
	}
	
	//insert people table
	//회원가입 구현
	public void insertpeople(peopleBean pBean) {
		
		try {
				getConnection();
				
			String sql = "insert into people values(?,?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, pBean.getId());
			pstmt.setString(2, pBean.getPw());
			pstmt.setString(3, pBean.getName());
			pstmt.setString(4, pBean.getGender());
			pstmt.setString(5, pBean.getAge());
			pstmt.setString(6, pBean.getGenre());
			
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//모든 회원 정보를 반환해주는 메소드 호출
      public Vector<peopleBean> allselectmember() throws SQLException{
		
		Vector<peopleBean> v = new Vector<peopleBean>();
		
		String sql = "select * from people";
		try {
			
				getConnection();
				
			pstmt = conn.prepareStatement(sql);
				
			rs = pstmt.executeQuery();
		
		while(rs.next()) {
			peopleBean pBean = new peopleBean();
			
			pBean.setId(rs.getString(1));
			pBean.setPw(rs.getString(2));
			pBean.setName(rs.getString(3));
			pBean.setGender(rs.getString(4));
			pBean.setAge(rs.getString(5));
			pBean.setGenre(rs.getString(6));
			
			v.add(pBean);
			
		}		
		conn.close();
	}catch (SQLException e) {
		e.printStackTrace();
	}
		return v;
	}
		
	//해당 id에 내용을 반환해 주는 메소드 호출
	public peopleBean oneselectmember(String id){
		
	    peopleBean pBean = new peopleBean();
				
		try {
				getConnection();
				
			String sql = "select * from people where id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
		
			while(rs.next()) {
					
				pBean.setId(rs.getString(1));
				pBean.setPw(rs.getString(2));
				pBean.setName(rs.getString(3));
				pBean.setGender(rs.getString(4));
				pBean.setAge(rs.getString(5));
				pBean.setGenre(rs.getString(6));
						
		}		
		conn.close();
	}catch (SQLException e) {
		e.printStackTrace();
	}
		return pBean;
	}
	
	//id에 해당하는 비밀번호를 찾아서 반환하는 메소드 호출 	
	public String getPassword(String id){		
		String password = null;		
		
		try {
			getConnection();			
			
			String sql = "select pw from people where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				password = rs.getString(1);
			}
			if(conn != null) {
				conn.close();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return password;		
	}
	// 정보 수정 
	public void updatepeople(peopleBean pBean){
		
		try {
			getConnection();
			
			String sql = "update people set pw=?, genre=? where id=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, pBean.getPw());
			pstmt.setString(2, pBean.getGenre());
			pstmt.setString(3, pBean.getId());
			
			pstmt.executeUpdate();
			
			if(conn != null) {
				conn.commit();
				conn.close();
			}			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	//delete people table
		// 정보 삭제
public void deletepeople(String id){
		
		try {
			getConnection();
			
			String sql = "delete from people where id=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);			
			pstmt.executeUpdate();
			
			if(conn != null) {
				conn.commit();
				conn.close();
			}			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}