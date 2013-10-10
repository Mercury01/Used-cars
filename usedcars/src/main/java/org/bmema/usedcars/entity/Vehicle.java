package org.bmema.usedcars.entity;

import java.awt.Color;
import java.io.Serializable;
import java.lang.reflect.Field;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.apache.log4j.Logger;
import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.hibernate.annotations.Generated;

//@NamedQueries({
//	@NamedQuery(
//		name = "critieria.search",
//		query = "FROM Vehicle v " +
//				"WHERE v.price BETWEEN :price_min AND :price_max "
//				+ "v.year BETWEEN year_min AND year_max"
//	)
//})
@Entity
@Table(name = "vehicle")
@JsonIgnoreProperties(ignoreUnknown=true)
public class Vehicle {

	@Transient
	private Logger logger = Logger.getLogger(getClass());
	
	@Id
	@Column(name = "license_plate")
	private String licensePlate;

	@GeneratedValue
	private int vehicleId;
	
	@Column(name = "price")
	private int price;
	
	@Column(name = "year")
	private int year;
	
	@Column(name = "mileage")
	private int mileage;
	
	@Column(name = "brand")
	private String brand;
	
	@Column(name = "model")
	private String model;
	
	@Column(name = "class")
	private String vehicleClass;

	//@Column(name = "engine")
	@OneToOne(fetch=FetchType.EAGER, cascade = CascadeType.ALL)
	//@PrimaryKeyJoinColumn
	private Engine engine;
	
	@Column(name = "transmission")
	private String transmission;
	
	@Column(name = "type")
	private String type;
	
	@Column(name = "color")
	private String color;
	
	@Column(name = "length")
	private int length;
	
	@Column(name = "width")
	private int width;
	
	@Column(name = "weight")
	private int weight;
	
	@Column(name = "picture")
	private String picture;
	
	/**
	 * Returns a string representation of any object. 
	 * Any complex attribute must also extend this class to utilize the correct toString method.
	 */
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder("\n" + getClass().getName() + "\n"); 	//The header of the string will be the type of the class
		for (Field field : getClass().getDeclaredFields()) {							//Iterating through the attributes (fields) of the class
			if(field != null) {
				try {
					field.setAccessible(true);											//Allowing reflection to reach private attributes (of descendants)
					String name = field.getName();										//Getting the name of the attribute
					Object valueObj = field.get(this);									//Getting the value of the attribute
					builder.append(name + " : " 
								+ (valueObj != null ? valueObj.toString() : "null"));	//If the value is null, it should be replaced with a "null" string
				} catch (Exception e) {
					logger.error("An error occured while ", e);
				} 
			}
		}
		return builder.toString();
	}
	
	public String getLicensePlate() {
		return licensePlate;
	}

	public void setLicensePlate(String licensePlate) {
		this.licensePlate = licensePlate;
	}

	public int getVehicleId() {
		return vehicleId;
	}

	public void setVehicleId(int vehicleId) {
		this.vehicleId = vehicleId;
	}
	
	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getMileage() {
		return mileage;
	}

	public void setMileage(int mileage) {
		this.mileage = mileage;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getVehicleClass() {
		return vehicleClass;
	}

	public void setVehicleClass(String vehicleClass) {
		this.vehicleClass = vehicleClass;
	}

	public Engine getEngine() {
		return engine;
	}

	public void setEngine(Engine engine) {
		this.engine = engine;
	}

	public String getTransmission() {
		return transmission;
	}

	public void setTransmission(String transmission) {
		this.transmission = transmission;
	}

	public String getBody() {
		return type;
	}

	public void setBody(String body) {
		this.type = body;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public int getLength() {
		return length;
	}

	public void setLength(int length) {
		this.length = length;
	}

	public int getWidht() {
		return width;
	}

	public void setWidht(int widht) {
		this.width = widht;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}
	
	
}