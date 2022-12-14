package com.scci.service;

import java.util.List;
import java.util.Map;

import com.scci.vo.NoticeVO;

public interface BoardService {
	public List<NoticeVO> getNotice(NoticeVO noticeVO);
	
	public void getNoticeInsert(NoticeVO noticeVO);
	
	public NoticeVO getNoticeContent(int noticeId);
}
