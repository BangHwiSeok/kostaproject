package com.shinseokki.puzzle.dto;

public class Item {
	
	private String i_name;
	private int i_msg;
	private int i_key;
	private int i_search;
	private int i_num;
	private int i_cost;
	
	public String getI_name() {
		return i_name;
	}
	public void setI_name(String i_name) {
		this.i_name = i_name;
	}
	public int getI_msg() {
		return i_msg;
	}
	public void setI_msg(int i_msg) {
		this.i_msg = i_msg;
	}
	public int getI_key() {
		return i_key;
	}
	public void setI_key(int i_key) {
		this.i_key = i_key;
	}
	public int getI_search() {
		return i_search;
	}
	public void setI_search(int i_search) {
		this.i_search = i_search;
	}
	public int getI_num() {
		return i_num;
	}
	public void setI_num(int i_num) {
		this.i_num = i_num;
	}
	public int getI_cost() {
		return i_cost;
	}
	public void setI_cost(int i_cost) {
		this.i_cost = i_cost;
	}
	
	@Override
	public String toString() {
		return "Item [i_name=" + i_name + ", i_msg=" + i_msg + ", i_key=" + i_key + ", i_search=" + i_search
				+ ", i_num=" + i_num + ", i_cost=" + i_cost + "]";
	}
	
	
	
	
	
	
}
