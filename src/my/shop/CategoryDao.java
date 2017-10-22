package my.shop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CategoryDao {
	
	Connection conn;
	
	private static CategoryDao instance;
	
	public static CategoryDao getInstance() {
		if(instance == null){
			instance = new CategoryDao();
		}		
		return instance;
	}    
	
	
	private CategoryDao() {
		try{		
			Context initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB");
			conn = ds.getConnection() ;
			
		}catch( Exception e){
			e.printStackTrace();
		}
	}	 

	
	
	
	
	
	public int insertCategory(CategoryBean category) throws SQLException{
		
		//카테고리 목록을 추가한다.
		PreparedStatement pstmt = null ;
		conn.setAutoCommit( false ) ;
		int cnt = -1 ;
		String sql="insert into category values(catseq.nextval,?,?)";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, category.getCode());
		pstmt.setString(2, category.getCname());
		cnt = pstmt.executeUpdate();
		conn.commit() ;
		
		return cnt  ;
	}
	
	
	
	public int categoryDelete(int cnum) throws SQLException{
		PreparedStatement pstmt = null ;
		conn.setAutoCommit( false ) ;
		String sql = "delete from category where cnum=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, cnum);
		int cnt = -1 ;
		cnt = pstmt.executeUpdate();
		conn.commit() ;
		pstmt.close() ;
		
		return cnt ;
	}
	
	
	
	
	
	
	public ArrayList<CategoryBean> categoryAll() throws SQLException{
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		String sql = "select * from category";
		pstmt=conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		ArrayList<CategoryBean> arr = new ArrayList<CategoryBean>();
		
		while(rs.next()){
			CategoryBean record = new CategoryBean();
			record.setCnum(rs.getInt("cnum"));
			record.setCode(rs.getString("code")) ;
			record.setCname(rs.getString("cname")) ;
		
			arr.add(record);
		}
		
		rs.close() ;
		pstmt.close() ;
		return arr;
	}
}

