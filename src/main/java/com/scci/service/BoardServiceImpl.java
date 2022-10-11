package com.scci.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scci.dao.BoardDAO;
import com.scci.vo.NoticeVO;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	private BoardDAO boardDAO;
	
	@Override 
	public List<NoticeVO> getNotice(NoticeVO noticeVO){
	return boardDAO.getNotice(noticeVO);
	}
	
	@Override
	public void getNoticeInsert(NoticeVO noticeVO) {
		boardDAO.getNoticeInsert(noticeVO);
	}
	
	@Override
	public NoticeVO getNoticeContent(int noticeId) {
		return boardDAO.getNoticeContent(noticeId);
	}
	@Override
	public int getNoticeUpdate(NoticeVO noticeVO) {
		return boardDAO.getNoticeUpdate(noticeVO);
	}
	@Override
	public void getNoticeDelete(int noticeId) {
		boardDAO.getNoticeDelete(noticeId);
	}
}
