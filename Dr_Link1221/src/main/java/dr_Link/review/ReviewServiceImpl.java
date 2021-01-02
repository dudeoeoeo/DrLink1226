package dr_Link.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private ReviewDAO reviewDao;

	@Override
	public int addReview(Doc_ReviewDTO vo) {
		// TODO Auto-generated method stub
		return reviewDao.addReview(vo);
	}

	@Override
	public int updateReview(Doc_ReviewDTO vo) {
		return reviewDao.updateReview(vo);
	}

	@Override
	public int deleteReview(Doc_ReviewDTO vo) {
		return reviewDao.deleteReview(vo);
	}

	@Override
	public Doc_ReviewDTO getReview(int review_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Doc_ReviewDTO> getReviewList(int doctor_num) {
		// TODO Auto-generated method stub
		return reviewDao.getReviewList(doctor_num);
	}

}
