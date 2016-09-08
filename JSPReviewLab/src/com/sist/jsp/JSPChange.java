package com.sist.jsp;

public class JSPChange {
	private static String[] jsp={
		"default.jsp",
		"directive.jsp",
		"scriptlet.jsp",
		"request.jsp",
		"response.jsp",
		"session.jsp",
		"application.jsp",
		"pageContext.jsp",
		"action.jsp",
		"database.jsp"		
	};
	
	//외부에서 jps배열을 접근할 수 있는 메소드 정의
	public static String change(int no){		
		return jsp[no];
	};
}
