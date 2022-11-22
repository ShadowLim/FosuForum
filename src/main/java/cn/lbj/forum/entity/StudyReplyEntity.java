package cn.lbj.forum.entity;

import java.sql.Timestamp;

public class StudyReplyEntity {

    private int rid;
    private String content;
    private Timestamp replyTime;

    // 回复人,多对一的关联
    private UserEntity user = new UserEntity();
    // 多对一关联
    private StudyEntity study = new StudyEntity();


    public int getRid() {
        return rid;
    }

    public void setRid(int rid) {
        this.rid = rid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getStudyReplyTime() {
        return replyTime;
    }

    public void setStudyReplyTime(Timestamp replyTime) {
        this.replyTime = replyTime;
    }

    public UserEntity getUser() {
        return user;
    }

    public void setUser(UserEntity user) {
        this.user = user;
    }

    public StudyEntity getStudy() {
        return study;
    }

    public void setStudy(StudyEntity study) {
        this.study = study;
    }

}
