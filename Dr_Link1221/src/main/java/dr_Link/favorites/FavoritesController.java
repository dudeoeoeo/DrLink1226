package dr_Link.favorites;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dr_Link.dto.PatientDTO;

@Controller
public class FavoritesController {
	
	@Autowired
	private FavoritesDAO favoritesDAO;
	
	@RequestMapping("patients/favorites")
	String favoritesPage(HttpSession session, FavoritesDTO vo, Model model) {
		vo.setPatient_num(((PatientDTO)session.getAttribute("user")).getPatient_num());
		model.addAttribute("favorites", favoritesDAO.getFavoriteList(vo));
		return "patients/favorite.page";
	}
	
	@ResponseBody
	@RequestMapping("checkFavorite.do")
	String checkFavorite(FavoritesDTO vo, HttpSession session) {
		vo.setPatient_num(((PatientDTO)session.getAttribute("user")).getPatient_num());		
		System.out.println( Integer.toString(favoritesDAO.checkFavorite(vo)));
		return Integer.toString(favoritesDAO.checkFavorite(vo));
	}
	
	@ResponseBody
	@RequestMapping(value = { "deleteFavorite.do", "patients/deleteFavorite.do" })
	String deleteFavorite(FavoritesDTO vo, HttpSession session) {
		vo.setPatient_num(((PatientDTO)session.getAttribute("user")).getPatient_num());	
		favoritesDAO.deleteFavorite(vo);
		return "";
	}
	
	@ResponseBody
	@RequestMapping("addFavorite.do")
	String addFavorite(FavoritesDTO vo, HttpSession session) {
		vo.setPatient_num(((PatientDTO)session.getAttribute("user")).getPatient_num());		
		favoritesDAO.addFavorite(vo);
		return "";
	}
	
}
