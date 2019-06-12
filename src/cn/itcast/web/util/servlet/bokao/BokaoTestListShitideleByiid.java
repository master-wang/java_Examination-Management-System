package cn.itcast.web.util.servlet.bokao;

import cn.itcast.web.util.dao.TestListItemShitiDao;
import cn.itcast.web.util.dao.UserDao;
import cn.itcast.web.util.dao.impl.TestListItemShitiDaoimpl;
import cn.itcast.web.util.dao.impl.UserDaoimpl;
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

@WebServlet("/bokaoTestListShitideleByiid")
public class BokaoTestListShitideleByiid extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("application/json;charset=utf-8");
        String id = req.getParameter("id");
        String Item_id = req.getParameter("Item_id");
        System.out.println("要删除的id"+id);

        TestListItemShitiDao dao = new TestListItemShitiDaoimpl();
        dao.deleteShitiByiid(Integer.parseInt(id));

        List list =dao.findItemsList(Integer.parseInt(Item_id));

        Map<String,Object> mapa = new HashMap<String, Object>();
        mapa.put("stadus","ok");
        mapa.put("msg","获取试题成功！！");
        mapa.put("list",list);
        ObjectMapper mapper = new ObjectMapper();
        mapper.writeValue(resp.getWriter(),mapa);
    }
}
