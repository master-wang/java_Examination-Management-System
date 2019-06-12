package cn.itcast.web.util.servlet.bokao;

import cn.itcast.web.util.dao.TestListItemDao;
import cn.itcast.web.util.dao.TestListItemShitiDao;
import cn.itcast.web.util.dao.impl.TestListItemDaoimpl;
import cn.itcast.web.util.dao.impl.TestListItemShitiDaoimpl;
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

@WebServlet("/bokaoTestListShitiAdd")
public class BokaoTestListShitiAdd extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("application/json;charset=utf-8");

        String Item_id = req.getParameter("Item_id");
        String title = req.getParameter("title");
        String answer = req.getParameter("answer");
        String secA = req.getParameter("secA");
        String secB = req.getParameter("secB");
        String secC = req.getParameter("secC");

        TestListItemShitiDao dao = new TestListItemShitiDaoimpl();
        dao.addListItemShiti(Item_id,title,answer,secA,secB,secC);


        List list =dao.findItemsList(Integer.parseInt(Item_id));

        Map<String,Object> mapa = new HashMap<String, Object>();
        mapa.put("stadus","ok");
        mapa.put("msg","获取试题成功！！");
        mapa.put("list",list);
        ObjectMapper mapper = new ObjectMapper();
        mapper.writeValue(resp.getWriter(),mapa);
    }
}
