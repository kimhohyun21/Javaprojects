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
	
	//�ܺο��� jps�迭�� ������ �� �ִ� �޼ҵ� ����
	public static String change(int no){		
		return jsp[no];
	};
}
