package cn.itcast.web.util.servlet.bokao;

import cn.itcast.web.util.dao.TestListDao;
import cn.itcast.web.util.dao.UserDao;
import cn.itcast.web.util.dao.impl.TestListDaoimpl;
import cn.itcast.web.util.dao.impl.UserDaoimpl;
import cn.itcast.web.util.domain.Test_list;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/getBoKaoList")
public class GetBoKaoList extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("application/json;charset=utf-8");
        TestListDao dao = new TestListDaoimpl();
        List list = dao.getCokaoLidt();

        System.out.println("博考的列表："+list);
        Map<String,Object> mapa = new HashMap<String, Object>();
        mapa.put("stadus","ok");
        mapa.put("msg","获取用户列表成功！");
        mapa.put("Userlist",list);
        ObjectMapper mapper = new ObjectMapper();
        mapper.writeValue(resp.getWriter(),mapa);
    }
}
