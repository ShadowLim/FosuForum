package cn.lbj.forum.dao;

import cn.lbj.forum.entity.ForumEntity;
import cn.lbj.forum.entity.ReplyEntity;

import java.util.List;

public interface ForumDaoInf {

    // TODO 模糊查询帖子
    public List<ForumEntity> findForumListByKeyWord(int pid, String keyWord);

    // TODO 查询所有帖子
    public List<ForumEntity> findForumList();

    // TODO 根据ID查询某个帖子
    public ForumEntity findForumById(int id);

    // TODO 添加帖子
    public int addForum(ForumEntity forum);

    // TODO 根据帖子的ID查询所有回复
    public List<ReplyEntity> findReplyList(int fid);

    // TODO 添加回复
    public int addReply(ReplyEntity reply);

    // TODO 根据用户ID查询用户的所有发帖
    public List<ForumEntity> personForum(int uid);

    // TODO 用户删除个人某个帖子
    public void deleteForum(int fid);

    // TODO 根据帖子id删除所有回复
    public void deleteReply(int fid);

    // TODO 用户删除某个回帖
    public void deleteReplyByRid(int rid);

    // TODO 用户管理模块
    // TODO 删除用户所有发帖
    public void dUserAllforumByUid(int uid);

    // TODO 删除该用户所有回帖
    public void dUserAllreplyByUid(int uid);

    // TODO 删除用户帖子下的所有回帖
    public void dUserOtherRelyByFid(int uid);
}
