package org.bmema.usedcars.entity;

import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

@Entity
@JsonIgnoreProperties(ignoreUnknown=true)
@NamedQueries({
	@NamedQuery(
		name = "critieria.search",
		query = "FROM criteria v " +
				"WHERE v.price BETWEEN :price_min AND :price_max "
				+ "v.year BETWEEN year_min AND year_max"
	)
})
public class Criteria extends Vehicle{
	private String year_min;
	private String year_max;
	private String price_min;
	private String price_max;
	public String getYear_min() {
		return year_min;
	}
	public void setYear_min(String year_min) {
		this.year_min = year_min;
	}
	public String getYear_max() {
		return year_max;
	}
	public void setYear_max(String year_max) {
		this.year_max = year_max;
	}
	public String getPrice_min() {
		return price_min;
	}
	public void setPrice_min(String price_min) {
		this.price_min = price_min;
	}
	public String getPrice_max() {
		return price_max;
	}
	public void setPrice_max(String price_max) {
		this.price_max = price_max;
	}
}