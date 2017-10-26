package com.wust.boyaBookStore.controller.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.wust.boyaBookStore.po.User;
import com.wust.boyaBookStore.utils.ResourcesUtil;
/**
 * 
 * @ClassName LoginInterceptor
 * @Description TODO(用户身份认证拦截器)
 * @author hujingping
 * @Date 2017年3月28日 上午10:03:22
 * @version 1.0.0
 */
public class LoginInterceptor implements HandlerInterceptor {
   
	//在执行handler之前来执行的
	//用于用户认证校验、用户权限校验
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		
		//得到请求的url
		String url = request.getRequestURI();
		
		//判断是否是公开 地址
		//实际开发中需要公开 地址配置在配置文件中
		//从配置中取逆名访问url
		
		List<String> open_urls = ResourcesUtil.gekeyList("anonymousURL");
        //遍历公开 地址，如果是公开 地址则放行
        for(String open_url:open_urls){
            if(url.indexOf(open_url)>=0){
              //判断用户身份在session中是否存在  
                HttpSession session = request.getSession();
                User activeUser = (User) session.getAttribute("sessionUser");
                if (activeUser!=null) {
                    //如果是公开 地址则放行
                    return true;
                }else{
                    request.setAttribute("msg", "请先登陆！");
                    if (url.indexOf("firstadd.action")>=0||url.indexOf("first2add.action")>=0) {
                        request.getRequestDispatcher("/jsps/user/login2.jsp").forward(request, response);
                        
                    }else {
                        request.getRequestDispatcher("/jsps/user/login.jsp").forward(request, response);
                    }
                   return false;
                }
               
            }
        }
        
		/*return flag;
		//判断用户身份在session中是否存在  
		HttpSession session = request.getSession();
		User activeUser = (User) session.getAttribute("sessionUser");
		//如果用户身份在session中存在放行
		if(activeUser!=null){
			return true;
		}
		//执行到这里拦截，跳转到登陆页面，用户进行身份认证
		request.getRequestDispatcher("loginfirst.action?url2=boyaBookStore/jsps/user/login.jsp").forward(request, response);
		*/
		//如果返回false表示拦截不继续执行handler，如果返回true表示放行
		return true;
	}
	//在执行handler返回modelAndView之前来执行
	//如果需要向页面提供一些公用 的数据或配置一些视图信息，使用此方法实现 从modelAndView入手
	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	    
		
	}
	//执行handler之后执行此方法
	//作系统 统一异常处理，进行方法执行性能监控，在preHandle中设置一个时间点，在afterCompletion设置一个时间，两个时间点的差就是执行时长
	//实现 系统 统一日志记录
	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		System.out.println("HandlerInterceptor1...afterCompletion");
	}

}
