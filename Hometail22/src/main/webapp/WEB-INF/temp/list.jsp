<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>

<script type="text/javascript">


$(function() {
	
	$('.btn').click(function(){
		/* cate=$(this).attr("cate"); */
		$.ajax({
				type:'post',
				url:'../temp/list.do',
		/* 		data: {cate:cate},  */
				success:function(result)
				{
					$('#tagin').html(result);
				}
			})
	});
});
</script>

</head>
<body>
	<section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg_1.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-2 bread">임시보호</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="../main/main.do">Home</a></span></p>
          </div>
        </div>
      </div>
</section>
			
			
			<c:forEach items="${list }" var="vo">
				<div class="col-md-3 ftco-animated">
			   <div class="blog-entry">
			     <a href="../temp/detail.do?no=${vo.petno }" class="block-20" style="background-image: url('${vo.poster}');">
			     </a>
			     <div class="text d-flex py-4">
			       <div class="desc pl-4XX" style="width: calc(100%);">
			      
			         <h5><a href="../temp/detail.do?no=${vo.petno }" ></a></h5>
			         <h6><a href="../temp/detail.do?no=${vo.petno }" ><span style="color:#000000;">[보호중]</span>${vo.title }</a></h6>
			         <%-- <h6><a href="../temp/detail.do?no=${vo.petno }" style="color: black;">${vo.loc }</a></h6>
			         <h6><a href="../temp/detail.do?no=${vo.petno }" style="color: black;">실종날짜 : <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${vo.pdate}" /></a></h6>
			    	 --%>
			   </div>
			     </div>
			   </div>
			 </div>
			</c:forEach>
		</div>
	     	
		
		<div class="row no-gutters my-5">
			  <div class="col text-center">
			    <div class="block-27">
			      <ul>
			      	<c:if test="${curpage>BLOCK }">
			        	<li page="${startPage-1 }"><a style="cursor: pointer;">&lt;</a></li>
			        </c:if>
			        
			        <c:forEach var="i" begin="${startPage }" end="${endPage }">
			         	<c:if test="${i==curpage }">
		                     <li class="active" page="${i }">
		                         <a style="cursor: pointer;">${i }</a>
		                     </li> 
			            </c:if>
			            <c:if test="${i!=curpage }">
		                     <li page="${i }">
		                         <a style="cursor: pointer;">${i }</a>
		                     </li>
			        	</c:if>
			         </c:forEach>
			        
			        <c:if test="${endPage<totalpage }">
			        	<li page="${endPage+1 }"><a style="cursor: pointer;">&gt;</a></li>
			        </c:if>
			        
			      </ul>
			    </div>
			  </div>
		</div>
		</div>
   	  </div>
	</div>
</body>
</html>


