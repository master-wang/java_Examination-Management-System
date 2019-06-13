package cn.itcast.web.util.domain;

public class Grade {
    private int g_id;
    private int u_id;
    private int i_id;
    private String grade;
    private String mianshi;

    public String getMianshi() {
        return mianshi;
    }

    public void setMianshi(String mianshi) {
        this.mianshi = mianshi;
    }

    public int getI_id() {
        return i_id;
    }

    public void setI_id(int i_id) {
        this.i_id = i_id;
    }

    public int getG_id() {
        return g_id;
    }

    public void setG_id(int g_id) {
        this.g_id = g_id;
    }

    public int getU_id() {
        return u_id;
    }

    public void setU_id(int u_id) {
        this.u_id = u_id;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    @Override
    public String toString() {
        return "Grade{" +
                "g_id=" + g_id +
                ", u_id=" + u_id +
                ", i_id=" + i_id +
                ", grade='" + grade + '\'' +
                ", mianshi='" + mianshi + '\'' +
                '}';
    }
}
