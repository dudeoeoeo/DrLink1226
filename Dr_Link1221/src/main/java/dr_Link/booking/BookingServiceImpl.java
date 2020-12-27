package dr_Link.booking;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("bookingService")
public class BookingServiceImpl implements BookingService {
	
	@Autowired
	private BookingDAO bookingDAO;
	
	@Override
	public void addBooking(BookingDTO vo) {
		// TODO Auto-generated method stub
		bookingDAO.addBooking(vo);
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
		return bookingDAO.getBooking(appointment_num);
	}

	@Override
	public List<BookingDTO> getBookingList() {
		// TODO Auto-generated method stub
		return bookingDAO.getBookingList();
	}

	@Override
	public List<BookingDTO> getPatientBookingList(int patient_num) {
		// TODO Auto-generated method stub
		return bookingDAO.getPatientBookingList(patient_num);
	}

	@Override
	public List<BookingDTO> getDoctorBookingList(int doctor_num) {
		// TODO Auto-generated method stub
		return bookingDAO.getDoctorBookingList(doctor_num);
	}

}
