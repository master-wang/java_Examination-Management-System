package cn.itcast.web.util.dao.impl;

import cn.itcast.web.util.dao.TestListDao;
import cn.itcast.web.util.domain.Test_list;
import cn.itcast.web.util.util.JDBCDBPoolUtils;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;
import java.util.Map;

public class TestListDaoimpl implements TestListDao {
    private JdbcTemplate template = new JdbcTemplate(JDBCDBPoolUtils.getDatasource());
    @Override
    public void addTestList(Test_list info) {
        String sql = "INSERT INTO `test_list` ( `school`, `project` ) VALUES ( ?, ? );";
        int update = template.update(sql, info.getSchool(), info.getProject());
        System.out.println("插入成功："+update);

    }

    @Override
    public List getCokaoLidt() {
        String sql ="select * from `test_list`";
        List<Map<String, Object>> list = template.queryForList(sql);
        System.out.println(list);
        return list;
    }

    @Override
    public void deleteKaoBoById(int id) {
        String sql = "delete from `test_list` where T_id = ?";
        int count = template.update(sql, id);
        System.out.println("删除成功"+count);
    }


}
