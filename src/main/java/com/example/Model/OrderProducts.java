package com.example.Model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "order_products")
public class OrderProducts {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String pro_name;
	private int pro_quantity;
	private String pro_imagepath;
	private double pro_price;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPro_name() {
		return pro_name;
	}

	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}

	public int getPro_quantity() {
		return pro_quantity;
	}

	public void setPro_quantity(int pro_quantity) {
		this.pro_quantity = pro_quantity;
	}

	public String getPro_imagepath() {
		return pro_imagepath;
	}

	public void setPro_imagepath(String pro_imagepath) {
		this.pro_imagepath = pro_imagepath;
	}

	public double getPro_price() {
		return pro_price;
	}

	public void setPro_price(double pro_price) {
		this.pro_price = pro_price;
	}

	@Override
	public String toString() {
		return "OrderProducts [id=" + id + ", pro_name=" + pro_name + ", pro_quantity=" + pro_quantity
				+ ", pro_imagepath=" + pro_imagepath + ", pro_price=" + pro_price + "]";
	}

}
