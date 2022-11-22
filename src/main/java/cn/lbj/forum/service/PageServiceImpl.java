package cn.lbj.forum.service;

import cn.lbj.forum.dao.PageDaoImpl;
import cn.lbj.forum.dao.PageDaoInf;
import cn.lbj.forum.entity.ForumEntity;
import cn.lbj.forum.entity.PageEntity;

import java.util.List;

public class PageServiceImpl implements PageServiceInf{

    PageDaoInf pageDaoInf = new PageDaoImpl();

    /**
     *  TODO 分页
     * @param currentPage
     * @param rows
     * @param pid
     * @return
     */
    @Override
    public PageEntity<ForumEntity> findForumByPage(String currentPage, String rows, int pid) {

        PageEntity<ForumEntity> pageBean = new PageEntity<>();

        int curPage = Integer.parseInt(currentPage);
        int limitRows = Integer.parseInt(rows);


        if (curPage <= 0) {
            curPage = 1;
        }

        long totalCount = pageDaoInf.findTotalCount(pid);  // TODO 总条数

        // TODO 计算总页数
        int totalPage = (int) (totalCount % limitRows == 0 ? totalCount / limitRows : totalCount / limitRows + 1);
        pageBean.setTotalPage(totalPage);

        // TODO 计算每一页数据显示的初始条数
        int startRecord = (curPage - 1) * limitRows;
        String startPos = String.valueOf(startRecord);

        if (curPage > totalPage) {
            curPage = totalPage;
        }

        System.out.println("curPage: " + curPage);
        System.out.println("startPos: " + startPos);


        List<ForumEntity> list = pageDaoInf.findForumByPage(currentPage, rows, pid);

        pageBean.setTotalCount(totalCount);
        pageBean.setCurrentPage(curPage);
        pageBean.setRows(limitRows);
        pageBean.setStartRecord(startRecord);
        pageBean.setList(list);

        return pageBean;
    }

    /**
     * TODO 算出总条数
     * @param pid
     * @return
     */
    public long findTotalCount(int pid) {

        long ans = 0;
        ans = pageDaoInf.findTotalCount(pid);  // TODO 总条数

        return  ans;
    }
}
