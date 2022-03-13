package com.kh.iag.attend.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.iag.attend.entity.AttendPageDTO;
import com.kh.iag.attend.entity.AttendWTDTO;
import com.kh.iag.attend.service.attendService;
import com.kh.iag.user.entity.UserDto;

@Controller
@RequestMapping("attend")
public class AttendStateController 
{
	@Autowired
	private attendService service;
	
	@GetMapping(value = {"/attendstate/{page}", "/attendstate"})
	public String attendState(Model model, HttpServletRequest req, @PathVariable(required = false) String page) throws Exception
	{
		if(page == null) 
		{
			return "redirect:attendstate/1";
		}
		
		int cntPerPage = 5;
		int pageBtnCnt = 10; 
		int totalRow = service.getAttendStateCnt();
		
		System.out.println("전체 컬럼 갯수 : " + totalRow);
		
		AttendPageDTO AttendpageDTO = new AttendPageDTO(page, cntPerPage, pageBtnCnt, totalRow);
		
		int aaaa = AttendpageDTO.getStartPage();
		int bbbb = AttendpageDTO.getEndPage();
		
		System.out.println("시작 페이지 : " + aaaa);
		System.out.println("끝 페이지 : " + bbbb);
		
		UserDto loginUser = (UserDto) req.getSession().getAttribute("loginUser");
		String userNo = loginUser.getUserNo();
	
		List<AttendWTDTO> attendWTList = service.getWorktimeList(AttendpageDTO, userNo);
		
		model.addAttribute("WTInfo", attendWTList);
		model.addAttribute("page", AttendpageDTO);

		return "attend/attendstate";
	}
	
	@PostMapping("attendstatesearch")
	public String attendStateSearch(HttpServletRequest req)
	{
		AttendWTDTO attendWTDTO = new AttendWTDTO();
		
		UserDto loginUser = (UserDto) req.getSession().getAttribute("loginUser");
		String userNo = loginUser.getUserNo();
		
		attendWTDTO.setUser_no(userNo);
		
		
//		List<AttendWTDTO> WTList = service.searchAttendWTInfo(attendWTDTO);
		
		
		
		return "attend/attendstate";
	}
}
