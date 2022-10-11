package com.scci.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.scci.service.BoardService;
import com.scci.vo.NoticeVO;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	private BoardService boardService;

	@RequestMapping(value = "/noticePage", method = RequestMethod.GET)
	public String noticePage(NoticeVO noticeVO, Model model) {
		List<NoticeVO> notice = boardService.getNotice(noticeVO);
		model.addAttribute("notice", notice);
		return "board/noticePage";
	}

	@RequestMapping("/noticeForm")
	public String boardForm() {
		return "board/noticeForm";
	}
	@RequestMapping(value="/saveBoard",method = RequestMethod.POST)
	public String saveBoard(@ModelAttribute("noticeVO")NoticeVO noticeVO,
			@RequestParam("mode") String mode
			,RedirectAttributes rttr) {
		if(mode.equals("edit")) {
			boardService.getNoticeUpdate(noticeVO);
		}else {
			boardService.getNoticeInsert(noticeVO);
		}
		return "redirect:/board/noticePage";
	}
	
	@RequestMapping(value="/noticeContent", method = RequestMethod.GET)
	public String getNoticeContent(Model model, @RequestParam("noticeId")int noticeId) {
		model.addAttribute("pageContent", boardService.getNoticeContent(noticeId));
		return "board/noticeContent";
	}
	
	@RequestMapping(value="/editForm", method = RequestMethod.GET)
	public String editForm(@RequestParam("noticeId")int noticeId
			,@RequestParam("mode")String mode, Model model) {
		model.addAttribute("pageContent", boardService.getNoticeContent(noticeId));
		model.addAttribute("mode", mode);
		model.addAttribute("noticeVO", new NoticeVO());
		return "board/noticeForm";
	}
	
	@RequestMapping(value ="/deleteBoard", method = RequestMethod.GET)
	public String getNoticeDelete(RedirectAttributes rttr, @RequestParam("noticeId")int noticeId) {
		boardService.getNoticeDelete(noticeId);
		return "redirect:/board/noticePage";
	}
}
