package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import board.BoardDataBean;

public class BoardDao { 
	Connection conn = null; 
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	private static BoardDao instance = new BoardDao();    
	public static BoardDao getInstance() {
		return instance;
	}    
	private BoardDao() { 
		System.out.println("객체생성");
	}  	

	private Connection getConnection() throws Exception {
		if(conn==null){
			String url="jdbc:oracle:thin:@localhost:1521:xe"  ;
			String username="jspid" ; 
			String password="jsppw" ;
			Class.forName(  "oracle.jdbc.driver.OracleDriver" ) ;
			conn = DriverManager.getConnection(url, username, password);    	
		}
		return conn;
	}


	public void insertArticle(BoardDataBean article) { 

		try {
			conn = getConnection();
			String sql = 
					"insert into board(num, writer,email,subject,passwd,reg_date,"+
							"ref,re_step,re_level,content,ip) " + 
							"values(board_seq.nextval, ?,?,?,?,?,board_seq.nextval,?,?,?,?)"; 

			pstmt = conn.prepareStatement( sql );
			pstmt.setString(1, article.getWriter());
			pstmt.setString(2, article.getEmail());
			pstmt.setString(3, article.getSubject());
			pstmt.setString(4, article.getPasswd());
			pstmt.setTimestamp(5, article.getReg_date());
			pstmt.setInt(6, 0); // re_step
			pstmt.setInt(7, 0); // re_level
			pstmt.setString(8, article.getContent());
			pstmt.setString(9, article.getIp());

			pstmt.executeUpdate();

		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			//close();
		}
	}    


	public int getArticleCount()  {

		String sql = "select count(*) as cnt  from board" ;
		int x=0;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement( sql );
			rs = pstmt.executeQuery();

			if (rs.next()) {
				x= rs.getInt("cnt");
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			//close();
		}
		return x;
	}


	public List<BoardDataBean> getArticles(int start, int end){

		List<BoardDataBean> articleList=null;

		String sql = "select num, writer, email, subject, passwd, reg_date, readcount, ref, re_step, re_level, content, ip " ;		        
		sql += "from (select rownum as rank, num, writer, email, subject, passwd, reg_date, readcount, ref, re_step, re_level, content, ip ";
		sql += "from (select num, writer, email, subject, passwd, reg_date, readcount, ref, re_step, re_level, content, ip ";
		sql += "from board  ";
		sql += "order by ref desc, re_step asc )) ";
		sql += "where rank between ? and ? ";		        

		try {
			conn = getConnection();
			System.out.println( "글번호: " + start + " / " + end ); 
			pstmt = conn.prepareStatement( sql 	);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				articleList = new ArrayList<BoardDataBean>(); 

				do{					
					BoardDataBean article= new BoardDataBean();

					article.setNum(rs.getInt("num"));
					article.setWriter(rs.getString("writer"));
					article.setEmail(rs.getString("email"));
					article.setSubject(rs.getString("subject"));
					article.setPasswd(rs.getString("passwd"));
					article.setReg_date(rs.getTimestamp("reg_date"));
					article.setReadcount(rs.getInt("readcount"));
					article.setRef(rs.getInt("ref"));
					article.setRe_step(rs.getInt("re_step"));
					article.setRe_level(rs.getInt("re_level"));
					article.setContent(rs.getString("content"));
					article.setIp(rs.getString("ip")); 

					articleList.add(article);
				}while(rs.next());
			}
		} catch(Exception ex) {
			ex.printStackTrace();

		} finally {
		}
		return articleList;
	}


	public BoardDataBean getArticle(int num) throws Exception {

		BoardDataBean article=null;

		String sql = "update board set readcount=readcount+1 where num = ?" ;
		String sql2 = "select * from board where num = ?" ;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement( sql )  ;			
			pstmt.setInt(1, num);			
			pstmt.executeUpdate();

			pstmt = conn.prepareStatement(  sql2 );
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				article = new BoardDataBean();
				article.setNum(rs.getInt("num"));
				article.setWriter(rs.getString("writer"));
				article.setEmail(rs.getString("email"));
				article.setSubject(rs.getString("subject"));
				article.setPasswd(rs.getString("passwd"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				article.setReadcount(rs.getInt("readcount"));
				article.setRef(rs.getInt("ref"));
				article.setRe_step(rs.getInt("re_step"));
				article.setRe_level(rs.getInt("re_level"));
				article.setContent(rs.getString("content"));
				article.setIp(rs.getString("ip"));     
			}
		} catch(Exception ex) { 
			ex.printStackTrace();
		} finally {
			//close();
		}
		return article;
	}


	public BoardDataBean updateGetArticle(int num){

		BoardDataBean article=null;

		String sql = "select * from board where num = ?" ;

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement( sql );
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				article = new BoardDataBean();
				article.setNum(rs.getInt("num"));
				article.setWriter(rs.getString("writer"));
				article.setEmail(rs.getString("email"));
				article.setSubject(rs.getString("subject"));
				article.setPasswd(rs.getString("passwd"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				article.setReadcount(rs.getInt("readcount"));
				article.setRef(rs.getInt("ref"));
				article.setRe_step(rs.getInt("re_step"));
				article.setRe_level(rs.getInt("re_level"));
				article.setContent(rs.getString("content"));
				article.setIp(rs.getString("ip"));     
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			//close();
		}
		return article;
	}






	public int updateArticle(BoardDataBean article)	{

		String dbpasswd="";
		String sql = "select passwd from board where num = ?" ;
		String sql2 = "update board set writer=?,email=?,subject=?,passwd=?" ;
		sql2 += ",content=? where num=? " ;

		int cnt=-1;
		try {
			conn = getConnection();

			pstmt = conn.prepareStatement( sql );
			pstmt.setInt(1, article.getNum());
			rs = pstmt.executeQuery();

			if(rs.next()){
				dbpasswd= rs.getString("passwd"); // 1234

				if(dbpasswd.equals(article.getPasswd())){
					pstmt = conn.prepareStatement( sql2 );

					pstmt.setString(1, article.getWriter());
					pstmt.setString(2, article.getEmail());
					pstmt.setString(3, article.getSubject());
					pstmt.setString(4, article.getPasswd());
					pstmt.setString(5, article.getContent());
					pstmt.setInt(6, article.getNum());
					cnt = pstmt.executeUpdate();

				}else{

				}
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			//close();
		}
		return cnt;
	}


	public int deleteArticle(int num, String passwd) {//12

		String dbpasswd="";
		int x=-1;
		String sql = "select passwd from board where num = ?" ;
		String sql2 = "delete from board where num=?" ;

		try {
			conn = getConnection();

			pstmt = conn.prepareStatement( sql 	);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if(rs.next()){ // 1234
				dbpasswd= rs.getString("passwd"); 

				if(dbpasswd.equals(passwd)){
					pstmt = conn.prepareStatement( sql2 );
					pstmt.setInt(1, num);
					pstmt.executeUpdate();
					x= 1; 
				}else
					x= 0; 
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			//close();
		}
		return x;
	}


	public void replyArticle(BoardDataBean article) {

		int num=article.getNum();
		int ref=article.getRef();
		int re_step=article.getRe_step();
		int re_level=article.getRe_level();

		// subject은 자신의 것이 나오고, num,ref,re_step,re_level은 부모의 것이 나온다.
		System.out.println("num:"+num);
		System.out.println("subject:"+article.getSubject());
		System.out.println("ref:"+ref);
		System.out.println("re_step:"+re_step);
		System.out.println("re_level:"+re_level);

		String sql = 
			"update board set re_step=re_step+1 where ref= ? and re_step > ?";

		try {
			conn = getConnection();

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ref);
			pstmt.setInt(2, re_step);
			pstmt.executeUpdate();
			re_step=re_step+1;
			re_level=re_level+1;

			String sql2 = 
			"insert into board(num, writer,email,subject,passwd,reg_date,"  
			+ "ref,re_step,re_level,content,ip) "
			+ "values(board_seq.nextval, ?,?,?,?,?,?,?,?,?,?) " ;

			pstmt = conn.prepareStatement( sql2 );
			pstmt.setString(1, article.getWriter());
			pstmt.setString(2, article.getEmail());
			pstmt.setString(3, article.getSubject());
			pstmt.setString(4, article.getPasswd());
			pstmt.setTimestamp(5, article.getReg_date());
			pstmt.setInt(6, ref);
			pstmt.setInt(7, re_step);
			pstmt.setInt(8, re_level);
			pstmt.setString(9, article.getContent());
			pstmt.setString(10, article.getIp());

			pstmt.executeUpdate();
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			//close();
		}
	}   	

}


