package com.sist.dao;
	import java.util.*;
	import org.springframework.beans.factory.annotation.Autowired;
	import org.springframework.stereotype.Repository;
import com.sist.mapper.TempMapper;
import com.sist.vo.TempVO;


	@Repository
	public class TempDAO {
		 @Autowired
	     private TempMapper mapper;
	     
		 public List<TempVO> TempListData(Map map)
	     {
	    	 return mapper.TempListData(map);
	     }

	     public int TempTotalPage()
	     {
	  	   return mapper.TempTotalPage();
	     }
	     
		 public List<TempVO> TempCateData(Map map)
		 {
			 return mapper.TempCateData(map);
		 }
	     
	     public int TempCateTotalPage(int cate)
	     {
	  	   return mapper.TempCateTotalPage(cate);
	     }
	     
}
