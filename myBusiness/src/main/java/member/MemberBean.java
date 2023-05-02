package member;

public class MemberBean {

	private String id;
	private String pwd;
	private String name;
	private String gender;
	private String birthday;
	private String email;
	private String zipcode;
	private String address;
	private String hobby[];
	private String job;
	private String nationality;

	public String getNationality() {
		return nationality;
	}

	public void setNationality(String nationality) {
		this.nationality = nationality;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {

		Encrypt encrypt = new Encrypt();
		this.pwd = encrypt.getEncrypt(pwd);
		/* System.out.println("디스"+this.pwd); */

	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String[] getHobby() {
		return hobby;
	}

	public void setHobby(String[] hobby) {
		this.hobby = hobby;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	/*
	 * public String hashPass(String pwd) { String hex = null;
	 * 
	 * try { MessageDigest md = MessageDigest.getInstance("SHA-256");
	 * md.update((pwd).getBytes()); hex = String.format("%064x", new BigInteger(1,
	 * md.digest()));
	 * 
	 * } catch (Exception e) { // TODO: handle exception }
	 * 
	 * 
	 * } return hex; }
	 */
}