package com.scci.dao;

import java.util.List;
import java.util.Map;

import com.scci.vo.NoticeVO;

public interface BoardDAO {
	//게시물 목록 보기
	public List<NoticeVO> getNotice(NoticeVO noticeVO);
	
	public int getNoticeInsert(NoticeVO noticeVO);
	// 상세보기
	public NoticeVO getNoticeContent(int noticeId); 
	// 수정페이지
	public int getNoticeUpdate(NoticeVO noticeVO);	
	// 삭제페이지
	public int getNoticeDelete(int noticeId);
}
