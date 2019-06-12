package cn.itcast.web.util.dao;

import cn.itcast.web.util.domain.Grade;

import java.util.List;

public interface GradeDao {
    int findIsExitGradeByIds(int parseInt, int parseInt1);

    void addGrade(Grade grade);



    List getGradeInfo(int u_id, int i_id);

    List getGradeList();
}
