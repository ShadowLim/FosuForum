package cn.lbj.forum.entity;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 * TODO 论坛相关信息实体类
 */
public class ForumEntity {
    private int fid;
    private String title;
    private String content;
    //	private Timestamp createTime;
    private Timestamp createTime;

    // TODO 新增【模糊搜索】的关键词变量
    private String keyWord;

    // TODO 新增【模糊搜索】的关键词变量getter()方法
    public String getKeyWord() {
        return keyWord;
    }
    // TODO 新增【模糊搜索】的关键词变量setter()方法
    public void setKeyWord(String keyWord) {
        this.keyWord = keyWord;
    }

    // TODO 关联用户,多对一额关联
    private UserEntity author = new UserEntity();
    // TODO 关联回复
    private List<ReplyEntity> replyList = new ArrayList<ReplyEntity>();


    public int getFid() {
        return fid;
    }

    public void setFid(int fid) {
        this.fid = fid;
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


    //	public Timestamp getCreateTime() {
//		return createTime;
//	}
//
//	public void setCreateTime(Timestamp createTime) {
//		this.createTime = createTime;
//	}

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public UserEntity getAuthor() {
        return author;
    }

    public void setAuthor(UserEntity author) {
        this.author = author;
    }


    public List<ReplyEntity> getReplyList() {
        return replyList;
    }

    public void setReplyList(List<ReplyEntity> replyList) {
        this.replyList = replyList;
    }

}
