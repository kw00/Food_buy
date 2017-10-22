package my.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	
	Connection conn = null ;	
	
	private static MemberDAO dao = new MemberDAO();
	
	private MemberDAO() {
	}
	
	public static MemberDAO getInstance(){
		return dao;
	}
		
	
	
	private Connection getConnection() throws Exception {
		
		Context initContext = new InitialContext();
        Context envContext  = (Context)initContext.lookup("java:/comp/env");
        DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB");
        conn = ds.getConnection();
        return conn;
        
	}
	
	
	
	public boolean searchID(String id) throws Exception{  
		System.out.println("searchID로 넘어온값:"+id);
		String sql = "select id from members where id=?";
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		boolean flag=false;
		
		/*try{*/
			conn = getConnection() ;
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			
			while(rs.next()){ 
				flag = true;
			}
		
		/*} catch (Exception e){
			e.printStackTrace();
		}finally{
			try{ 
				if(rs!=null)
					rs.close();
				if(pstmt!=null)
					pstmt.close();
				if(conn!=null)
					conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}*/
		System.out.println("flag:"+flag);
		return flag;	
	}
	
	
	public int insertData( MemberDTO member ) throws Exception{
		PreparedStatement pstmt = null ;
		String sql = 
		"insert into members(no, name, id, password, nickname, email, phoneNumber, ssn, gender, joindate) "
		+ "values(memseq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?) " ;
		int cnt = -1 ;
		conn = getConnection();
		pstmt = conn.prepareStatement(sql) ;
		conn.setAutoCommit( false ) ;
		
		pstmt.setString(1, member.getName()) ;
		pstmt.setString(2, member.getId()) ;
		pstmt.setString(3, member.getPassword()) ;
		pstmt.setString(4, member.getNickname()) ;
		pstmt.setString(5, member.getEmail()) ;
		pstmt.setString(6, member.getPhoneNumber()) ;
		pstmt.setString(7, member.getSsn()) ;
		pstmt.setString(8, member.getGender()) ;	
		pstmt.setString(9, member.getJoindate()) ;	
		cnt = pstmt.executeUpdate() ;
		conn.commit() ;   						
		return cnt  ;
	}
	
	public MemberDTO getMemberBySsn(String name, String ssn) throws Exception{
		
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		String sql = "select * from members where name=? and ssn=? "; 
		conn = getConnection();
		pstmt = conn.prepareStatement(sql) ;
		
		pstmt.setString(1, name) ;
		pstmt.setString(2, ssn) ;
		
		rs = pstmt.executeQuery() ;
		
		MemberDTO member = null ;
		
		if( rs.next() ){
			member = getMemberBean( rs ) ;
		}
		
		return member ;
	}
	
	
	
	private MemberDTO getMemberBean(ResultSet rs) throws SQLException { 
		
		MemberDTO member = new MemberDTO() ;
		
		member.setNo(rs.getInt("no")) ;
		member.setName(rs.getString("name")) ;
		member.setId(rs.getString("id"));
		member.setPassword(rs.getString("password"));
		member.setNickname(rs.getString("nickname")) ;
		member.setEmail(rs.getString("email")) ;
		member.setPhoneNumber(rs.getString("phoneNumber")) ;
		member.setGender(rs.getString("gender"));
		member.setJoindate(rs.getString("joindate"));
		
		return member;
	}
	
	public MemberDTO getMemberByIdAndName(String id, String name, String ssn1, String ssn2) throws Exception{
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		String sql = 
		"select * from members where name=? and ssn1=? and ssn2=? and id=? ";
		
		conn = getConnection();
		pstmt = conn.prepareStatement(sql) ;
		
		pstmt.setString(1, name) ;
		pstmt.setString(2, ssn1) ;
		pstmt.setString(3, ssn2) ;
		pstmt.setString(4, id) ;
		
		rs = pstmt.executeQuery() ;
		
		MemberDTO member = null ;
		
		if( rs.next() ){
			member = getMemberBean( rs ) ;
		}
		
		return member ;
	}	
	
	
	public MemberDTO getMemberInfo(String id, String password) throws Exception{
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		String sql = "select * from members where id=? and password=?"; 
		
		conn = getConnection();
		pstmt = conn.prepareStatement(sql) ;
		
		pstmt.setString(1, id) ;
		pstmt.setString(2, password) ;
		
		rs = pstmt.executeQuery() ;
		
		MemberDTO member = null ;
		
		if( rs.next() ){
			member = getMemberBean( rs ) ;
		}
		
		return member ;
	}
	
	public MemberDTO getMemberSelect(int no) throws Exception{
		
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		String sql = "select * from members where no=?"; 
		
		conn = getConnection();
		pstmt = conn.prepareStatement(sql) ;
		pstmt.setInt(1, no) ;
		rs = pstmt.executeQuery() ;
		
		MemberDTO member = null ;
		
		if( rs.next() ){
			member = getMemberBean( rs ) ;
		}
		
		return member;
	}	
	
}

