package com.sist.emp;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.dao.EmpDAO;
import com.sist.dao.EmpVO;

public class EmpDetailServlet extends HttpServlet{
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=EUC-KR");
		
		EmpDAO dao=EmpDAO.newInstance();
				
		String empno=request.getParameter("empno");
		
		EmpVO vo=dao.empDetailData(Integer.parseInt(empno));
		
		//������������ ���� �ֵ��� list�� ����
		
		PrintWriter out=response.getWriter();
		out.write("<html>");
		out.write("<body>");
		out.write("<center>");
		out.write("<h3>"+vo.getEname()+"���� �� ����</h3>");
		out.write("<table border=1 width=600>");
		out.write("<tr>");
		out.write("<td width=20% align=left>���</td>");
		out.write("<td width=80% align=left>"+vo.getEmpno()+"</td>");		
		out.write("</tr>");		
		out.write("<tr>");
		out.write("<td width=20% align=left>�̸�</td>");
		out.write("<td width=80% align=left>"+vo.getEname()+"</td>");		
		out.write("</tr>");
		out.write("<tr>");
		out.write("<td width=20% align=left>���</td>");
		out.write("<td width=80% align=left>"+vo.getMgr()+"</td>");		
		out.write("</tr>");
		out.write("<tr>");
		out.write("<td width=20% align=left>����</td>");
		out.write("<td width=80% align=left>"+vo.getJob()+"</td>");		
		out.write("</tr>");
		out.write("<tr>");
		out.write("<td width=20% align=left>�Ի���</td>");
		out.write("<td width=80% align=left>"+vo.getHiredate()+"</td>");		
		out.write("</tr>");		
		out.write("<tr>");
		out.write("<td width=20% align=left>�޿�</td>");
		out.write("<td width=80% align=left>"+vo.getSal()+"</td>");		
		out.write("</tr>");		
		out.write("<tr>");
		out.write("<td width=20% align=left>������</td>");
		out.write("<td width=80% align=left>"+vo.getComm()+"</td>");		
		out.write("</tr>");
		out.write("<tr>");
		out.write("<td width=20% align=left>�μ���ȣ</td>");
		out.write("<td width=80% align=left>"+vo.getDeptno()+"</td>");		
		out.write("</tr>");		
		out.write("</table>");
		out.write("<table border=0 width=600>");
		out.write("<tr>");
		out.write("<td colspan=2 align=right onclick=javascript:history.back()>���</td>");
		out.write("</tr>");
		out.write("</table>");
		out.write("</center>");
		out.write("</body>");
		out.write("</html>");
	}
}
