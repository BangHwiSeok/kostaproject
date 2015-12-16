package com.shinseokki.puzzle.dao;

import java.util.Collection;

import com.shinseokki.puzzle.dto.Message;

public interface MessageDao {
	/*public int receiveMsg(); //받는 메세지
	public int read(); //읽은 메세지 (활성화)
*/

	public int sendMsg(int sender, int receiver, String contents);
	public Collection<Message> selectMsg(int sender, int receiver);
}

	