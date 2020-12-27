package dr_Link.booking;

import java.util.List;

public interface BookingDAO {
	void addBooking(BookingDTO vo);
	
	void updateBooking(BookingDTO vo);
	
	void deleteBooking(BookingDTO vo);
	
	BookingDTO getBooking(int appointment_num);
	
	List<BookingDTO> getBookingList();
	
	List<BookingDTO> getPatientBookingList(int patient_num);
	
	List<BookingDTO> getDoctorBookingList(int doctor_num);
}
