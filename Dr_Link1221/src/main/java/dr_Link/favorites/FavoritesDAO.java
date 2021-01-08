package dr_Link.favorites;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("favoritesDAO")
public class FavoritesDAO {
	
	@Autowired
	private SqlSessionTemplate ss;
	
	List<FavoritesDTO> getFavoriteList(FavoritesDTO vo) {		
		return ss.selectList("favorites.selectFavoriteList", vo);
	}
	
	int checkFavorite(FavoritesDTO vo) {
		return ss.selectOne("favorites.checkFavorite", vo);
	}
	
	void deleteFavorite(FavoritesDTO vo) {
		ss.delete("favorites.deleteFavorite", vo);
	}
	
	void addFavorite(FavoritesDTO vo) {
		ss.insert("favorites.addFavorite", vo);
	}
}
