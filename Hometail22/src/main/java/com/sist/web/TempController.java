package com.sist.web;

	import org.springframework.beans.factory.annotation.Autowired;
	import org.springframework.stereotype.Controller;
	import org.springframework.ui.Model;
	import org.springframework.web.bind.annotation.RequestMapping;
	import com.sist.dao.TempDAO;
	import com.sist.vo.TempVO;

	import java.util.*;

	@Controller
	public class TempController {
		@Autowired
		private TempDAO dao;

		@RequestMapping("temp/list.do")
		public String Temp_list(String page,int cate,Model model)
		{
			
			if(page==null)
			page="1";
			   int curpage=Integer.parseInt(page);
			   Map map=new HashMap();
			   int rowSize=12;
			   int start=(rowSize*curpage)-(rowSize-1);
			   int end=rowSize*curpage;
			   map.put("start", start);
			   map.put("end", end);
			   List<TempVO> list=dao.TempCateData(map);
			   int totalpage=dao.TempTotalPage();
			   // 전송 
			   int BLOCK = 6;
				int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
				int endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;
				if (endPage > totalpage)
					endPage = totalpage;
			  model.addAttribute("list", list);
			  model.addAttribute("curpage", curpage);
			  model.addAttribute("totalpage", totalpage);
			  model.addAttribute("BLOCK", BLOCK);
			  model.addAttribute("startPage", startPage);
			  model.addAttribute("endPage", endPage);
			  //model.addAttribute("main_jsp", "../temp/list.jsp");
			   return "temp/list";	     
			 }
			 
			 
		/*
		@RequestMapping("Temp/detail.do")
		public String Temp_Detail(String no,Model model)
		{
			
			TempVO vo=dao.TempDetailData(Integer.parseInt(no));
			model.addAttribute("vo", vo);
			
			return "Temp/detail";
		}*/
		
		
	}



