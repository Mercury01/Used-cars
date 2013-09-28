package org.bmema.usedcars.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "engine")
public class Engine {
	
	@Column(name = "id")
	@Id
	@GeneratedValue
	private int id;
	
	@Column(name = "cylinders")
	private int cylinders;
	
	@Column(name = "power")
	private int power;
	
	@Column(name = "capacity")
	private int capacity;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCylinders() {
		return cylinders;
	}

	public void setCylinders(int cylinders) {
		this.cylinders = cylinders;
	}

	public int getPower() {
		return power;
	}

	public void setPower(int power) {
		this.power = power;
	}

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
}
