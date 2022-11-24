package movie;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
public class movieLikeDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	// DB연결
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
	
	
	


//회원의 찜목록을 반환해주는 메소드 호출
public Vector<movieBean> allselectlike(String id)throws SQLException{
	
	Vector<movieBean> vec = new Vector<movieBean>();
	
	String sql = "SELECT DISTINCT movie.title, movie.genre, movie.love, movie.mno,"
			+ " movie.poster FROM movie join movieLike on movie.mno = movieLike.mno join people on movieLike.id"
			+ " = people.id where movieLike.id = ?";
	
	
	try {
		
			getConnection();
			
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
	
	while(rs.next()) {
		
		movieBean mBean = new movieBean();
		
		mBean.setTitle(rs.getString(1));
		mBean.setGenre(rs.getString(2));
		mBean.setLove(rs.getDouble(3));
		mBean.setMno(rs.getString(4));
		mBean.setPoster(rs.getString(5));
		
		vec.add(mBean);
		
	}
/*	if (conn != null) {
		conn.commit();*/
		conn.close();
		/* } */
	/* conn.close(); */
}catch (SQLException e) {
	e.printStackTrace();
}
	return vec;
}
// 찜하기
public void insertmovieLike(String id, String mno) {


   try {
      
      getConnection();
      
      String sql = "insert into movieLike values(?,?)";
      
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, id);
      pstmt.setString(2, mno);
      
      
      /*
       * pstmt.setString(1, moBean.getID()); pstmt.setString(2, moBean.getMNO());
       */

      pstmt.executeUpdate();
   } catch (Exception e) {
      e.printStackTrace();
   }
}

// 찜 삭제
public void deletemovieLike(String mno, String id) {

   try {
      getConnection();

      String sql = "delete from movieLike where mno=? and id = ?";
      pstmt = conn.prepareStatement(sql);

      pstmt.setString(1, mno);
      pstmt.setString(2, id);
      pstmt.executeUpdate();

      if (conn != null) {
         conn.commit();
         conn.close();
      }
   } catch (Exception e) {
      e.printStackTrace();
   }
}



};
