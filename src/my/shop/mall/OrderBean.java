package my.shop.mall;

public class OrderBean {
	/*
	create table orders(
			orderId number, -- �ֹ���ȣ
			memno number, -- ȸ����ȣ
			pnum number, -- ��ǰ��ȣ
			qty number, -- ����
			amount number -- ��ü����
	);
	*/
	// ���γ����� ������ ������ ��ü�� �����.
	private String mname ; //����
	private String mid ; //�� ���̵�
	private String pname ; //��ǰ��
	private int qty ; //�Ǹ� ����
	private int amount ; //�Ǹ� �ݾ�
	
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}	
}