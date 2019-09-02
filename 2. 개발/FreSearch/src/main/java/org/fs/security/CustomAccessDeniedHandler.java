package org.fs.security;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomAccessDeniedHandler implements AccessDeniedHandler {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response, AccessDeniedException accessException) 
			throws IOException, ServletException {
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html; charset=utf-8");
		out.println("<script language='javascript'>");
		out.println("alert('권한이 없습니다.')");
		out.println("location.href='/research/research_list'");
		out.println("</script>");
		out.flush();
		
		/* response.sendRedirect("/accessError"); */
	}
}
