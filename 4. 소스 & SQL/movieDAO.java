package movie;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class movieDAO {

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
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("데이터베이스 연동에 실패하였습니다.");
		}
		return conn;
	}
	
	//게시판 전체보기
		public movieBean oneselectMovie(String mno) {

			getConnection();

			movieBean mbean1 = new movieBean();

			try {
				String sql = "select * from movie where mno=?";

				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mno);
				rs = pstmt.executeQuery();

				while (rs.next()) {

					mbean1.setMno(rs.getString(1));
					mbean1.setTitle(rs.getString(2));
					mbean1.setGenre(rs.getString(3));
					mbean1.setCountry(rs.getString(4));
					mbean1.setRuntime(rs.getString(5));
					mbean1.setAge(rs.getString(6));
					mbean1.setOpendate(rs.getString(7));
					mbean1.setDirector(rs.getString(8));
					mbean1.setActor(rs.getString(9));
					mbean1.setStory(rs.getString(10));
					mbean1.setPoster(rs.getString(11));
					mbean1.setLove(rs.getInt(12));

				}
				if (conn != null) {
					conn.commit();
					conn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return mbean1;
		}
		//게시판 전체보기
		public Vector<movieBean> allselectMovie() {
			
			getConnection();
			
			Vector<movieBean> vec = new Vector<>();
			
			try {
				String sql = "select * from movie order by mno";
				
				pstmt = conn.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					movieBean bean = new movieBean();
					
					bean.setMno(rs.getString(1));
					bean.setTitle(rs.getString(2));
					bean.setGenre(rs.getString(3));
					bean.setCountry(rs.getString(4));
					bean.setRuntime(rs.getString(5));
					bean.setAge(rs.getString(6));
					bean.setOpendate(rs.getString(7));
					bean.setDirector(rs.getString(8));
					bean.setActor(rs.getString(9));
					bean.setStory(rs.getString(10));
					bean.setPoster(rs.getString(11));
					bean.setLove(rs.getInt(12));
					
					vec.add(bean);
				}
				if (conn != null) {
					conn.commit();
					conn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return vec;
		}
	
		//insert movie table
		//관리자 영화 추가 구현
		public void insertmovie(movieBean mBean) {
			
			try {
					getConnection();
					
				String sql = "insert into movie values(?,?,?,?,?,?,?,?,?,?,?,?)";

				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, mBean.getMno());
				pstmt.setString(2, mBean.getTitle());
				pstmt.setString(3, mBean.getGenre());
				pstmt.setString(4, mBean.getCountry());
				pstmt.setString(5, mBean.getRuntime());
				pstmt.setString(6, mBean.getAge());
				pstmt.setString(7, mBean.getOpendate());
				pstmt.setString(8, mBean.getDirector());
				pstmt.setString(9, mBean.getActor());
				pstmt.setString(10, mBean.getStory());
				pstmt.setString(11, mBean.getPoster());
				pstmt.setDouble(12, mBean.getLove());
				
				pstmt.executeUpdate();
			}catch(Exception e){
				e.printStackTrace();
				System.out.println("오류");
			}
		}
	
	//추천페이지 랜덤값
		//랜덤 추천 
public Vector<movieBean> RandomselectMovie(String Genre) {

            

            Vector<movieBean> vec = new Vector<>();

            try {
               
               getConnection();
               String sql = "select genre,poster,title,country,runtime,mno from( select* from movie where poster like '.%' order by dbms_random.value ) where genre = ? and rownum<=1";
               
               pstmt = conn.prepareStatement(sql);
               pstmt.setString(1, Genre);
               
                 rs = pstmt.executeQuery();
                

               while (rs.next()) {
                  movieBean mbean3 = new movieBean();

                  mbean3.setGenre(rs.getString(1));
                  mbean3.setPoster(rs.getString(2));
                  mbean3.setTitle(rs.getString(3));
                  mbean3.setCountry(rs.getString(4));
                  mbean3.setRuntime(rs.getString(5));
                  mbean3.setMno(rs.getString(6));
                  vec.add(mbean3);
               }
               conn.close();
               /*
                * if (conn != null) { conn.commit(); }
                */         
               } catch (Exception e) {
               e.printStackTrace();
            }
            return vec;
         }
        
         //검색창
         public Vector<movieBean> searchselectMovie(String title) {

               

               Vector<movieBean> vec2 = new Vector<>();

               try {
                  
                  getConnection();
                  String sql =  "select title,genre,poster,country,runtime,mno from movie where title like ? " ;
                  
                  pstmt = conn.prepareStatement(sql);
                  pstmt.setString(1, "%"+title+"%");
                  
                    rs = pstmt.executeQuery();
                   

                  while (rs.next()) {
                     movieBean bean = new movieBean();
                     
                     bean.setTitle(rs.getString(1));
                     bean.setGenre(rs.getString(2));
                     bean.setPoster(rs.getString(3));
                     bean.setCountry(rs.getString(4));
                     bean.setRuntime(rs.getString(5));
                     bean.setMno(rs.getString(6));
                     vec2.add(bean);
                  }
                  conn.close();
                  /*
                   * if (conn != null) { conn.commit(); }
                   */         
                  } catch (Exception e) {
                  e.printStackTrace();
               }
               return vec2;
            }
	
      // 영화 장르별 검색
         public Vector<movieBean>  GenreselectMovie(String genre) {

               

               Vector<movieBean> vec3 = new Vector<>();

               try {
                  
                  getConnection();
                  String sql =  "select title,genre,country,runtime,poster,mno from movie where genre = ? ";
                  
                  pstmt = conn.prepareStatement(sql);
                  pstmt.setString(1, genre);
                  
                    rs = pstmt.executeQuery();
                   

                  while (rs.next()) {
                     movieBean gbean = new movieBean();
                     
                     gbean.setTitle(rs.getString(1));
                     gbean.setGenre(rs.getString(2));
                     gbean.setCountry(rs.getString(3));
                     gbean.setRuntime(rs.getString(4));
                     gbean.setPoster(rs.getString(5));
                     gbean.setMno(rs.getString(6));
                     vec3.add(gbean);
                  }
                  conn.close();
                          
                  } catch (Exception e) {
                  e.printStackTrace();
               }
               return vec3;
            }
	

}
