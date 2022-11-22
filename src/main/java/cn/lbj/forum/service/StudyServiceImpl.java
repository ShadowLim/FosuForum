package cn.lbj.forum.service;

import cn.lbj.forum.dao.StudyDaoImpl;
import cn.lbj.forum.dao.StudyDaoInf;
import cn.lbj.forum.dao.UserDaoImpl;
import cn.lbj.forum.dao.UserDaoInf;
import cn.lbj.forum.entity.StudyEntity;
import cn.lbj.forum.entity.StudyReplyEntity;
import cn.lbj.forum.entity.UserEntity;

import java.util.ArrayList;
import java.util.List;

public class StudyServiceImpl implements StudyServiceInf {

    public List<StudyEntity> findStudyList() {
        System.out.println("查询帖子列表");
        StudyDaoInf forumDao = new StudyDaoImpl();
        UserDaoInf userDao = new UserDaoImpl();

        List<StudyEntity> studyList = forumDao.findStudyList();

        for (StudyEntity StudyEntity : studyList) {
            int uid = StudyEntity.getAuthor().getUser_id();
            UserEntity author = userDao.findUserById(uid);
            StudyEntity.setAuthor(author);
        }
        System.out.println(studyList);
        return studyList;
    }

    // TODO 发表帖子
    public int createStudy(StudyEntity study) {
        StudyDaoInf studyDao = new StudyDaoImpl();
        return studyDao.addStudy(study);
    }

    // TODO 查看某个学习专帖的回帖内容
    public StudyEntity findStudyReplyList(int sid) {
        StudyDaoInf studyDao = new StudyDaoImpl();
        UserDaoInf userDao = new UserDaoImpl();

        StudyEntity forum = studyDao.findStudyById(sid);
        UserEntity author = userDao.findUserById(forum.getAuthor().getUser_id());

        List<StudyReplyEntity> studyReplyList = studyDao.findStudyReplyList(sid);

        for (StudyReplyEntity studyReplyEntity : studyReplyList) {
            UserEntity replyUser = userDao.findUserById(studyReplyEntity.getUser().getUser_id());
            studyReplyEntity.setUser(replyUser);
        }

        forum.setAuthor(author);
        forum.setStudyReplyList(studyReplyList);
        return forum;
    }

    // TODO 发表回复
    public int createStudyReply(StudyReplyEntity reply) {
        StudyDaoInf dao = new StudyDaoImpl();
        return dao.addStudyReply(reply);
    }

    // TODO 查询个人发帖
    public List<StudyEntity> personStudy(int pid) {
        StudyDaoInf dao = new StudyDaoImpl();
        List<StudyEntity> personList = new ArrayList<StudyEntity>();

        personList = dao.personStudy(pid);

        return (personList == null) ? null : personList;
    }


    // TODO 删除帖子下的某个用户的回帖
    public void deleteStudyReplyByRid(int rid) {
        StudyDaoInf dao = new StudyDaoImpl();
        dao.deleteStudyReplyByRid(rid);
    }


    //TODO 管理员模块
    // TODO 1. 删除用户（删除用户信息，发帖信息，回帖信息）
    public void dUserAllStudyByUid(int uid) {
        StudyDaoInf dao = new StudyDaoImpl();
        dao.dUserAllStudyByUid(uid);
    }

    // TODO 2. 删除该用户所有回帖
    public void dUserAllStudyReplyByUid(int uid) {
        StudyDaoInf dao = new StudyDaoImpl();
        dao.dUserAllStudyReplyByUid(uid);
    }

    // TODO 3. 删除用户帖子下的所有回帖
    public void dUserOtherStudyRelyBySid(int uid) {
        StudyDaoInf dao = new StudyDaoImpl();
        dao.dUserOtherStudyRelyBySid(uid);
    }

    // TODO 4. 查看单个用户发帖情况
    public List<StudyEntity> seeUserStudyList(int uid) {
        StudyDaoInf dao = new StudyDaoImpl();
        List<StudyEntity> study = dao.personStudy(uid);
        return study;
    }


    // TODO 用户删除个人学习帖子
    @Override
    public void deleteStudyBySid(int sid) {
        StudyDaoInf dao = new StudyDaoImpl();
        dao.deleteStudy(sid);
    }

    // TODO 管理员删除学习专区帖子的所有回复
    @Override
    public void deleteStudyReplyBySid(int sid) {
        StudyDaoInf dao = new StudyDaoImpl();
        dao.deleteStudyReply(sid);
    }

}
