package dr_Link.main;

import java.util.List;

import dr_Link.dto.Hospital_boardDTO;
import dr_Link.dto.NewsDTO;
import dr_Link.dto.NewsReplDTO;

public interface MainDaoInter {
	
	public List<Hospital_boardDTO> getAllHospitalBoards();
	public List<Hospital_boardDTO> getAllHospitalBoards(int p_num);
	public Hospital_boardDTO getDetailHospitalBoard(int h_b_num);
	public void plusWatchCnt(int h_b_num);
	public int getBoardCnt();
	
	//public List<Hospital_boardDTO> getAllHealthBoards();
	public List<NewsDTO> getNewsPage(int p_num);
	public List<NewsDTO> getAllNewsBoards();
	public NewsDTO getNewsBoardsDetail(int b_num);
	public List<NewsReplDTO> getNewsRepl(int news_b_num);
	
	public NewsReplDTO select_repl(int repl_num);
	public int insert_repl(NewsReplDTO nr);
	public int update_repl(NewsReplDTO nr);
	public int delete_repl(NewsReplDTO nr);
	
}
