package com.shinseokki.puzzle.dao;

import java.util.List;

import com.shinseokki.puzzle.dto.Item;

public interface ItemDao {
	public int addItem(Item item);
	public Item getItem(int i_num);
	public List<Item> getItems();
	public int updateItem(Item item);
	public int deleteItem(String i_name);
	public int getItemCount();
	
}
