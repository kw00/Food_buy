package my.shop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.oreilly.servlet.MultipartRequest;

public class ProductDao {
	Connection conn;	
	private static ProductDao instance;
	public static ProductDao getInstance() {
		if(instance == null){
			instance = new ProductDao();
		}		
		return instance;
	}    
	
	private ProductDao() { 
		try{		
			Context initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB");
			conn = ds.getConnection() ;

		}catch( Exception e){
			e.printStackTrace();
		}
	}	
	
	
	
	
	public ProductBean selectByPnum(String pnum) throws SQLException{ 
		// prod_view.jsp, prod_update.jsp, mall_prodView.jsp, CartBean(addProduct())
		
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		String sql = "select * from product where pnum=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, pnum);
		rs=pstmt.executeQuery();
		
		ArrayList<ProductBean> arr	= this.makeArrayList(rs);
		ProductBean product =null;
		
		if(arr.size()!=0){
			product=arr.get(0);
		}
		rs.close() ;
		pstmt.close() ;
		return product ;
	}
	
	
	
	
	
	public ArrayList<ProductBean> productAll() throws SQLException{
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		String sql = "select * from product order by pnum";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		ArrayList<ProductBean> arr = this.makeArrayList(rs);
	 
		rs.close() ;
		pstmt.close() ;
		return arr ;
	}
	
	
public int insertProduct(MultipartRequest mr) throws SQLException{
		
		PreparedStatement pstmt = null ;		
		
		conn.setAutoCommit(false) ;
		
		String sql = 
		"insert into product values(catprod.nextval,?,?,?,?,?,?,?,?,?,?)";
		pstmt=conn.prepareStatement(sql);
		
		String pname=mr.getParameter("pname");
		String pcategory_fk=mr.getParameter("pcategory_fk");
		pcategory_fk += mr.getParameter("pcode"); 
		// pcategory_fk에는 카테고리 코드(code)와 상품코드(pcode)가 연결되서 들어간다.
		//pcategory_fk=womanwhite
		
		String pcompany=mr.getParameter("pcompany");
		String pimage=mr.getFilesystemName("pimage"); // Koala.jpg
		
		String pqty=mr.getParameter("pqty");
		String price=mr.getParameter("price");
		String pspec=mr.getParameter("pspec");
		String pcontents=mr.getParameter("pcontents");
		String point=mr.getParameter("point");
		
		pstmt.setString(1,pname);
		pstmt.setString(2,pcategory_fk);
		pstmt.setString(3,pcompany);
		pstmt.setString(4,pimage);
		pstmt.setString(5,pqty);
		pstmt.setString(6,price);
		pstmt.setString(7,pspec);
		pstmt.setString(8,pcontents);
		pstmt.setString(9,point);
		
		java.util.Date date = new java.util.Date();
		java.text.SimpleDateFormat sdf = 
				new java.text.SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(date);
		pstmt.setString(10, today);
		
		int cnt = -1 ;
		cnt = pstmt.executeUpdate();
		
		conn.commit() ;
		pstmt.close() ;
		
		return cnt ;
	}
	
	
	
	
	public ArrayList<ProductBean> makeArrayList(ResultSet rs) throws SQLException{
	
		ArrayList<ProductBean> arr = new ArrayList<ProductBean>();

		while(rs.next()){
			int pnum=rs.getInt("pnum");
			String pname=rs.getString(2);
			String pcategory_fk=rs.getString(3);
			String pcompany=rs.getString(4);
			String pimage=rs.getString(5);
			int pqty=rs.getInt(6);
			int price=rs.getInt(7);
			String pspec=rs.getString(8);
			String pcontents=rs.getString(9); 
			int point=rs.getInt(10);
			String pinputdate = rs.getString(11);
			ProductBean dto = new ProductBean(pnum,pname,pcategory_fk,
			pcompany,pimage,pqty,price,pspec,pcontents,point,pinputdate,0,0);
			arr.add(dto);
		}
		return arr;
	}
	
	
	public int updateProduct(MultipartRequest mr) throws SQLException{
		PreparedStatement pstmt = null ;

		String sql ="update product set pname=?, pcategory_fk=?, " +
		"pcompany=?, pimage=?, pqty=?, price=?, pspec=?,pcontents=?,"+
		"point=?, pinputdate=? where pnum=?";								
		 
		pstmt = conn.prepareStatement(sql);
		String pname = mr.getParameter("pname");
		String pcategory_fk = mr.getParameter("pcategory_fk");
		String pcompany = mr.getParameter("pcompany");
		
		
		String pimage = mr.getFilesystemName("pimage"); 
		// 새로 입력한 이미지(type=file이므로 getFilesystemName으로 가져옴)
		
		if(pimage==null){
			pimage=mr.getParameter("pimage2");
			// 기존 이미지(type=hidden이므로 getParameter로 가져옴)
		}
		
		
		String pqty=mr.getParameter("pqty");
		String price=mr.getParameter("price");
		String pspec=mr.getParameter("pspec");
		String pcontents=mr.getParameter("pcontents");
		String point=mr.getParameter("point");
		String pinputdate = mr.getParameter("pinputdate"); 
		String pnum=mr.getParameter("pnum");
		
		pstmt.setString(1,pname);
		pstmt.setString(2,pcategory_fk);
		pstmt.setString(3,pcompany);
		pstmt.setString(4,pimage);
		pstmt.setInt(5, Integer.parseInt(pqty)); // "3a"
		pstmt.setInt(6, Integer.parseInt(price));
		pstmt.setString(7,pspec);
		pstmt.setString(8,pcontents);
		pstmt.setInt(9, Integer.parseInt(point));
		pstmt.setString(10, pinputdate);
		pstmt.setInt(11, Integer.parseInt(pnum));
		
		int cnt = -1;
		cnt = pstmt.executeUpdate();
		pstmt.close() ;
		return cnt ;
	}//updateProduct()
	
	 
	
	public int deleteProduct(String pnum) throws SQLException{
		PreparedStatement pstmt = null ;
		
		conn.setAutoCommit( false ) ;
		String sql = "delete from product where pnum=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, pnum);
		int cnt = -1 ;
		cnt = pstmt.executeUpdate();
		conn.commit() ;
		pstmt.close() ;
		return cnt ;
				
	}//deleteProduct()----------------
	
	
	
	public ArrayList<ProductBean> selectByPspec(String pspec) throws SQLException{
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		ArrayList<ProductBean> lists = null ;	
		String sql = "SELECT * FROM product WHERE pspec=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, pspec);			
		rs=pstmt.executeQuery();
		lists = this.makeArrayList(rs);
		rs.close() ;
		pstmt.close() ;
		
		return lists;
		
	}//selectByPspec()----------------
	
	
	
	
	public ArrayList<ProductBean> selectByCategory(String code) throws SQLException{
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		ArrayList<ProductBean> lists = null ;
		
		String sql = "SELECT * FROM product WHERE pcategory_fk like ?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, code+"%"); 
		// 카테고리코드% (man%) manblack(pcategory_fk : 카테고리코드 + 상품코드)		
		
		rs=pstmt.executeQuery();
		lists = this.makeArrayList(rs);
		rs.close() ;
		pstmt.close() ;
		
		return lists;		
	}//selectByPspec()----------------	
}




