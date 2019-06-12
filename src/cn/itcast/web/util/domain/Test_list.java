package cn.itcast.web.util.domain;

public class Test_list {
    private int T_id;
    private String school;
    private String is_open;
    private String project;

    public String getProject() {
        return project;
    }

    public void setProject(String project) {
        this.project = project;
    }

    public int getT_id() {
        return T_id;
    }

    public void setT_id(int t_id) {
        T_id = t_id;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    public String getIs_open() {
        return is_open;
    }

    public void setIs_open(String is_open) {
        this.is_open = is_open;
    }

    @Override
    public String toString() {
        return "Test_list{" +
                "T_id=" + T_id +
                ", school='" + school + '\'' +
                ", is_open='" + is_open + '\'' +
                ", project='" + project + '\'' +
                '}';
    }
}
