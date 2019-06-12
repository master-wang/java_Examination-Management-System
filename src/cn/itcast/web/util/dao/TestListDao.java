package cn.itcast.web.util.dao;

import cn.itcast.web.util.domain.Test_list;

import java.util.List;

public interface TestListDao {
    /**
     * 添加博考
     * @param info
     */
    void addTestList(Test_list info);

    /**
     * 获取列表
     * @return
     */
    List getCokaoLidt();

    /**
     * 通过id删除
     * @param id
     */

    void deleteKaoBoById(int id);
}
