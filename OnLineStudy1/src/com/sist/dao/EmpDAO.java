package com.sist.dao;
import java.util.*;
import java.sql.*;
public class EmpDAO {
  // ����Ŭ ����
  private Connection conn;
  // SQL���� ���� 
  private PreparedStatement ps;
  // ����Ŭ �ּ� ���� 
  private final String URL="jdbc:oracle:thin:@211.238.142.181:1521:XE";
  // ����Ŭ ���� => ����̹��� ��� (�ѹ��� ���� => ������)
  public EmpDAO()
  {
	  try
	  {
		  Class.forName("oracle.jdbc.driver.OracleDriver");
	  }catch(Exception ex) {}
  }
  // ���� 
  public void getConnection()
  {
	  try
	  {
		  // ����Ŭ�� conn hr/happy
		  conn=DriverManager.getConnection(URL,"hr","happy");
	  }catch(Exception ex) {}
  }
  // �ݱ� 
  public void disConnection()
  {
	  try
	  {
		  if(ps!=null)ps.close();
		  if(conn!=null) conn.close();
	  }catch(Exception ex) {}
  }
  
  public ArrayList<EmpVO> empListData()
  {
	  ArrayList<EmpVO> list=
			  new ArrayList<EmpVO>();
	  try
	  {
		  getConnection();
		  String sql="SELECT empno,ename,job,hiredate,sal "
				    +"FROM emp";
		  // ����
		  ps=conn.prepareStatement(sql);
		  // ���� ��� �� �ޱ�
		  ResultSet rs=ps.executeQuery();
		  while(rs.next())
		  {
			  EmpVO vo=new EmpVO();
			  vo.setEmpno(rs.getInt(1));
			  vo.setEname(rs.getString(2));
			  vo.setJob(rs.getString(3));
			  vo.setHiredate(rs.getDate(4));
			  vo.setSal(rs.getInt(5));
			  
			  list.add(vo);
		  }
		  rs.close();
	  }catch(Exception ex) {
		  System.out.println(ex.getMessage());
	  }
	  finally
	  {
		  disConnection();
	  }
	  return list;
  }
}
