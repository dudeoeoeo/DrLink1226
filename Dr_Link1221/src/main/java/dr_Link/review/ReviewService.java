package dr_Link.review;

import java.util.List;

public interface ReviewService {
	
	void addReview(Doc_ReviewDTO vo);
	
	int updateReview(Doc_ReviewDTO vo);
	
	int deleteReview(Doc_ReviewDTO vo);
	
	Doc_ReviewDTO getReview(int review_num);
	
	List<Doc_ReviewDTO> getReviewList(int doctor_num);
	
}
