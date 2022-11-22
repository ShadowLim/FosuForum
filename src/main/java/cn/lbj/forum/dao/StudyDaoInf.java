package cn.lbj.forum.dao;

import cn.lbj.forum.entity.StudyEntity;
import cn.lbj.forum.entity.StudyReplyEntity;

import java.util.List;

public interface StudyDaoInf {
    // TODO 查询所有考研学习信息
    public List<StudyEntity> findStudyList();

    // TODO 根据ID查询某个考研帖子
    public StudyEntity findStudyById(int id);

    // TODO 添加考研帖子
    public int addStudy(StudyEntity study);

    // TODO 根据考研帖子的ID查询所有回复
    public List<StudyReplyEntity> findStudyReplyList(int fid);

    // TODO 添加回复
    public int addStudyReply(StudyReplyEntity reply);

    // TODO 根据用户ID查询用户的所有考研发帖
    public List<StudyEntity> personStudy(int uid);

    // TODO 用户删除个人某个学习帖子
    public void deleteStudy(int fid);

    // TODO 管理员根据学习帖子id删除所有回复
    public void deleteStudyReply(int sid);

    // TODO 用户删除某个考研回帖
    public void deleteStudyReplyByRid(int rid);

    // TODO 用户管理模块
    // TODO 删除用户所有考研发帖
    public void dUserAllStudyByUid(int uid);

    // TODO 删除该用户所有考研回帖
    public void dUserAllStudyReplyByUid(int uid);

    // TODO 删除用户帖子下的所有考研回帖
    public void dUserOtherStudyRelyBySid(int uid);
}
