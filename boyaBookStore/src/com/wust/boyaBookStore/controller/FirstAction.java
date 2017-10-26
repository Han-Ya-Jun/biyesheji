package com.wust.boyaBookStore.controller;


import java.text.DecimalFormat;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wust.boyaBookStore.po.Book;
import com.wust.boyaBookStore.po.Cartitem;
import com.wust.boyaBookStore.po.Category;
import com.wust.boyaBookStore.po.PageBean;
import com.wust.boyaBookStore.po.User;
import com.wust.boyaBookStore.service.BookService;
import com.wust.boyaBookStore.service.CartService;
import com.wust.boyaBookStore.service.CategoryService;
import com.wust.boyaBookStore.service.UserService;


@Controller
public class FirstAction {
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private BookService bookService;
    @Autowired
    private UserService userService;
    @Autowired
    private CartService cartItemService;
	//系统首页
	@RequestMapping("/first")
	public String first(HttpServletRequest req,String msg)throws Exception{
	    List<Category> parents2 = categoryService.findAll();
	    User user = (User) req.getSession().getAttribute("sessionUser");
	    ServletContext servletContext = req.getServletContext();
	    servletContext.setAttribute("parents2", parents2);
	    if (user!=null) {
	        String uid = user.getUid();
	        /*
	         * 2. 通过service得到当前用户的所有购物车条目
	         */
	        List<Cartitem> cartItemLIst = cartItemService.myCart(uid);
	        /*
	         * 3. 保存起来，转发到/cart/list.jsp
	         */
	        user = userService.getUser(user);
	        req.setAttribute("sessionUser", user);
	        req.setAttribute("cartItemList", cartItemLIst);
	        req.setAttribute("cartsize", cartItemLIst.size());
	        req.setAttribute("sum",sumsubtotal2(cartItemLIst));
        }
	   List<Book> newBook = bookService.findBookBytype(1);
	    req.setAttribute("msg", msg);
	    req.setAttribute("newBook", newBook);
		return "user/commen/index";
	}
	 public String sumsubtotal2(List<Cartitem> cartItemLIst){
	     double sum=0;
	     for (Cartitem cartitem : cartItemLIst) {
	         sum+=cartitem.getSubtotal();
        }
	     DecimalFormat df = null;
	     if (sum>0) {
	         df= new DecimalFormat("#.0");
        }
	  
	     return df.format(sum);
	 }
	@RequestMapping("/loginfirst")
    public String loginfirst(HttpServletRequest req,String url2,String type,String msg,String pid,String total,String cartItemIds,User formUser)throws Exception{
        List<Category> parents2 = categoryService.findAll();
        User user = (User) req.getSession().getAttribute("sessionUser");
        if (user!=null) {
            user = userService.getUser(user);
            req.getSession().setAttribute("sessionUser", user);
            String uid = user.getUid();
            /*
             * 2. 通过service得到当前用户的所有购物车条目
             */
            List<Cartitem> cartItemLIst = cartItemService.myCart(uid);
            /*
             * 3. 保存起来，转发到/cart/list.jsp
             */
            req.setAttribute("cartItemList", cartItemLIst);
            req.setAttribute("cartsize", cartItemLIst.size());
            req.setAttribute("sum",sumsubtotal2(cartItemLIst));
        }
        if (cartItemIds !=null) {
             url2="/boyaBookStore/loadCardItems.action?total="+total+"&cartItemIds="+cartItemIds;
        }
        if (url2!=null) {
           req.setAttribute("cart", "cart");
           
        }
        if (type!=null&&type.equals("combination")) {
            String bname = req.getParameter("bname");
            String press = req.getParameter("press");
            String author = req.getParameter("author");
            url2="/boyaBookStore/findBycombination.action?bname="+bname+"&press="+press+"&author="+author;
        }
        List<Book> cheapBook = bookService.findBookBytype(2);
        req.setAttribute("cheapBook", cheapBook);
        req.setAttribute("url2", url2);
        req.setAttribute("pid", pid);
        req.setAttribute("msg", msg);
        req.setAttribute("user", formUser);
        req.setAttribute("parents2", parents2);
        return "user/commen/shopproduct_login";
    }
	  /**
     * 获取当前页码
     * 
     * @param req
     * @return
     */
    private int getPc(String param) {
        int pc = 1;
        if (param != null && !param.trim().isEmpty()) {
            try {
                pc = Integer.parseInt(param);
            } catch (RuntimeException e) {
            }
        }
        return pc;
    }

    /**
     * 截取url，页面中的分页导航中需要使用它做为超链接的目标！
     * 
     * @param req
     * @return
     */
    /*
     * http://localhost:8080/goods/BookServlet?methed=findByCategory&cid=xxx&pc=3 /goods/BookServlet +
     * methed=findByCategory&cid=xxx&pc=3
     */
    private String getUrl(HttpServletRequest req) {
        String url = req.getRequestURI() + "?" + req.getQueryString();
        /*
         * 如果url中存在pc参数，截取掉，如果不存在那就不用截取。
         */
        int index = url.lastIndexOf("&pc=");
        if (index != -1) {
            url = url.substring(0, index);
        }
        return url;
    }

	@RequestMapping("/first2")
    public String first2(HttpServletRequest req,String cid,String pc,String pid)throws Exception{
        List<Category> parents2 = categoryService.findAll();
        req.setAttribute("parents2", parents2);
        User user = (User) req.getSession().getAttribute("sessionUser");
        if (user!=null) {
            String uid = user.getUid();
        /*
         * 2. 通过service得到当前用户的所有购物车条目
         */
        List<Cartitem> cartItemLIst = cartItemService.myCart(uid);
        /*
         * 3. 保存起来，转发到/cart/list.jsp
         */
        req.setAttribute("cartItemList", cartItemLIst);
        req.setAttribute("cartsize", cartItemLIst.size());
        req.setAttribute("sum",sumsubtotal2(cartItemLIst));
            
            user = userService.getUser(user);
            req.getSession().setAttribute("sessionUser", user);
        }
        
        /*t
         * 1. 得到pc：如果页面传递，使用页面的，如果没传，pc=1
         */
        int pc2 = getPc(pc);
        /*
         * 2. 得到url：...
         */
        String url = getUrl(req);
        /*
         * 4. 使用pc和cid调用service#findByCategory得到PageBean
         */
        PageBean<Book> pb = bookService.findByCategory(cid,pc2);
        /*
         * 5. 给PageBean设置url，保存PageBean，转发到/jsps/book/list.jsp
         */
        pb.setUrl(url);
        req.setAttribute("pb", pb);
        req.setAttribute("cid", cid);
        req.setAttribute("pid", pid);
        return "user/commen/shopproduct";
    }
}	
