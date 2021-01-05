package com.dongnebook.notice.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dongnebook.notice.model.service.NoticeService;
import com.dongnebook.notice.model.vo.Notice;
import com.dongnebook.notice.model.vo.NoticePageData;
import com.dongnebook.user.model.vo.User;

/**
 * @author 진수경
 *
 */

@Controller
@RequestMapping("/notice")
public class NoticeController {
	@Autowired
	private NoticeService service;
	
	@RequestMapping("/noticeList.do")
	public String noticeList(Model model, int reqPage) {
		NoticePageData npd = service.selectNoticeList(reqPage);
		
		model.addAttribute("list",npd.getList());
		model.addAttribute("pageNavi",npd.getPageNavi());
		
		return "notice/noticeList";
	}
	
	@RequestMapping("/noticeFrm.do")
	//로그인 했다는 가정하에 진행
	public String noticeFrm(User u,Model model,HttpSession session) {
		User loginUser = (User)session.getAttribute("loginUser");
		model.addAttribute("u",loginUser);
		return "notice/noticeFrm";
	}
	
	@RequestMapping("/insertNotice.do")
	public String insertNotice(Model model) {
		model.addAttribute("msg", "공지사항 등록 성공");
		model.addAttribute("loc", "/");
		return "common/msg";
	}
	
	@RequestMapping("/deleteNotice.do")
	public String deleteNotice(Model model) {
		model.addAttribute("msg", "삭제 성공");
		model.addAttribute("loc", "/");
		model.addAttribute("result",true);
		return "common/msg";
	}
}
