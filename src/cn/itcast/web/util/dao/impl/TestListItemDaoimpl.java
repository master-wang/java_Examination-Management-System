package cn.itcast.web.util.dao.impl;

import cn.itcast.web.util.dao.TestListItemDao;
import cn.itcast.web.util.domain.Test_list_item;
import cn.itcast.web.util.util.JDBCDBPoolUtils;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;
import java.util.Map;

public class TestListItemDaoimpl implements TestListItemDao {
    private JdbcTemplate template = new JdbcTemplate(JDBCDBPoolUtils.getDatasource());

    @Override
    public List findItemsList(int T_id) {
        try{
            String sql ="select * from `test_list_item` where T_id = ?";
            List<Map<String, Object>> list = template.queryForList(sql,T_id);
            System.out.println(list);
            return list;
        } catch (
        DataAccessException e){
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public void addListItem(String id, String title) {
        String sql = "INSERT INTO `test_list_item` ( `T_id`, `title` ) VALUES ( ?, ? );";
        int update = template.update(sql, Integer.parseInt(id), title);
        System.out.println("插入成功："+update);
    }

    @Override
    public void deleteShitiByIid(int id) {
        String sql = "delete from `test_list_item` where I_id = ?";
        int count = template.update(sql, id);
        System.out.println("删除成功"+count);
    }


}
