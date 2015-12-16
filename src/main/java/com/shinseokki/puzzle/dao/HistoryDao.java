package com.shinseokki.puzzle.dao;

import java.util.Collection;

import com.shinseokki.puzzle.dto.History;

public interface HistoryDao {
	public int save(History history);
	public Collection<History> find(int u_num);
}
