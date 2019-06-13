package cn.itcast.web.util.dao.impl;

import cn.itcast.web.util.dao.GradeDao;
import cn.itcast.web.util.domain.Grade;
import cn.itcast.web.util.util.JDBCDBPoolUtils;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;
import java.util.Map;

public class GradeDaoimpl implements GradeDao {

    private JdbcTemplate template = new JdbcTemplate(JDBCDBPoolUtils.getDatasource());

    @Override
    public int findIsExitGradeByIds(int i_id, int u_id) {
        try{
            String sql = "select count(*) from grade where i_id= ? and u_id = ? ";
            Integer count = template.queryForObject(sql, Integer.class,i_id,u_id);
            return count;
        }catch (
        DataAccessException e){
            e.printStackTrace();
            return 0;
        }
    }

    @Override
    public void addGrade(Grade grade) {
        String sql = "INSERT INTO `grade` ( `u_id`, `grade` ,`i_id`) VALUES ( ?, ? ,?);";
        int update = template.update(sql, grade.getU_id(), grade.getGrade(),grade.getI_id());
        System.out.println("添加成功："+update);
    }

    @Override
    public List getGradeInfo(int u_id, int i_id) {

        try{
            String sql ="select * from `grade` where u_id = ? and i_id = ? ";
            List<Map<String, Object>> list = template.queryForList(sql,u_id,i_id);
            System.out.println(list);
            return list;
        }catch (DataAccessException e){
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public List getGradeList() {
        try{
            String sql = "select g_id,school,project,`title`,`name`,idCardNo,phone,grade,mianshi from `grade`,test_list,test_list_item,`user` where grade.u_id=`user`.`id` and `grade`.i_id=test_list_item.I_id and test_list_item.T_id=test_list.T_id";
            List<Map<String, Object>> list = template.queryForList(sql);
            System.out.println(list);
            return list;
        }catch (DataAccessException e){
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public List getGradeById(int g_id ) {
        try{
            String sql ="select * from `grade` where g_id = ?  ";
            List<Map<String, Object>> list = template.queryForList(sql,g_id);
            System.out.println(list);
            return list;
        }catch (DataAccessException e){
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public void gradeUpdateMianshi(int g_id, String mianshi) {
        String sql ="update `grade` set mianshi = ?  where g_id = ?";
        int count = template.update(sql,mianshi,g_id);
        System.out.println("更新面试成绩："+count);
    }

    @Override
    public List getGradeByUser(int i_id, int u_id) {
        try{
            String sql ="select * from `grade` where i_id = ? and u_id=? ";
            List<Map<String, Object>> list = template.queryForList(sql,i_id,u_id);
            System.out.println(list);
            return list;
        }catch (DataAccessException e){
            e.printStackTrace();
            return null;
        }
    }


}
