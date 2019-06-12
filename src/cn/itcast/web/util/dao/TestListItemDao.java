package cn.itcast.web.util.dao;

import cn.itcast.web.util.domain.Test_list_item;

import java.util.List;

public interface TestListItemDao {
    List findItemsList(int T_id);



    void addListItem(String id, String title);

    void deleteShitiByIid(int parseInt);
}
