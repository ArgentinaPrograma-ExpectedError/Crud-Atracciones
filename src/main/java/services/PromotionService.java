package services;

import java.util.LinkedList;
import java.util.List;

import model.AbsolutePromotion;
import model.Attraction;
import model.AxBPromotion;
import model.PercentagePromotion;
import model.Promotion;
import persistence.AttractionDAO;
import persistence.PromotionDAO;
import persistence.commons.DAOFactory;

public class PromotionService {

	public List<Promotion> list() {
		return DAOFactory.getPromotionDAO().findAll();
	}

	public Promotion create(String promotionType, String name, String attractionType, List<String> atracciones, Integer valor,
			String description, Boolean state) {

		List<Attraction> attractions = new LinkedList<Attraction>();
		for (String s : atracciones) {
			for (Attraction a : DAOFactory.getAttractionDAO().findAll()) {
				if (a.getName().equals(s)) {
					attractions.add(a);
				}
			}
		}

		Promotion promotion = null;

		if (promotionType.equals("ABSOLUTA")) {
			promotion = new AbsolutePromotion(-1, name, attractionType, promotionType, attractions, description, state, valor);
		}
		if (promotionType.equals("AXB")) {
			promotion = new AxBPromotion(-1, name, attractionType, promotionType, attractions, description, state);
		}
		if (promotionType.equals("PORCENTUAL")) {
			promotion = new PercentagePromotion(-1, name, attractionType, promotionType, attractions, description, state,
					valor);
		}

		if (promotion.isValid()) {
			PromotionDAO promotionDAO = DAOFactory.getPromotionDAO();
			promotionDAO.insert(promotion);
			// XXX: si no devuelve "1", es que hubo más errores
		}

		return promotion;
	}

	public Attraction update(Integer id, String name, Integer cost, Double duration, Integer capacity, String type,
			String description) {

		AttractionDAO attractionDAO = DAOFactory.getAttractionDAO();
		Attraction attraction = attractionDAO.find(id);

		attraction.setName(name);
		attraction.setCost(cost);
		attraction.setDuration(duration);
		attraction.setCapacity(capacity);
		attraction.setType(type);
		attraction.setDescription(description);

		if (attraction.isValid()) {
			attractionDAO.update(attraction);
			// XXX: si no devuelve "1", es que hubo más errores
		}

		return attraction;
	}

	public void delete(Integer id) {
		Attraction attraction = new Attraction(id, null, null, null, null, null, null, null);

		AttractionDAO attractionDAO = DAOFactory.getAttractionDAO();
		attractionDAO.delete(attraction);
	}

	public Attraction find(Integer id) {
		AttractionDAO attractionDAO = DAOFactory.getAttractionDAO();
		return attractionDAO.find(id);
	}

	public void enable(Integer id) {
		PromotionDAO promotionDAO = DAOFactory.getPromotionDAO();
		Promotion promotion = promotionDAO.find(id);
		promotionDAO.enable(promotion);

	}

}
