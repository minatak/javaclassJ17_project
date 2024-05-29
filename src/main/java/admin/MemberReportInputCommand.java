package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.report.ReportVO;

public class MemberReportInputCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String reportingMid = request.getParameter("reportingMid")==null ? "" : request.getParameter("reportingMid");
		String reportedMid = request.getParameter("reportedMid")==null ? "" : request.getParameter("reportedMid");
		String reason = request.getParameter("reason")==null ? "" : request.getParameter("reason");
		
		AdminDAO dao = new AdminDAO();
		ReportVO vo = new ReportVO();
		
		vo.setReportingMid(reportingMid);
		vo.setReportedMid(reportedMid);
		vo.setReason(reason);
		
		int res = dao.setMemberReportInput(vo);
		
		response.getWriter().write(res + "");

	}

}
