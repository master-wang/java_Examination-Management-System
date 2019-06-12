package cn.itcast.web.util.servlet.grade;

import cn.itcast.web.util.dao.GradeDao;
import cn.itcast.web.util.dao.TestListDao;
import cn.itcast.web.util.dao.impl.GradeDaoimpl;
import cn.itcast.web.util.dao.impl.TestListDaoimpl;
import cn.itcast.web.util.domain.Grade;
import cn.itcast.web.util.domain.Test_list;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/gradeAdd")
public class GradeAdd extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("application/json;charset=utf-8");
        Map<String, String[]> map = req.getParameterMap();
        Grade grade = new Grade();
        try {
            BeanUtils.populate(grade,map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        System.out.println(grade);
        GradeDao dao = new GradeDaoimpl();
        dao.addGrade(grade);

        List agrade =  dao.getGradeInfo(grade.getU_id(),grade.getI_id());
        Map<String,Object> mapa = new HashMap<String, Object>();
        mapa.put("stadus","ok");
        mapa.put("msg","添加成功");
        mapa.put("agrade",agrade);
        ObjectMapper mapper = new ObjectMapper();
        mapper.writeValue(resp.getWriter(),mapa);
    }
}
