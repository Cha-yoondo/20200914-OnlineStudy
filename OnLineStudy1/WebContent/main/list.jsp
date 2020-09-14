<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*,com.sist.dao.*"%>
<%
    /*
            =>�ڹ� : ����Ŭ <==> HTML�� ��������ִ� ���� 
            =>����Ŭ : ������ �ʿ��� �����͸� �����ϴ� ���� 
            =>HTML : ����� => ȭ���� ������ ���� 
              CSS  : HTML�� ������ (������ ����)
            =>JavaScript : ������ �ȿ��� �̺�Ʈ �߻� (���콺 Ŭ��...)
    */
    // ����Ŭ �����͸� �о�´� 
    EmpDAO dao=new EmpDAO();
    ArrayList<MovieVO> list=dao.movieListData();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
#table_content{
  border-collapse:collapse;/*���μ��� �Ѱ��� ����*/
  border-top-width: 2px;/*���κп� ����*/
  border-top-color: #333;/*���� ȸ��*/
  border-top-style: solid;/*�Ϲ� ���μ�*/
  
  border-bottom-width: 1px;/*�Ʒ� ���μ� �߰�*/
  border-bottom-color: #333;
  border-bottom-style: solid;
}
/*
    th,td�� �������� ���� �κ� 
*/
#table_content th,td{
  /*
      margin : top left bottom right
      margin-top
      margin-left
      margin-bottom
      margin-right
      
      ��)
       margin : 0px (),(),()
                    0px 0px 0px
       margin : 50px 20px 
                50px 20px 50px 20px
                top=bottom left=right
                
       margin : 50 20 30 => �ڵ����� left(20)
       
       => bottom���� �����Ǹ� => top���� ���� 
       => right���� �����̵Ǹ� => left���� ����
       => padding�� ���� ������� ���� 
  */
   margin: 0px;
   padding: 8px;
   font-size: 9pt;
}
/* th�� �����Ǵ� �κ�*/
#table_content th{
   background-color: #999;
   color:white;
   border-bottom-width: 1px;
   border-bottom-color: #333;
}
/* td�� ������ �ִ� �κ�*/
#table_content td{
   border-bottom-width: 1px;
   border-bottom-color: #333;
   border-bottom-style: dotted;
}
/*
   ���� 
   1) ������ Į����� : black , red...
   2) 16���� #CCCCFF
   3) RGB(255,255,255) => �׸��� 
   
     ���ϴ� ��ġ�� ���� : nth-child(2n+1) ==> 2n+1 ==> n(0) 1 3 5...
                            3n+1
*/
#table_content tr:nth-child(2n+1)
{
   background-color: RGB(255,255,200);   
}
#table_content .dataTr:hover{
   background-color: #FC6;
   cursor: pointer;/*Hand_Cursor*/
}
img {
  border-radius: 12px;/*Ÿ���������� ��� */
}
</style>
</head>
<body>
  <center>
    <h1>��ȭ���</h1>
    <table id="table_content" width=900>
      <tr>
        <th>��ȣ</th>
        <th></th>
        <th>����</th>
        <th>����</th>
        <th>�⿬</th>
        <th>�帣</th>
        <%--
          <th> : ��� ����
         --%>
      </tr>
      <%-- ��� --%>
      <%
         for(MovieVO vo:list)
         {
      %>
            <tr class="dataTr">
              <td align=center><%=vo.getMno() %></td>
              <td align=center>
                <img src="<%=vo.getPoster() %>" width=35 height=35>
              </td>
              <td><%=vo.getTitle() %></td>
              <td><%=vo.getDirector() %></td>
              <td><%=vo.getActor() %></td>
              <td><%=vo.getGenre() %></td>
            </tr>
      <%
         }
      %>
    </table>
  </center>
</body>
</html>