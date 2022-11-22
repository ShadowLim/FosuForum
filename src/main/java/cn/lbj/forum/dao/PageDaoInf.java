package cn.lbj.forum.dao;

import cn.lbj.forum.entity.ForumEntity;

import java.util.List;

public interface PageDaoInf {

    /**
     * TODO 分页
     * @return
     */
    public List<ForumEntity> findForumByPage(String currentPage, String rows, int pid);

    /**
     * TODO 算出总条数
     * @param pid
     * @return
     */
    public long findTotalCount(int pid);

}
