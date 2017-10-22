package my.shop.mall;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import my.shop.ProductBean;

public class Orders {
	
	Connection conn;
	
	public Orders() {   
		try{		
	        Context initContext = new InitialContext();
	        Context envContext = (Context)initContext.lookup("java:/comp/env");
	        DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB");      
	        conn = ds.getConnection();
	        
		}catch( Exception e){
			e.printStackTrace();
		}	
	}
	
	
	
	
	public Vector<OrderBean> getOrderList(String memid) throws SQLException{
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		Vector<OrderBean> lists = null ;		 
		
		String sql = "select m.name mname, m.id mid, p.pname, o.qty, o.amount "
		+ "from (members m join orders o on m.no = o.memno) join product p on o.pnum=p.pnum "
		+ "where m.id = ? ";  
		
		
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, memid);			
		rs=pstmt.executeQuery();
		
		lists = this.makeVector(rs);
		
		rs.close() ;
		pstmt.close() ;
		
		return lists;
	}
	
	
	public Vector<OrderBean> makeVector(ResultSet rs) throws SQLException{
		
		Vector<OrderBean> lists = new Vector<OrderBean>();
		while(rs.next()){
			OrderBean bean	= new OrderBean();
			bean.setMname(rs.getString("mname")) ; 
			bean.setMid(rs.getString("mid")) ;
			bean.setPname(rs.getString("pname")) ;
			bean.setQty(rs.getInt("qty"));
			bean.setAmount(rs.getInt("amount")) ;
			lists.add(bean);
		}
		return lists ;
	
	}//makeVector()--------------------		
	
	
	
	
	
	public int insertOrders(int no, Vector<ProductBean> cv) throws SQLException{ // no:회원번호   cv:장바구니에 담긴 상품목록
		PreparedStatement pstmt = null ;
		
		String sql = "" ;
		
		int cnt  = -1;
		for (int i = 0; i < cv.size() ; i++) {
			conn.setAutoCommit( false ) ;
			
			sql="insert into orders(orderId, memno, pnum, qty, amount) "; 
			sql += "values(orderseq.nextval, ?, ?, ?, ?) " ;
			pstmt=conn.prepareStatement(sql);
			System.out.println( no + "/" + 
								cv.get(i).getPnum() + "/" + 
								cv.get(i).getPqty() + "/" + 
								cv.get(i).getTotalPrice() );
			
			pstmt.setInt(1, no ); // 회원 번호 
			pstmt.setInt(2, cv.get(i).getPnum() ); // 상품번호 
			pstmt.setInt(3, cv.get(i).getPqty() ); // 상품수량
			pstmt.setInt(4, cv.get(i).getTotalPrice() ); // 전체가격
			
			cnt += pstmt.executeUpdate(); 
			conn.commit() ;
		}		
		
		pstmt.close() ;
		System.out.println("cnt:"+cnt);
		return cnt  ; // mall_calculate.jsp로 리턴
	}	 
}
