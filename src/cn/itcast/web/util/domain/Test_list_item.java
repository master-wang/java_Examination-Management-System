package cn.itcast.web.util.domain;

public class Test_list_item {
    private int I_id;
    private int T_id;
    private String title;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getI_id() {
        return I_id;
    }

    public void setI_id(int i_id) {
        I_id = i_id;
    }

    public int getT_id() {
        return T_id;
    }

    public void setT_id(int t_id) {
        T_id = t_id;
    }

    @Override
    public String toString() {
        return "Test_list_item{" +
                "I_id=" + I_id +
                ", T_id=" + T_id +
                ", title='" + title + '\'' +
                '}';
    }
}
