package cn.itcast.web.util.dao;

import java.util.List;

public interface TestListItemShitiDao {
    /**
     * 获取试题的列表　通过科目id
     * @param parseInt
     * @return
     */
    List findItemsList(int parseInt);



    void addListItemShiti(String item_id, String title, String answer, String secA, String secB, String secC);

    void deleteShitiByiid(int parseInt);
}
