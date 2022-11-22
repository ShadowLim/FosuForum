package cn.lbj.forum.service;

import cn.lbj.forum.dao.ForumDaoImpl;
import cn.lbj.forum.dao.ForumDaoInf;
import cn.lbj.forum.dao.UserDaoImpl;
import cn.lbj.forum.dao.UserDaoInf;
import cn.lbj.forum.entity.ForumEntity;
import cn.lbj.forum.entity.ReplyEntity;
import cn.lbj.forum.entity.UserEntity;

import java.util.ArrayList;
import java.util.List;

public class ForumServiceImpl implements ForumServiceInf {

    public List<ForumEntity> findForumListByKeyWord(int pid, String keyWord) {
        System.out.println("模糊查询帖子");
        ForumDaoInf forumDao = new ForumDaoImpl();
        UserDaoInf userDao = new UserDaoImpl();

        List<ForumEntity> forumList = forumDao.findForumListByKeyWord(pid, keyWord);

        for (ForumEntity forumEntity : forumList) {
            int uid = forumEntity.getAuthor().getUser_id();
            UserEntity author = userDao.findUserById(uid);
            forumEntity.setAuthor(author);
        }
        System.out.println(forumList);
        return forumList;
    }

    public List<ForumEntity> findForumList() {
        System.out.println("查询帖子列表");
        ForumDaoInf forumDao = new ForumDaoImpl();
        UserDaoInf userDao = new UserDaoImpl();

        List<ForumEntity> forumList = forumDao.findForumList();

        for (ForumEntity forumEntity : forumList) {
            int uid = forumEntity.getAuthor().getUser_id();
            UserEntity author = userDao.findUserById(uid);
            forumEntity.setAuthor(author);
        }
        System.out.println(forumList);
        return forumList;
    }

    // TODO 发表帖子
    public int createForum(ForumEntity forum) {
        ForumDaoInf forumDao = new ForumDaoImpl();
        return forumDao.addForum(forum);
    }


    public ForumEntity findReplyList(int fid) {
        ForumDaoInf forumDao = new ForumDaoImpl();
        UserDaoInf userDao = new UserDaoImpl();

        ForumEntity forum = forumDao.findForumById(fid);
        UserEntity author = userDao.findUserById(forum.getAuthor().getUser_id());

        List<ReplyEntity> replyList = forumDao.findReplyList(fid);

        for (ReplyEntity replyEntity : replyList) {
            UserEntity replyUser = userDao.findUserById(replyEntity.getUser().getUser_id());
            replyEntity.setUser(replyUser);
        }

        forum.setAuthor(author);
        forum.setReplyList(replyList);
        return forum;
    }

    // TODO 发表回复
    public int createReply(ReplyEntity reply) {
        ForumDaoInf dao = new ForumDaoImpl();
        return dao.addReply(reply);
    }

    // TODO 查询个人发帖
    public List<ForumEntity> personForum(int pid) {
        ForumDaoInf dao = new ForumDaoImpl();
        List<ForumEntity> personList = new ArrayList<ForumEntity>();

        personList = dao.personForum(pid);

        return (personList == null) ? null : personList;
    }

    // TODO 删除个人帖子
    public void deleteForumByFid(int fid) {
        ForumDaoInf dao = new ForumDaoImpl();
        dao.deleteForum(fid);
    }

    // TODO 删除帖子的所有回复
    public void deleteReplyByFid(int fid) {
        ForumDaoInf dao = new ForumDaoImpl();
        dao.deleteReply(fid);
    }

    // TODO 删除帖子下的某个用户的回帖
    public void deleteReplyByRid(int rid) {
        ForumDaoInf dao = new ForumDaoImpl();
        dao.deleteReplyByRid(rid);
    }


    //TODO 管理员模块
    // TODO 1. 删除用户（删除用户信息，发帖信息，回帖信息）
    public void dUserAllForumByUid(int uid) {
        ForumDaoInf dao = new ForumDaoImpl();
        dao.dUserAllforumByUid(uid);
    }

    // TODO 2. 删除该用户所有回帖
    public void dUserAllreplyByUid(int uid) {
        ForumDaoInf dao = new ForumDaoImpl();
        dao.dUserAllreplyByUid(uid);
    }

    // TODO 3. 删除用户帖子下的所有回帖
    public void dUserOtherRelyByFid(int uid) {
        ForumDaoInf dao = new ForumDaoImpl();
        dao.dUserOtherRelyByFid(uid);
    }

    // TODO 4. 查看单个用户发帖情况
    public List<ForumEntity> seeUserForumList(int uid) {
        ForumDaoInf dao = new ForumDaoImpl();
        List<ForumEntity> forum = dao.personForum(uid);
        return forum;
    }


}
