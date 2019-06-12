package cn.itcast.web.util.servlet.grade;

import cn.itcast.web.util.dao.GradeDao;
import cn.itcast.web.util.dao.TestListItemDao;
import cn.itcast.web.util.dao.impl.GradeDaoimpl;
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

@WebServlet("/getGradeList")
public class GetGradeList extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("application/json;charset=utf-8");


        GradeDao dao = new GradeDaoimpl();
        List list =dao.getGradeList();

        Map<String,Object> mapa = new HashMap<String, Object>();
        mapa.put("stadus","ok");
        mapa.put("msg","获取试题成功！！");
        mapa.put("GradeList",list);
        ObjectMapper mapper = new ObjectMapper();
        mapper.writeValue(resp.getWriter(),mapa);
    }
}
