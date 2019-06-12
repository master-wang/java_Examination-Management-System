package cn.itcast.web.util.domain;

public class GradeList {
    private String school;
    private String project;
    private String title;
    private String name;
    private String idCardNo;
    private String phone;
    private String grade;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    public String getProject() {
        return project;
    }

    public void setProject(String project) {
        this.project = project;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIdCardNo() {
        return idCardNo;
    }

    public void setIdCardNo(String idCardNo) {
        this.idCardNo = idCardNo;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    @Override
    public String toString() {
        return "GradeList{" +
                "school='" + school + '\'' +
                ", project='" + project + '\'' +
                ", title='" + title + '\'' +
                ", name='" + name + '\'' +
                ", idCardNo='" + idCardNo + '\'' +
                ", phone='" + phone + '\'' +
                ", grade='" + grade + '\'' +
                '}';
    }
}
