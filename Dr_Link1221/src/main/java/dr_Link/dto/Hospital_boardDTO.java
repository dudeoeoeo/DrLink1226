package dr_Link.dto;

public class Hospital_boardDTO {

	private int hospital_board_num;
	private String hospital_title; 
	private String [] hospital_content;
	private String hospital_regdate;
	private int h_watched;
	private int getCnt;
	
	
	public int getGetCnt() {
		return getCnt;
	}
	public void setGetCnt(int getCnt) {
		this.getCnt = getCnt;
	}
	public int getHospital_board_num() {
		return hospital_board_num;
	}
	public void setHospital_board_num(int hospital_board_num) {
		this.hospital_board_num = hospital_board_num;
	}
	public String getHospital_title() {
		return hospital_title;
	}
	public void setHospital_title(String hospital_title) {
		this.hospital_title = hospital_title;
	}
	public String[] getHospital_content() {
		return hospital_content;
	}
	public void setHospital_content(String hospital_content) {
		this.hospital_content = hospital_content.split("\n");
	}
	public String getHospital_regdate() {
		return hospital_regdate;
	}
	public void setHospital_regdate(String hospital_regdate) {
		this.hospital_regdate = hospital_regdate;
	}
	public int getH_watched() {
		return h_watched;
	}
	public void setH_watched(int h_watched) {
		this.h_watched = h_watched;
	} 
	
}
