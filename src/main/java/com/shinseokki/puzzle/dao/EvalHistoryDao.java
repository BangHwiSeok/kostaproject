package com.shinseokki.puzzle.dao;

import java.util.Collection;

import com.shinseokki.puzzle.dto.EvalHistory;

public interface EvalHistoryDao {
	public int save(int u_num, int e_num);
	public EvalHistory find(int u_num, int e_num);
	public Collection<EvalHistory> findAll();
	public int remove(int e_num);
}
