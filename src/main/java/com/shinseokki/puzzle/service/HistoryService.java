package com.shinseokki.puzzle.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shinseokki.puzzle.dao.HistoryDao;
import com.shinseokki.puzzle.dto.History;
import com.shinseokki.puzzle.dto.HistoryInfo;

@Service
public class HistoryService {
	private HistoryDao historyDao;
	private MessageService messageService;
	private ProfileService profileService;
	
	@Autowired
	public HistoryService(SqlSession sqlSession,MessageService messageService, ProfileService profileService) {
		this.historyDao = sqlSession.getMapper(HistoryDao.class);
		this.messageService = messageService;
		this.profileService = profileService;
	
	}
	
	public int save(History history){
		
		return historyDao.save(history);
	}
	
	
	public Collection<HistoryInfo> find(int u_num){
		Collection<HistoryInfo> historyCollection = new ArrayList<HistoryInfo>(); 
		historyDao.find(u_num).stream().forEach((h)->{
			HistoryInfo info = new HistoryInfo();
			// History를 담는다.
			info.setHistory(h);
			//Profile -> 사진 정보를 담는다.
			info.setProfiles(profileService.find(h.getH_num()));
			Map<String,Integer> countData = messageService.countMessagInfo(u_num, h.getH_num());
			// 읽지 않은 쪽지의 숫자를 담는다.
			String result = String.valueOf(countData.get("UNREADNUM"));
			info.setUnReadNum(Integer.parseInt(result));
			
			// 보낸 쪽지의 숫자를 담는다.
			result = String.valueOf(countData.get("SENDEDNUM"));
			info.setSendedNum(Integer.parseInt(result));
			// 받은 쪽지의 숫자를 담는다.
			result = String.valueOf(countData.get("RECEIVEDNUM"));
			info.setReceivedNum(Integer.parseInt(result));			

			historyCollection.add(info);
		});
		
		
		return historyCollection;
	}
}
