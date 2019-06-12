package cn.itcast.web.util.servlet.user;

import cn.itcast.web.util.dao.UserDao;
import cn.itcast.web.util.dao.impl.UserDaoimpl;
import cn.itcast.web.util.domain.User;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/updateUserInfoImg")
public class UpdateUserInfoImg extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("application/json;charset=utf-8");
        String id = req.getParameter("id");
        System.out.println(id);
        System.out.println("上传文件、。。。。。");
        //使用fileupload组件完成文件上传
        //上传的位置
        String path = req.getSession().getServletContext().getRealPath("/uploads/");
        //String path = req.getContextPath()+"/uploads/";
        File file = new File(path);
        if(!file.exists()){
            //创建文件夹
            file.mkdir();
        }

        //解析　　ｒｅｑ对象　获取上传的文件项
        //创建文件磁盘工程　
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        //解析　req　 返回文件项　　需要遍历
        List<FileItem> fileItems = null;
        try {
            fileItems = upload.parseRequest(req);
        } catch (FileUploadException e) {
            e.printStackTrace();
        }
        Map<String,Object> mapa = new HashMap<String, Object>();
        for (FileItem item:fileItems) {
            //进行判断当前的　　item　是都是一个上传文件项
            if (item.isFormField()){
                //是一个普通的表单项
            }else{
                //说明文件上传
                //获取上传文件的名称
                String fileName = item.getName();
                System.out.println("上传的文件名为："+fileName);
                //完成文件上传
                try {
                    // 取扩展名加随机数进行重命名
                    fileName = new SimpleDateFormat("yyyyMMddHHmmsssss").format(new Date())+java.util.UUID.randomUUID() + fileName.substring(fileName.lastIndexOf("."),fileName.length());
                    item.write(new File(path,fileName));
                    System.out.println("上传的路径为：");
                    System.out.println(path+fileName);
                    String ph = path+fileName;
                    System.out.println(ph);
                    String[] arr = ph.split("java_cobb_war_exploded");
                    String tou = "http://localhost:8080/java_cobb_war_exploded";
                    String b = tou+arr[1];
                    System.out.println(arr[1]);
                    System.out.println(b);
                    UserDao dao = new UserDaoimpl();
                    int count = dao.updateUserHeadimgById(id, b);
                    //删除零食文件
                    item.delete();

                    User userInfo = dao.findUserInfoById(Integer.parseInt(id));
                    mapa.put("stadus","ok");
                    mapa.put("msg","上传图片成功！");
                    mapa.put("userInfo",userInfo);
                    ObjectMapper mapper = new ObjectMapper();
                    mapper.writeValue(resp.getWriter(),mapa);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
