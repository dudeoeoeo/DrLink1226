package dr_Link.booking;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("bookingDAO")
public class BookingDAOImpl implements BookingDAO {
	
	@Autowired
	private SqlSessionTemplate ss;

	@Override
	public void addBooking(BookingDTO vo) {
		// TODO Auto-generated method stub
		ss.insert("booking.addBooking", vo);
	}

	@Override
	public void updateBooking(BookingDTO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteBooking(BookingDTO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public BookingDTO getBooking(int appointment_num) {
		// TODO Auto-generated method stub
		return ss.selectOne("booking.getBooking", appointment_num);
	}

	@Override
	public List<BookingDTO> getBookingList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BookingDTO> getPatientBookingList(int patient_num) {
		// TODO Auto-generated method stub
		return ss.selectList("booking.getPatientBookingList", patient_num);
	}

	@Override
	public List<BookingDTO> getDoctorBookingList(int doctor_num) {
		// TODO Auto-generated method stub
		return ss.selectList("booking.getDoctorBookingList", doctor_num);
	}

}
