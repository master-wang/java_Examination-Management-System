package cn.itcast.web.util.domain;

public class Test_list_item_title {
    private int i_id;
    private int Item_id;
    private String title;
    private String answer;
    private String secA;
    private String secB;
    private String secC;

    public String getSecA() {
        return secA;
    }

    public void setSecA(String secA) {
        this.secA = secA;
    }

    public String getSecB() {
        return secB;
    }

    public void setSecB(String secB) {
        this.secB = secB;
    }

    public String getSecC() {
        return secC;
    }

    public void setSecC(String secC) {
        this.secC = secC;
    }

    public int getI_id() {
        return i_id;
    }

    public void setI_id(int i_id) {
        this.i_id = i_id;
    }

    public int getItem_id() {
        return Item_id;
    }

    public void setItem_id(int item_id) {
        Item_id = item_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    @Override
    public String toString() {
        return "Test_list_item_title{" +
                "i_id=" + i_id +
                ", Item_id=" + Item_id +
                ", title='" + title + '\'' +
                ", answer='" + answer + '\'' +
                ", secA='" + secA + '\'' +
                ", secB='" + secB + '\'' +
                ", secC='" + secC + '\'' +
                '}';
    }
}
