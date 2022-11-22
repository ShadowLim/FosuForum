package cn.lbj.forum.service;

import cn.lbj.forum.entity.StudyEntity;
import cn.lbj.forum.entity.StudyReplyEntity;

import java.util.List;

public interface StudyServiceInf {

    //TODO 查询帖子列表
    public List<StudyEntity> findStudyList();

    // TODO 发表帖子
    public int createStudy(StudyEntity study);

    // TODO 查询帖子对应的回复
    public StudyEntity findStudyReplyList(int sid);

    // TODO 发表回复
    public int createStudyReply(StudyReplyEntity reply);

    // TODO 查询个人发帖
    public List<StudyEntity> personStudy(int pid);


    // TODO 删除学习帖子下的某个用户的回帖
    public void deleteStudyReplyByRid(int rid);


    // TODO 用户删除个人学习帖子
    public void deleteStudyBySid(int sid);

    // TODO 管理员删除学习专区帖子的所有回复
    public void deleteStudyReplyBySid(int sid);


    // TODO 用户管理模块
    // 1. 删除用户的所有发帖
    public void dUserAllStudyByUid(int uid);

    // 2. 删除该用户所有回帖
    public void dUserAllStudyReplyByUid(int uid);

    // 3. 删除用户帖子下的所有回帖
    public void dUserOtherStudyRelyBySid(int uid);

    // 4. 查看单个用户发帖情况
    public List<StudyEntity> seeUserStudyList(int uid);
}
