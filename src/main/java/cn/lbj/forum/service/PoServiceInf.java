package cn.lbj.forum.service;

import java.util.List;

public interface PoServiceInf {

    /**
     * TODO 按时间（月份）分组统计帖子发表数量
     * @param uid
     * @return
     */
      public List<Object> releaseCntByDate(String uid);


    /**
     * TODO 统计回帖数量前5的帖子
     * @param uid
     * @return
     */
    public List<Object> replyCntTop5(String uid);


    /**
     * TODO 按时间（月份）分组统计学习专区帖子发表数量
     * @param u_id
     * @return
     */
    List<Object> studyReleaseCntByDate(String u_id);

    /**
     * TODO 统计学习专区回帖数量前5的帖子
     * @param uid
     * @return
     */
    public List<Object> studyReplyCntTop5(String uid);


    /**
     * TODO 普通用户发帖统计Top5
     * @param u_id
     * @return
     */
    List<Object> forumCntByUserTop5(String u_id);


    /**
     * TODO 普通用户学习发帖统计Top5
     * @param u_id
     * @return
     */
    List<Object> studyCntByUserTop5(String u_id);

}
