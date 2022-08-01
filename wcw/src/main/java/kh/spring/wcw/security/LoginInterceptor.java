package kh.spring.wcw.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import kh.spring.wcw.company.domain.Company;
import kh.spring.wcw.employee.domain.Employee;

public class LoginInterceptor implements HandlerInterceptor{
	//preHandle() : 실제 controller(handler)가 실행되기 전에 실행되며 boolean 타입의 값을 return 한다. 
		//				true이면 요청한 handler를 처리하고 false이면 처리하지 않는다.
		@Override
		public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
				throws Exception {
			
			// 현재 URL
			String requestURL = request.getRequestURI().substring(request.getContextPath().length());
			
			//session 객체를 가져옴
			HttpSession session = request.getSession();
			//login처리를 담당하는 사용자 정보를 담고 있는 객체를 가져옴
			Employee loginSSInfo = (Employee)session.getAttribute("loginSSInfo");
			Company CompanySSinfo = (Company)session.getAttribute("CompanySSinfo");
			
			if(requestURL.startsWith("/hr")) {
				if(CompanySSinfo != null || (loginSSInfo != null && loginSSInfo.getHr_yn().equals("Y"))) {
					return true;
				} else {
					System.out.println("관리자 페이지 접근 불가");
					response.sendRedirect(request.getContextPath() + "/");
					return false;
				}
			}
			
			// 로그인이 되어있지 않음 상태
			if(loginSSInfo == null && CompanySSinfo == null) {
				response.sendRedirect("/");
				//더이상 컨트롤러 요청으로 가지 않도록 false로 반환
				return false;
			}
			
			// preHandle의 return은 컨트롤러 요청 uri로 가도 되냐 안되냐를 허가하는 의미임
	        // 따라서 true로하면 컨트롤러 uri로 가게 됨.
	        return true;
		}

}
