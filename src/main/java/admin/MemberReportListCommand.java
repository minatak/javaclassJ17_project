package admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.report.ReportVO;

public class MemberReportListCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminDAO dao = new AdminDAO();
		
		ArrayList<ReportVO> vos = dao.getReportList();
		
		request.setAttribute("vos", vos);
		request.setAttribute("reportCnt", vos.size());
	}

}
