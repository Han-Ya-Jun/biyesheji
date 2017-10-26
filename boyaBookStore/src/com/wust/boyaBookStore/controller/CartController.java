package com.wust.boyaBookStore.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wust.boyaBookStore.po.Book;
import com.wust.boyaBookStore.po.Cartitem;
import com.wust.boyaBookStore.po.User;
import com.wust.boyaBookStore.service.BookService;
import com.wust.boyaBookStore.service.CartService;


/**
 * @ClassName CartController
 * @Description TODO(购物车控制器)
 * @author hanyajun
 * @Date 2017年5月12日 上午10:50:22
 * @version 1.0.0
 */
@Controller
public class CartController {
    @Autowired
    private CartService cartItemService;
    @Autowired
    private BookService bookService;

    /**
     * 加载多个CartItem
     * 
     * @param req
     * @param resp
     * @return
     * @throws ServletException
     * @throws IOException
     */
    @RequestMapping("/loadCardItems")
    public String loadCartItems(HttpServletRequest req,  String cartItemIds) throws ServletException, IOException {
        /*
         * 1. 获取cartItemIds参数
         */
        double total = Double.parseDouble(req.getParameter("total"));
        /*
         * 2. 通过service得到List<CartItem>
         */
        List<Cartitem> cartItemList = cartItemService.loadCartItems(cartItemIds);
        /*
         * 3. 保存，然后转发到/cart/showitem.jsp
         */
        req.setAttribute("cartItemList", cartItemList);
        req.setAttribute("total", total);
        req.setAttribute("cartItemIds", cartItemIds);
        return "jsps/cart/showitem";
    }
    @RequestMapping("/updateQuantity")
    public @ResponseBody Cartitem updateQuantity(HttpServletRequest req, int quantity,  String cartItemId)
            throws ServletException, IOException {
        Cartitem cartItem = cartItemService.updateQuantity(cartItemId, quantity);
        updatesamllcart(req);
        return cartItem;
    }

    /**
     * 批量删除功能
     * 
     * @param req
     * @param resp
     * @return
     * @throws ServletException
     * @throws IOException
     */
    @RequestMapping("/batchaDelete")
    public void batchDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        /*
         * 1. 获取cartItemIds参数 2. 调用service方法完成工作 3. 返回到list.jsp
         */
        String cartItemIds = req.getParameter("cartItemIds");
        cartItemService.batchDelete(cartItemIds);
        updatesamllcart(req);
       // String url2="/boyaBookStore/Mycart.action"; 
       
        PrintWriter out = resp.getWriter();  
        out.println("<html>");      
        out.println("<script>");  
        out.println("window.open ('/boyaBookStore/user/commen/shopproduct_login.jsp','_parent')");  
        
        out.println("</script>");      
        out.println("</html>");
       
   
    }

    @RequestMapping("/batchaDelete2")
    public String batchDelete2(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        /*
         * 1. 获取cartItemIds参数 2. 调用service方法完成工作 3. 返回到list.jsp
         */
        String cartItemIds = req.getParameter("cartItemIds");
        cartItemService.batchDelete(cartItemIds);
      
        return "redirect:first.action";
    }
    /**
     * 添加购物车条目
     * 
     * @param req
     * @param resp
     * @return
     * @throws ServletException
     * @throws IOException
     */
    @RequestMapping("/add")
    public String add(HttpServletRequest req, HttpServletResponse resp, Cartitem cartItem,Book book) throws Exception, IOException {
      
        User user = (User) req.getSession().getAttribute("sessionUser");
        cartItem.setBook(book);
        cartItem.setUser(user);
        cartItem.setUid(user.getUid());
        /*
         * 2. 调用service完成添加
         */
        cartItemService.add(cartItem);
        req.setAttribute("add", "add");
        updatesamllcart(req);
        /*
         * 3. 查询出当前用户的所有条目，转发到list.jsp显示
         */
        return myCart(req, resp);
    }
    
    @RequestMapping("/firstadd")
    public String add2(HttpServletRequest req, HttpServletResponse resp, Cartitem cartItem,Book book) throws Exception, IOException {
      
        User user = (User) req.getSession().getAttribute("sessionUser");
        cartItem.setBook(book);
        cartItem.setUser(user);
        cartItem.setUid(user.getUid());
        /*
         * 2. 调用service完成添加
         */
        cartItemService.add(cartItem);
        List<Book> newBook = bookService.findBookBytype(1);
        updatesamllcart(req);
        req.setAttribute("newBook", newBook);
        /*
         * 3. 查询出当前用户的所有条目，转发到list.jsp显示
         */
        return "user/commen/index";
    }
    
    @RequestMapping("/first2add")
    public String add3(HttpServletRequest req, HttpServletResponse resp, Cartitem cartItem,Book book) throws Exception, IOException {
      
        User user = (User) req.getSession().getAttribute("sessionUser");
        cartItem.setBook(book);
        cartItem.setUser(user);
        cartItem.setUid(user.getUid());
        /*
         * 2. 调用service完成添加
         */
        cartItemService.add(cartItem);
        List<Book> newBook = bookService.findBookBytype(1);
        updatesamllcart(req);
        req.setAttribute("newBook", newBook);
        String url2="myCart.action";
        /*
         * 3. 查询出当前用户的所有条目，转发到list.jsp显示
         */
        return "redirect:loginfirst.action?url2="+url2;
    }
    /**
     * 我的购物车
     * 
     * @param req
     * @param resp
     * @return
     * @throws ServletException
     * @throws IOException
     */
    @RequestMapping("/myCart")
    public String myCart(HttpServletRequest req, HttpServletResponse resp) throws Exception, IOException {
        /*
         * 1. 得到uid
         */
        User user = (User) req.getSession().getAttribute("sessionUser");
        String uid = user.getUid();
        /*
         * 2. 通过service得到当前用户的所有购物车条目
         */
        List<Cartitem> cartItemLIst = cartItemService.myCart(uid);
        /*
         * 3. 保存起来，转发到/cart/list.jsp
         */
        req.setAttribute("cartItemList", cartItemLIst);
        return "jsps/cart/list";
    }
    
    public void updatesamllcart(HttpServletRequest req){
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
            ServletContext context = req.getServletContext();
            
            context.setAttribute("cartItemList", cartItemLIst);
            context.setAttribute("cartsize", cartItemLIst.size());
            context.setAttribute("sum",sumsubtotal2(cartItemLIst));
        }
        
        
    }
    public String sumsubtotal2(List<Cartitem> cartItemLIst){
        double sum=0;
        for (Cartitem cartitem : cartItemLIst) {
            sum+=cartitem.getSubtotal();
       }
        DecimalFormat df = new DecimalFormat("#.0");
        return df.format(sum);
    }
}
