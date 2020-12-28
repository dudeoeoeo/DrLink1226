package dr_Link.dto;

public class NewsDTO {
    
    private int news_board_num;
    private String news_url, news_photo;
    private String news_title, news_regdate;
    private String [] news_content;
    private int watched, getCnt;
    
    
	public int getGetCnt() {
		return getCnt;
	}
	public void setGetCnt(int getCnt) {
		this.getCnt = getCnt;
	}
	public int getNews_board_num() {
		return news_board_num;
	}
	public void setNews_board_num(int news_board_num) {
		this.news_board_num = news_board_num;
	}
	public String getNews_url() {
		return news_url;
	}
	public void setNews_url(String news_url) {
		this.news_url = news_url;
	}
	public String getNews_photo() {
		return news_photo;
	}
	public void setNews_photo(String news_photo) {
		this.news_photo = news_photo;
	}
	public String getNews_title() {
		return news_title;
	}
	public void setNews_title(String news_title) {
		this.news_title = news_title;
	}
	public String [] getNews_content() {
		return news_content;
	}
	public void setNews_content(String news_content) {
		this.news_content = news_content.split("\n");
	}
	public String getNews_regdate() {
		return news_regdate;
	}
	public void setNews_regdate(String news_regdate) {
		this.news_regdate = news_regdate;
	}
	public int getWatched() {
		return watched;
	}
	public void setWatched(int watched) {
		this.watched = watched;
	}
    
    
    
}
