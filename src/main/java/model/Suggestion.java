package model;

import java.util.List;

public interface Suggestion {

	String getName();

	String getType();

	Integer getCost();

	Double getDuration();

	List<Attraction> getAttractions();

	boolean canHost(int i);
}
