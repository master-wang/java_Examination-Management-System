package cn.itcast.web.util.servlet.user;

import cn.itcast.web.util.dao.UserDao;
import cn.itcast.web.util.dao.impl.UserDaoimpl;
import cn.itcast.web.util.domain.User;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/userregister/login")
public class UserLogin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("application/json;charset=utf-8");
        Map<String, String[]> map = req.getParameterMap();
        User user = new User();
        try {
            BeanUtils.populate(user,map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        System.out.println("获取的参数信息："+user);
        UserDao dao = new UserDaoimpl();
        User loginInfo;
        if(user.getIs_admin().equals("false")){
            loginInfo = dao.login(user);
        }else{
            loginInfo = dao.loginAdmin(user);
        }


        HttpSession session = req.getSession();
        session.setAttribute("user",loginInfo);

        System.out.println("登录的信息"+loginInfo);
        Map<String,Object> mapa = new HashMap<String, Object>();
        if (loginInfo!=null){
            if(loginInfo.getIs_admin().equals("true")){
                mapa.put("stadus","ok");
                mapa.put("code",1);
                mapa.put("msg","登陆成功！");
                mapa.put("loginInfo",loginInfo);
            }else {
                mapa.put("stadus","ok");
                mapa.put("code",0);
                mapa.put("msg","登陆成功！");

                mapa.put("loginInfo",loginInfo);
            }


        }else {
            mapa.put("stadus","no");
            mapa.put("code",0);
            mapa.put("msg","账号密码错误！");

        }
        ObjectMapper mapper = new ObjectMapper();
        mapper.writeValue(resp.getWriter(),mapa);
    }
}
