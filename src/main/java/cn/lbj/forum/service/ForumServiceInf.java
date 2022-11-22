package cn.lbj.forum.service;

import cn.lbj.forum.entity.ForumEntity;
import cn.lbj.forum.entity.ReplyEntity;

import java.util.List;

public interface ForumServiceInf {

    // TODO 模糊查询帖子
    public List<ForumEntity> findForumListByKeyWord(int pid, String keyWord);

    //TODO 查询帖子列表
    public List<ForumEntity> findForumList();

    // TODO 发表帖子
    public int createForum(ForumEntity forum);

    // TODO 查询帖子对应的回复
    public ForumEntity findReplyList(int fid);

    // TODO 发表回复
    public int createReply(ReplyEntity reply);

    // TODO 查询个人发帖
    public List<ForumEntity> personForum(int pid);

    // TODO 删除个人帖子
    public void deleteForumByFid(int fid);

    // TODO 删除帖子的所有回复
    public void deleteReplyByFid(int fid);



    // TODO 删除帖子下的某个用户的回帖
    public void deleteReplyByRid(int rid);




    // TODO 用户管理模块
    //  1. 删除用户的所有发帖
    public void dUserAllForumByUid(int uid);

    //  2. 删除该用户所有回帖
    public void dUserAllreplyByUid(int uid);

    //  3. 删除用户帖子下的所有回帖
    public void dUserOtherRelyByFid(int uid);

    //  4. 查看单个用户发帖情况
    public List<ForumEntity> seeUserForumList(int uid);


}
