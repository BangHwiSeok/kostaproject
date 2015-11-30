package com.shinseokki.puzzle.dto;

public class Profile {
	String u_id;
	String p_photo1;
	String p_photo2;
	String p_photo3;
	String p_photo4;
	String p_photo5;

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getP_photo1() {
		return p_photo1;
	}

	public void setP_photo1(String p_photo1) {
		this.p_photo1 = p_photo1;
	}

	public String getP_photo2() {
		return p_photo2;
	}

	public void setP_photo2(String p_photo2) {
		this.p_photo2 = p_photo2;
	}

	public String getP_photo3() {
		return p_photo3;
	}

	public void setP_photo3(String p_photo3) {
		this.p_photo3 = p_photo3;
	}

	public String getP_photo4() {
		return p_photo4;
	}

	public void setP_photo4(String p_photo4) {
		this.p_photo4 = p_photo4;
	}

	public String getP_photo5() {
		return p_photo5;
	}

	public void setP_photo5(String p_photo5) {
		this.p_photo5 = p_photo5;
	}

	@Override
	public String toString() {
		return "Profile [u_id=" + u_id + ", p_photo1=" + p_photo1 + ", p_photo2=" + p_photo2 + ", p_photo3=" + p_photo3
				+ ", p_photo4=" + p_photo4 + ", p_photo5=" + p_photo5 + "]";
	}

}
