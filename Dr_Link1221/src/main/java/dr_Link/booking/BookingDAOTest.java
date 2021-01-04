package dr_Link.booking;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("bookingDAOTest")
public class BookingDAOTest {
	
	@Autowired
	private SqlSessionTemplate ss;
	
	//①이미 예약했는지 체크
	BookingDTO alreadyBookingCheck(BookingDTO vo) {	
		return ss.selectOne("booking.alreadyBookingCheck", vo);
	}
	
	//③예약인원 체크	
	int bookingCount(BookingDTO vo) {
		return ss.selectOne("booking.bookingCount", vo);
	}

}
