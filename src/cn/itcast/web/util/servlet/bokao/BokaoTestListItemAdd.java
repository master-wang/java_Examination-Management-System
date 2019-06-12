package cn.itcast.web.util.servlet.bokao;

import cn.itcast.web.util.dao.TestListItemDao;
import cn.itcast.web.util.dao.UserDao;
import cn.itcast.web.util.dao.impl.TestListItemDaoimpl;
import cn.itcast.web.util.dao.impl.UserDaoimpl;
import cn.itcast.web.util.domain.Test_list_item;
import cn.itcast.web.util.domain.User;
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

@WebServlet("/bokaoTestListItemAdd")
public class BokaoTestListItemAdd extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("application/json;charset=utf-8");

        String id = req.getParameter("T_id");
        String title = req.getParameter("title");
        TestListItemDao dao = new TestListItemDaoimpl();
        dao.addListItem(id,title);


        System.out.println("添加科目的id"+id);
        List list =dao.findItemsList(Integer.parseInt(id));

        Map<String,Object> mapa = new HashMap<String, Object>();
        mapa.put("stadus","ok");
        mapa.put("msg","获取试题成功！！");
        mapa.put("list",list);
        ObjectMapper mapper = new ObjectMapper();
        mapper.writeValue(resp.getWriter(),mapa);
    }
}
