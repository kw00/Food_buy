package my.member;

public class MemberDTO {
	private int no;
	private String name;
	private String id;
	private String password;
	private String nickname;
	private String email;
	private String phoneNumber;
	private String ssn;
	private String gender;
	private String joindate;

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getSsn() {
		return ssn;
	}
	public void setSsn(String ssn) {
		this.ssn = ssn;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getJoindate() {
		return joindate;
	}
	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}
	

	public MemberDTO(int no, String name, String id, String password, String nickname, String email,
			String phoneNumber, String ssn, String gender, String joindate) {
		super();
		this.no = no;
		this.name = name;
		this.id = id;
		this.password = password;
		this.nickname = nickname;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.ssn = ssn;
		this.gender = gender;
		this.joindate = joindate;
	}
	public MemberDTO() {
		super();
	}

}