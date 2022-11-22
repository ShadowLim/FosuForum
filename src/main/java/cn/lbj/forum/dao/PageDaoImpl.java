package cn.lbj.forum.dao;

import cn.lbj.forum.entity.ForumEntity;
import cn.lbj.forum.entity.UserEntity;
import cn.lbj.forum.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class PageDaoImpl implements PageDaoInf{

    /**
     * TODO 分页
     * @param currentPage
     * @param rows
     * @return
     */
    @Override
    public List<ForumEntity> findForumByPage(String currentPage, String rows, int pid) {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        int curPage = Integer.parseInt(currentPage);
        int limitRows = Integer.parseInt(rows);

        long totalCount = findTotalCount(pid);
        // TODO 计算总页数
        int totalPage = (int) (totalCount % limitRows == 0 ? totalCount / limitRows : totalCount / limitRows + 1);

        // TODO 将当前页面保留在第一页或者最后一页
        if (curPage > totalPage) {
            curPage = (int) totalPage;
        } else if (curPage < 1) {
            curPage = 1;
        }

        // TODO 计算每一页数据显示的初始条数
        int startRecord = (curPage - 1) * limitRows;
        String startPos = String.valueOf(startRecord);

//        String sql = "select * from forum_info where user_id = ?";
        String sql = "select * from forum_info where user_id = ? limit " + startPos + ", " + rows;
        System.out.println("分页显示sql语句：" + sql);
        System.out.println("分页显示完整sql语句：" + sql + "pid为：" + pid);

        List<ForumEntity> list = new ArrayList<ForumEntity>();

        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, pid);
            rs = ps.executeQuery();

            while (rs.next()) {
                ForumEntity forum = new ForumEntity();
                forum.setFid(rs.getInt(1));
                forum.setTitle(rs.getString(2));
                forum.setContent(rs.getString(3));
                forum.setCreateTime(rs.getTimestamp(4));
                // TODO 获取对应用户表中的外键
                UserEntity author = new UserEntity();
                author.setUser_id(rs.getInt(5));
                forum.setAuthor(author);
                list.add(forum);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, ps, conn);
        }

        return list;
    }


    /**
     * TODO 算出总条数
     * @param pid
     * @return
     */
    public long findTotalCount(int pid) {

        long ans = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;


        String sql = "select count(*) as recordcount from forum_info where user_id = ?";
        // sql语句：select count(*) as recordcount from forum_info where user_id = ?
        System.out.println("sql语句：" + sql);


        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, pid);
            rs = ps.executeQuery();

            if (rs.next()) {
                ans = rs.getLong("recordcount");
                System.out.println("总条数为：" + ans);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, ps, conn);
        }

        return  ans;
    }
}
