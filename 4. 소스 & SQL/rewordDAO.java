package movie;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import oracle.net.aso.s;

public class rewordDAO {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public Connection getConnection() {
		String Driver = "oracle.jdbc.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "admin";
		String pass = "1234";

		try {
			Class.forName(Driver);
			conn = DriverManager.getConnection(url, id, pass);
			System.out.println("데이터베이스 연동에 성공하였습니다.");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("데이터베이스 연동에 실패하였습니다.");
		}
		return conn;
	}
	
	/* 평점 평균 구하기 */
	public rewordBean getGrade_avg(String mno) {
		
		rewordBean rBean = new rewordBean();
		
		try {
			getConnection();

			String sql = "select round(avg(grade), 1) from reword where mno = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mno);
			rs = pstmt.executeQuery();

			if (rs.next()) {

				rBean.setGrade_avg(rs.getDouble(1));

			}
			if (conn != null) {
				conn.commit();
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rBean;
	}
		
	/* mno(영화번호)에 대한 rno(댓글목록) 구하기 */
	
	public Vector<rewordBean> rewordSelectEach(String mno) {
		
		Vector<rewordBean> rVector = new Vector<>();
		
		try {
			getConnection();
			
			String sql = "select distinct id, grade, writing from reword  where mno = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mno);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				rewordBean rBean = new rewordBean();

				rBean.setId(rs.getString(1));
				rBean.setGrade(rs.getDouble(2));
				rBean.setWriting(rs.getString(3));

				rVector.add(rBean);
			}
			if (conn != null) {
				conn.commit();
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rVector;
	}
	
	/* 댓글 삽입 */
	public void rewordinsert(String id,String mno,String title, double grade,String writing) {
		
		try {
				getConnection();
				
			String sql = "INSERT INTO reword (numnum, id, mno, title, grade, writing)\r\n"
					+ "SELECT (SELECT NVL(MAX(numnum),0)+1 FROM reword)\r\n"
					+ ", ?\r\n"
					+ ", ?\r\n"
					+ ", ?\r\n"
					+ ", ?\r\n"
					+ ", ?  \r\n"
					+ "  FROM reword\r\n"
					+ " WHERE NOT EXISTS (SELECT id\r\n"
					+ "                     FROM reword\r\n"
					+ "                     where id = ?\r\n"
					+ "                      and mno = ?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, mno);
			pstmt.setString(3, title);
			pstmt.setDouble(4, grade);
			pstmt.setString(5, writing);
			pstmt.setString(6, id);
			pstmt.setString(7, mno);
			/*
			 * pstmt.setString(1, rBean.getId()); pstmt.setString(2, rBean.getMno());
			 * pstmt.setString(3, rBean.getTitle()); pstmt.setDouble(4, rBean.getGrade());
			 * pstmt.setString(5, rBean.getWriting()); pstmt.setString(6, rBean.getId());
			 * pstmt.setString(7, rBean.getMno());
			 */
			
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//
	public Vector<rewordBean> allselectreword() {

		getConnection();

		Vector<rewordBean> rVec = new Vector<>();

		try {
			String sql = "select * from reword";

			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				rewordBean rBean = new rewordBean();

				rBean.setNumnum(rs.getInt(1));
				rBean.setId(rs.getString(2));
				rBean.setMno(rs.getString(3));
				rBean.setTitle(rs.getString(4));
				rBean.setGrade(rs.getInt(5));
				rBean.setWriting(rs.getString(6));

				rVec.add(rBean);
			}
			if (conn != null) {
				conn.commit();
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rVec;
	}

	

	// 수정용 반환 댓글 메소드 호출
	public rewordBean OneSelectreword(int numnum) {

		rewordBean rBean = new rewordBean();

		try {
			getConnection();

			String sql = "select * from reword where numnum = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, numnum);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				
				rBean.setNumnum(rs.getInt(1));
				rBean.setId(rs.getString(2));
				rBean.setMno(rs.getString(3));
				rBean.setTitle(rs.getString(4));
				rBean.setGrade(rs.getInt(5));
				rBean.setWriting(rs.getString(6));

			}
			if (conn != null) {
				conn.commit();
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rBean;
	}



	//
	public void rewordUpdate(rewordBean rBean) {

		
		try {
			getConnection();
			
			
			String sql = "update reword set grade = ?, writing = ? where numnum = ?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setDouble(1, rBean.getGrade());
			pstmt.setString(2, rBean.getWriting());
			pstmt.setInt(3, rBean.getNumnum());

			pstmt.executeUpdate();

			if (conn != null) {
				conn.commit();
				conn.close();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// 삭제 메소드 호출
	public void reworddelete(int numnum) {

		try {
			getConnection();

			String sql = "delete from reword where numnum = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, numnum);
			pstmt.executeUpdate();

			if (conn != null) {
				conn.commit();
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();

		}
	}

	
		
		//
		
		// Mno에 해당하는 id 호출 메소드
		public rewordBean findId(String mno) {
			
			rewordBean rBean = new rewordBean();
			
			try {
				getConnection();
					
				String sql = "select id from reword where mno = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mno);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					
					rBean.setId(rs.getString(1));
					
				}
				if (conn != null) {
					conn.commit();
					conn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return rBean;
		}
		
		
		public rewordBean findnumnum(String mno, String id) {
			
			rewordBean rBean = new rewordBean();
			
			try {
				getConnection();
				
				String sql = "select numnum from reword where mno = ? and id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mno);
				pstmt.setString(2, id);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					
					rBean.setNumnum(rs.getInt(1));
					
				}
				if (conn != null) {
					conn.commit();
					conn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return rBean;
		}
}
