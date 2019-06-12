package cn.itcast.web.util.servlet.bokao;

import cn.itcast.web.util.dao.TestListDao;
import cn.itcast.web.util.dao.TestListItemDao;
import cn.itcast.web.util.dao.impl.TestListDaoimpl;
import cn.itcast.web.util.dao.impl.TestListItemDaoimpl;
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

@WebServlet("/bokaoTestList")
public class BokaoTestList extends HttpServlet {
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

        TestListItemDao dao = new TestListItemDaoimpl();
        List list =dao.findItemsList(Integer.parseInt(id));

        Map<String,Object> mapa = new HashMap<String, Object>();
        mapa.put("stadus","ok");
        mapa.put("msg","获取试题成功！！");
        mapa.put("list",list);
        ObjectMapper mapper = new ObjectMapper();
        mapper.writeValue(resp.getWriter(),mapa);
    }
}
