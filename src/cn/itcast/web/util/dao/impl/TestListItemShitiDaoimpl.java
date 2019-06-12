package cn.itcast.web.util.dao.impl;

import cn.itcast.web.util.dao.TestListItemShitiDao;
import cn.itcast.web.util.util.JDBCDBPoolUtils;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;
import java.util.Map;

public class TestListItemShitiDaoimpl implements TestListItemShitiDao {

    private JdbcTemplate template = new JdbcTemplate(JDBCDBPoolUtils.getDatasource());
    @Override
    public List findItemsList(int Item_id) {
        try{
            String sql ="select * from `test_list_item_title` where Item_id = ?";
            List<Map<String, Object>> list = template.queryForList(sql,Item_id);
            System.out.println(list);
            return list;
        } catch (
                DataAccessException e){
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public void addListItemShiti(String item_id, String title, String answer, String secA, String secB, String secC) {
        String sql = "INSERT INTO `test_list_item_title` ( `Item_id`, `title` ,`answer` ,`secA`,`secB`,`secC` ) VALUES ( ?, ? ,?,?,?,? );";
        int update = template.update(sql, Integer.parseInt(item_id), title,answer,secA,secB,secC);
        System.out.println("插入成功："+update);
    }

    @Override
    public void deleteShitiByiid(int id) {
        String sql = "delete from `test_list_item_title` where i_id = ?";
        int count = template.update(sql, id);
        System.out.println("删除成功"+count);
    }


}
