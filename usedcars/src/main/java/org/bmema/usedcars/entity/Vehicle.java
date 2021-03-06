package org.bmema.usedcars.entity;

import java.io.File;
import java.lang.reflect.Field;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.apache.log4j.Logger;
import org.bmema.usedcars.service.ImageService;

/**
 * @author Bazint
 *
 */
@Entity
@Table(name = "vehicle")
public class Vehicle {

	@Transient
	private Logger logger = Logger.getLogger(getClass());
	
	@Id
	@Column(name = "license_plate")
	private String licensePlate;

	@GeneratedValue
	private int vehicleId; //TODO probably unnecessary
	
	@Column(name = "price")
	private int price;
	
	@Column(name="doorNum")
	private int doorNum;
	
	@Column(name = "year")
	private int year;
	
	@Column(name = "mileage")
	private int mileage;
	
	@Column(name = "brand")
	private String brand;
	
	@Column(name = "model")
	private String model;

	@OneToOne(fetch=FetchType.EAGER, cascade = CascadeType.ALL)
	private Engine engine;
	
	@Column(name = "transmission")
	private String transmission;
	
	@Column(name = "type")
	private String type;
	
	@Column(name = "color")
	private String color;
	
	@Column(name = "fuel")
	private String fuel;

	@Column(name = "weight")
	private int weight;
	
	@Column(name = "picture")
	private String picture;
	
	private String thumbnail;
	
	@Column(name = "owner")
	private String owner;
	
	@Transient
	private boolean isEditable;
	
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

	public int getDoorNum() {
		return doorNum;
	}

	public void setDoorNum(int doorNum) {
		this.doorNum = doorNum;
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getFuel() {
		return fuel;
	}

	public void setFuel(String fuel) {
		this.fuel = fuel;
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

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail() {
		this.thumbnail = ImageService.getThumnailURLPath(new File(picture));
	}

	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	public boolean isEditable() {
		return isEditable;
	}

	public void setEditable(boolean isEditable) {
		this.isEditable = isEditable;
	}
}