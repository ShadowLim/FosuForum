package cn.lbj.forum.entity;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class StudyEntity {
    private int sid;
    private String title;
    private String content;
    private String cover;
    private Timestamp createTime;

    //关联用户,多对一额关联
    private UserEntity author = new UserEntity();
    //关联回复
    private List<StudyReplyEntity> studyReplyList = new ArrayList<>();


    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }


    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public String getCover() {
        return cover;
    }

    public void setCover(String cover) {
        this.cover = cover;
    }

    public UserEntity getAuthor() {
        return author;
    }

    public void setAuthor(UserEntity author) {
        this.author = author;
    }


    public List<StudyReplyEntity> getStudyReplyList() {
        return studyReplyList;
    }

    public void setStudyReplyList(List<StudyReplyEntity> studyReplyList) {
        this.studyReplyList = studyReplyList;
    }


}
