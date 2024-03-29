package cn.itcast.web.util.servlet.bokao;

import cn.itcast.web.util.dao.GradeDao;
import cn.itcast.web.util.dao.TestListItemDao;
import cn.itcast.web.util.dao.TestListItemShitiDao;
import cn.itcast.web.util.dao.impl.GradeDaoimpl;
import cn.itcast.web.util.dao.impl.TestListItemDaoimpl;
import cn.itcast.web.util.dao.impl.TestListItemShitiDaoimpl;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sun.net.httpserver.HttpServer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/bokaoTestListShitiList")
public class BokaoTestListShitiList extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("application/json;charset=utf-8");
        String id = req.getParameter("id");

        String u_id = req.getParameter("u_id");
        GradeDao dao2 = new GradeDaoimpl();
        int count = dao2.findIsExitGradeByIds(Integer.parseInt(id),Integer.parseInt(u_id));
        List agrade =  dao2.getGradeInfo(Integer.parseInt(u_id),Integer.parseInt(id));
        System.out.println("要获取试题了表的科目id："+id);

        TestListItemShitiDao dao = new TestListItemShitiDaoimpl();
        List list =dao.findItemsList(Integer.parseInt(id));

        Map<String,Object> mapa = new HashMap<String, Object>();
        mapa.put("stadus","ok");
        mapa.put("msg","获取科目试题列表成功！！");
        mapa.put("list",list);

        mapa.put("agrade",agrade);
        mapa.put("count",count);
        ObjectMapper mapper = new ObjectMapper();
        mapper.writeValue(resp.getWriter(),mapa);
    }
}
