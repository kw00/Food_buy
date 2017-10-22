package my.shop.mall;

import java.sql.SQLException;
import java.util.Vector;

import my.shop.ProductBean;
import my.shop.ProductDao;

public class CartBean {
	
	private Vector<ProductBean> clist;

	public CartBean(){ 
		clist=new Vector<ProductBean>(5,3);
		System.out.println("CartBean ������"); 
	}

	
	
	
	public void addProduct(String pnum, String oqty) throws SQLException{
		int oqty_new=Integer.parseInt(oqty.trim());
		int pnum_new=Integer.parseInt(pnum.trim());

		ProductBean newPd =null; 
		ProductDao pdao = ProductDao.getInstance();
		newPd = pdao.selectByPnum(pnum);

		
		for(int i=0;i<clist.size();i++){
			int cPnum = clist.get(i).getPnum();
			if(cPnum == pnum_new){ 
				int cPqty = clist.get(i).getPqty();
				System.out.println(cPqty+oqty_new);
				
				clist.get(i).setPqty(cPqty+oqty_new);
				
				clist.get(i).setTotalPrice(
						clist.get(i).getPrice()*(cPqty+oqty_new));
				
				clist.get(i).setTotalPoint(
						clist.get(i).getPoint()*(cPqty+oqty_new));
				return; 
			}
		} // for
		/*
		���� for���� �̹� ��ٱ��Ͽ� �־���� ��ǰ�� ��ġ�ϴ� ��ǰ�� ���� �� ó���ϴ� �κ��̰�
		�Ʒ� �κ��� �� ��ǰ�� �� ó���ϴ� �ڵ�
		*/
		newPd.setPqty( oqty_new ) ; 
		int totalPrice = oqty_new * newPd.getPrice() ;
		int totalPoint = oqty_new * newPd.getPoint();
		
		newPd.setTotalPrice(totalPrice) ;
		newPd.setTotalPoint(totalPoint) ;
		
		clist.add(newPd);//��ٱ��Ͽ� �߰�
		
		System.out.println("clist ����:"+clist.size());
		for(int j=0;j<clist.size();j++){
			System.out.println(
				clist.get(j).getPnum()+" : " + clist.get(j).getPname());	
		}
	
	}//addProduct()----------------


	
	public Vector<ProductBean> getAllProducts(){
		return clist;
	}//getAllProducts()------------------

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public void setEdit(String oqty, String pnum){
		
		int qty=Integer.parseInt(oqty.trim());
		System.out.println("�����ȼ���:"+qty);
		
		for(ProductBean pd:clist){

			if(Integer.parseInt(pnum)==pd.getPnum()){ 
				if(qty==0){
					clist.removeElement(pd);
					break;
				}else{
					pd.setPqty(qty);
					System.out.println("pd.getPqty():"+pd.getPqty());
					int price = pd.getPqty()*pd.getPrice();
					int point = pd.getPqty()*pd.getPoint();
					pd.setTotalPrice(price);
					pd.setTotalPoint(point);
					break;
				}//else--
			}//if-------------
		}//for------------------------

	}//setEdit()--------------------------

	
 
	public void removeProduct(String pnum){
		
		int pnum_new = Integer.parseInt(pnum) ;
		
		for(ProductBean pd: clist){			
			if(pnum_new == pd.getPnum()){			
				clist.removeElement(pd);
				break; 
			}
		}
	}
	
	
	
	public void removeAllProduct(){
		clist.removeAllElements() ;
	}
}





