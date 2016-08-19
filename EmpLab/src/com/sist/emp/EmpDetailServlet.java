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
		
		//웹브라우저에서 볼수 있도록 list값 리턴
		
		PrintWriter out=response.getWriter();
		out.write("<html>");
		out.write("<body>");
		out.write("<center>");
		out.write("<h3>"+vo.getEname()+"님의 상세 정보</h3>");
		out.write("<table border=1 width=600>");
		out.write("<tr>");
		out.write("<td width=20% align=left>사번</td>");
		out.write("<td width=80% align=left>"+vo.getEmpno()+"</td>");		
		out.write("</tr>");		
		out.write("<tr>");
		out.write("<td width=20% align=left>이름</td>");
		out.write("<td width=80% align=left>"+vo.getEname()+"</td>");		
		out.write("</tr>");
		out.write("<tr>");
		out.write("<td width=20% align=left>사수</td>");
		out.write("<td width=80% align=left>"+vo.getMgr()+"</td>");		
		out.write("</tr>");
		out.write("<tr>");
		out.write("<td width=20% align=left>직위</td>");
		out.write("<td width=80% align=left>"+vo.getJob()+"</td>");		
		out.write("</tr>");
		out.write("<tr>");
		out.write("<td width=20% align=left>입사일</td>");
		out.write("<td width=80% align=left>"+vo.getHiredate()+"</td>");		
		out.write("</tr>");		
		out.write("<tr>");
		out.write("<td width=20% align=left>급여</td>");
		out.write("<td width=80% align=left>"+vo.getSal()+"</td>");		
		out.write("</tr>");		
		out.write("<tr>");
		out.write("<td width=20% align=left>성과급</td>");
		out.write("<td width=80% align=left>"+vo.getComm()+"</td>");		
		out.write("</tr>");
		out.write("<tr>");
		out.write("<td width=20% align=left>부서번호</td>");
		out.write("<td width=80% align=left>"+vo.getDeptno()+"</td>");		
		out.write("</tr>");		
		out.write("</table>");
		out.write("<table border=0 width=600>");
		out.write("<tr>");
		out.write("<td colspan=2 align=right onclick=javascript:history.back()>목록</td>");
		out.write("</tr>");
		out.write("</table>");
		out.write("</center>");
		out.write("</body>");
		out.write("</html>");
	}
}
