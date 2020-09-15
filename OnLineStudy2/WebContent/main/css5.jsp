<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*,com.sist.dao.*"%>
<%
   // ������ �б�
   EmpDAO dao=new EmpDAO();
   ArrayList<MovieVO> list=dao.movieListData();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
#list-table{
  border: 1px solid black;
  border-collapse: collapse;
}
#list-table tr:nth-child(1) {
	background-color: #999;
	font-family: ���� ���
}
h1 {
     text-shadow: 5px 5px 3px #0f0;
}
.container{
  width:1300px;
  border:1px solid red;
}
.row {
   width:1200px;
   margin: 0px auto;
}
h1 {
   text-align:center;
}
img {
  width:30px;
  height:30px;
  border-radius: 30px;
}
#list-table td{
  border-bottom-width: 1px;
  border-bottom-style: dotted;
  border-bottom-color: black;
  font-family: ���� ���;
  font-size: 9pt;
}
#list-table .dataTr:hover{
   /*background-color: FC6;*/
   cursor: pointer;
}
</style>
</head>
<body>
  <%--
       id , class => �տ� ���ڸ� ����� �� ����
       
       JSP => ������ ���ؼ� ����� HTML�� ��� => AJAX , Modalâ
   --%>
  <div class="container">
    <div class="row">
     <h1>��ȭ���</h1>
     <table width=1200>
       <tr>
        <td><%--��� ��� --%>
          <table id="list-table" width=60%>
            <tr>
             <th>��ȣ</th>
             <th></th>
             <th>����</th>
             <th>����</th>
             <th>�帣</th>
            </tr>
            <%
               for(MovieVO vo:list)
               {
            %>
                  <tr class="dataTr">
                    <td><%=vo.getMno() %></td>
                    <td>
                      <img src="<%=vo.getPoster()%>">
                    </td>
                    <td><%=vo.getTitle() %></td>
                    <td><%=vo.getDirector() %></td>
                    <td><%=vo.getGenre() %></td>
                  </tr>
            <%
               }
            %>
          </table>
        </td>
        <td><%--�� ���� --%>
          <table id="detail-table" width=40%>
            
          </table>
        </td>
       </tr>
     </table>
    </div>
  </div>
</body>
</html>