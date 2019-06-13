package cn.itcast.web.util.servlet.grade;

import cn.itcast.web.util.dao.GradeDao;
import cn.itcast.web.util.dao.impl.GradeDaoimpl;
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

@WebServlet("/getGradeByUser")
public class GetGradeByUser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("application/json;charset=utf-8");
        String i_id = req.getParameter("i_id");
        String u_id = req.getParameter("u_id");
        GradeDao dao = new GradeDaoimpl();
        List agrade =  dao.getGradeByUser(Integer.parseInt(i_id),Integer.parseInt(u_id));

        Map<String,Object> mapa = new HashMap<String, Object>();
        mapa.put("stadus","ok");
        mapa.put("msg","！！");
        mapa.put("agrade",agrade);
        ObjectMapper mapper = new ObjectMapper();
        mapper.writeValue(resp.getWriter(),mapa);
    }
}
