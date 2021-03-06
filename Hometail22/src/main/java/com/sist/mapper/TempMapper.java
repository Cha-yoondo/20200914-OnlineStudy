	package com.sist.mapper;
	import java.util.List;
	import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

	import com.sist.vo.TempVO;

public interface TempMapper {
			@Select("SELECT petno,id,title,cate,kind,poster,pdate,loc,num "
				+ "FROM (SELECT petno,id,title,cate,kind,poster,pdate,loc,num,rownum as num "
		  		+ "FROM (SELECT petno,id,title,cate,kind,poster,pdate,loc,num "
		  		+ "FROM pet_board ORDER BY petno DESC)) "
		  		+"WHERE num BETWEEN #{start} AND #{end}")
		
			public List<TempVO> TempListData(Map map);
			@Select("SELECT CEIL(COUNT(*)/8.0) FROM pet_board")
			
			public int TempTotalPage();
				@Select("SELECT petno,id,title,cate,kind,poster,pdate,loc,num "
				+ "FROM (SELECT petno,id,title,cate,kind,poster,pdate,loc,num,rownum as num "
		  		+ "FROM (SELECT petno,id,title,cate,kind,poster,pdate,loc,num "
		  		+ "FROM pet_board WHERE cate=#{cate} ORDER BY petno DESC)) "
		  		+"WHERE num BETWEEN #{start} AND #{end}")
			public List<TempVO> TempCateData(Map map);
		
		@Select("SELECT CEIL(COUNT(*)/8.0) FROM pet_board WHERE cate=#{cate}")
		public int TempCateTotalPage(int cate);
		
		@Select("SELECT * FROM pet_board WHERE petno=#{petno}")
		public TempVO TempDetailData(int petno);
		
		@Insert("INSERT INTO pet_board VALUES cate=#{cate}")
		public TempVO TempListData(int cate);
	

	
		
	}

