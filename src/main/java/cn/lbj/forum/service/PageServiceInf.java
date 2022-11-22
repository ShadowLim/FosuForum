package cn.lbj.forum.service;

import cn.lbj.forum.entity.ForumEntity;
import cn.lbj.forum.entity.PageEntity;

public interface PageServiceInf {

    /**
     *  TODO 分页
     * @param currentPage
     * @param rows
     * @param pid
     * @return
     */
    PageEntity<ForumEntity> findForumByPage(String currentPage, String rows, int pid);

    /**
     * TODO 算出总条数
     * @param pid
     * @return
     */
    public long findTotalCount(int pid);
}
