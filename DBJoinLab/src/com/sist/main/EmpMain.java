package com.sist.main;

import com.sist.dao.*;
import java.util.*;

public class EmpMain {
	public static void main(String[] args){
		EmpDAO dao=new EmpDAO();
		List<EmpVO> list=dao.empAllData();
		
		for(EmpVO vo : list){
			System.out.println(vo.getEname()+" "+vo.getJob()+" "
							  +vo.getHiredate()+" "
							  +vo.getDvo().getDname()+" "
							  +vo.getDvo().getLoc()+" "
							  +vo.getSvo().getGrade());
		}
	}
}
