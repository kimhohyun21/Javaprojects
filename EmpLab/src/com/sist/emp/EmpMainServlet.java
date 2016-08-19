package com.sist.emp;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.dao.*;
import java.io.*;
import java.util.*;

public class EmpMainServlet extends HttpServlet{
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
	}
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=EUC-KR");
		
		EmpDAO dao=EmpDAO.newInstance();
		
		ArrayList<EmpVO> list=dao.empAllData();
		
		//������������ ���� �ֵ��� list�� ����
		PrintWriter out=response.getWriter();
		out.write("<html>");
		out.write("<body>");
		out.write("<center>");
		out.write("<h3>������</h3>");
		out.write("<table border=0 width=450>");
		out.write("<tr bgcolor=#ccccff>");
		out.write("<th>���</th>");
		out.write("<th>�̸�</th>");
		out.write("<th>����</th>");
		out.write("<th>�Ի���</th>");
		out.write("</tr>");
		
		for(EmpVO vo : list){
			out.write("<tr>");
			out.write("<td>"+vo.getEmpno()+"</td>");
			out.write("<td><a href=EmpDetailServlet?empno="+vo.getEmpno()+">"+vo.getEname()+"</a></td>");
			out.write("<td>"+vo.getJob()+"</td>");
			out.write("<td>"+vo.getHiredate().toString()+"</td>");
			out.write("</tr>");
		}
		
		out.write("</table>");
		out.write("<hr width=450/>");
		out.write("</center>");
		out.write("</body>");
		out.write("</html>");
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
}
