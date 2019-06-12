package cn.itcast.web.util.servlet.bokao;

import cn.itcast.web.util.dao.TestListDao;
import cn.itcast.web.util.dao.UserDao;
import cn.itcast.web.util.dao.impl.TestListDaoimpl;
import cn.itcast.web.util.dao.impl.UserDaoimpl;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/deleteBokaoById")
public class DeleteBokaoById extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("application/json;charset=utf-8");
        String id = req.getParameter("id");
        System.out.println("要删除的id"+id);

        TestListDao dao = new TestListDaoimpl();
        dao.deleteKaoBoById(Integer.parseInt(id));
        Map<String,Object> mapa = new HashMap<String, Object>();
        mapa.put("stadus","ok");
        mapa.put("msg","删除用户成功！！");
        mapa.put("code",1);
        ObjectMapper mapper = new ObjectMapper();
        mapper.writeValue(resp.getWriter(),mapa);
    }
}
