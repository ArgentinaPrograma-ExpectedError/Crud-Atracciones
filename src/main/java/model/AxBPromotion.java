package model;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AxBPromotion extends Promotion {

	private int cost;
	private Map<String, String> errors;

	public AxBPromotion(Integer id, String name, String attractionType, String promotionType, List<Attraction> attractions, String description,
			Boolean enable) {
		super(id, name, attractionType, promotionType, attractions, description, enable);
		this.cost = this.calculateCost();
	}

	public int calculateCost() {
		List<Attraction> atracciones = super.getAttractions();
		Collections.sort(atracciones);
		Integer descuento = atracciones.get(0).getCost();
		return super.getNetCost() - descuento;
	}

	public Integer getCost() {
		return this.cost;
	}

	public String getData() {
		return super.getName() + "\nTipo: " + super.getType() + "\nAtracciones incluidas: " + super.getNameAttractions()
				+ "\nCosto: " + this.getCost() + " monedas de oro" + "\nDuración: " + super.getDuration() + " horas";
	}

	public boolean isValid() {
		validate();
		return errors.isEmpty();
	}

	public void validate() {
		errors = new HashMap<String, String>();

		if (!super.getPromotionType().equals("ABSOLUTA") && !super.getPromotionType().equals("AXB")
				&& !super.getPromotionType().equals("PORCENTUAL")) {
			errors.put("promotionType", "Debe ser un tipo válido");
		}
		if (!super.getType().equals("AVENTURA") && !super.getType().equals("DEGUSTACION")
				&& !super.getType().equals("PAISAJE")) {
			errors.put("attractionType", "Debe ser un tipo válido");
		}
		if (!validAttractions()) {
			errors.put("sameType", "Las atracciones deben ser del mismo tipo declarado.");
		}
	}
}
