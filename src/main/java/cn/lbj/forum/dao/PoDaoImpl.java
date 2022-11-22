package cn.lbj.forum.dao;


import cn.lbj.forum.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class PoDaoImpl implements PoDaoInf {

    /**
     * TODO 按时间（月份）分组统计帖子发表数量
     * @param uid
     * @return
     */
    @Override
    public List<Object[]> releaseCntByDate(String uid) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Object[]> list = new ArrayList<Object[]>();

        /**
         * SELECT DISTINCT(fi.user_id), ui.user_name name, fid,
         * 	DATE_FORMAT(create_time,'%Y-%m') as pub_time,
         * 	COUNT(fid) as cnt
         * from forum_info fi join user_info ui
         * on fi.user_id = ui.user_id
         * -- where fi.user_id = '20201001'
         * GROUP BY pub_time, ui.user_name
         * ORDER BY fi.user_id;SELECT * FROM `forum_info`
         */

        String sql = "select ui.user_name, DATE_FORMAT(create_time,'%Y-%m') as pub_time, count(fid) " +
                "from forum_info fi join user_info ui on fi.user_id = ui.user_id " +
                "where fi.user_id = " + uid + " " +
                "group by pub_time, ui.user_name order by fi.user_id";

        // select ui.user_name, month(create_time) as create_month, count(fid) from forum_info fi join user_info ui on fi.user_id = ui.user_id where fi.user_id = 20201001 group by create_month, ui.user_name order by fi.user_id
        System.out.println(sql);

        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();


            while (rs.next()) {
                String name = rs.getString(1);
                String pubTime = rs.getString(2);   // 2022-10
                String cntStr = rs.getString(3);

                String pubYear = pubTime.substring(0, 4);
                String pubMonth = pubTime.substring(5);
                int cnt = Integer.parseInt(cntStr);

                pubTime = pubYear + "年" + pubMonth + "月";

                Object[] arr = {pubTime, cnt};
                list.add(arr);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, ps, conn);
        }

        /**
         * 9月份-1
         * -----------------------------
         * 10月份-3
         * -----------------------------
         */
        for(int i = 0; i < list.size(); i++) {
            Object[] arr = list.get(i);
            System.out.println(arr[0] + "-" + arr[1]);
            System.out.println("------------ 帖子统计 -----------------");
        }

        return list;
    }


    /**
     * TODO 统计回帖数量前5的帖子
     * @param uid
     * @return
     */
    @Override
    public List<Object[]> replyCntTop5(String uid) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Object[]> ans = new ArrayList<Object[]>();

        /** TODO
         *   SELECT
         *   	ri.fid as r_id, fi.user_id, fi.fid, title, count(ri.fid) as cnt
         *    from reply_info ri join forum_info fi on ri.fid = fi.fid
         *    where fi.user_id = '20201001'
         *    GROUP BY title
         *    ORDER BY cnt desc
         *    limit 5;
         */
        String sql = "select title, count(ri.fid) as cnt " +
                "from reply_info ri join forum_info fi on ri.fid = fi.fid " +
                "where fi.user_id = " + uid + " group by title order by cnt desc, fi.fid limit 5";

        // select title, count(ri.fid) as cnt from reply_info ri join forum_info fi on ri.fid = fi.fid where fi.user_id = 20201001 group by title order by cnt desc, fi.fid limit 5
        System.out.println(sql);

        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                String title = rs.getString(1);
                String cntStr = rs.getString(2);

                int cnt = Integer.parseInt(cntStr);

                Object[] arr = {title, cnt};
                ans.add(arr);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, ps, conn);
        }

        /**
         * 分页查询-->3
         * -----------------------------
         * tset-->2
         * -----------------------------
         * 程序员第一行代码-->2
         * -----------------------------
         * 列举大数据常用组件及框架-->1
         * -----------------------------
         * fa-->1
         * -----------------------------
         */
        for(int i = 0; i < ans.size(); i++) {
            Object[] arr = ans.get(i);
            System.out.println(arr[0] + "-->" + arr[1]);
            System.out.println("-----------------------------");
        }
        return ans;
    }


    /**
     * TODO 按时间（月份）分组统计学习专区帖子发表数量
     * @param u_id
     * @return
     */
    @Override
    public List<Object[]> studyReleaseCntByDate(String u_id) {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Object[]> list = new ArrayList<Object[]>();

        /**
         * select
         * DATE_FORMAT(create_time,'%Y-%m') as pub_time,
         * count(*) as cnt
         * from study_info si
         * where si.user_id = '20201001'
         * GROUP BY pub_time;
         */
        String sql = "select DATE_FORMAT(create_time,'%Y-%m') as pub_time, count(*) as cnt from study_info si " +
                    "where si.user_id = " + u_id + " GROUP BY pub_time";

        System.out.println(sql);

        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();


            while (rs.next()) {
                String pubTime = rs.getString(1);   // 2022-10
                int cnt = rs.getInt(2);

                String pubYear = pubTime.substring(0, 4);
                String pubMonth = pubTime.substring(5);

                pubTime = pubYear + "年" + pubMonth + "月";

                Object[] arr = {pubTime, cnt};
                list.add(arr);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, ps, conn);
        }


        for(int i = 0; i < list.size(); i++) {
            Object[] arr = list.get(i);
            System.out.println(arr[0] + "-" + arr[1]);
            System.out.println("-------------- 学习专区帖子统计 ---------------");
        }

        return list;

    }


    /**
     * TODO 统计学习专区回帖数量前5的帖子
     * @param uid
     * @return
     */
    @Override
    public List<Object[]> studyReplyCntTop5(String uid) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Object[]> ans = new ArrayList<Object[]>();

        /**
         * select title, count(sri.sid) as cnt
         * from study_reply_info sri join study_info si on sri.sid = si.sid
         * where si.user_id = '20201001'
         * group by title order by cnt desc, fi.fid limit 5
         */
        String sql = "select title, count(sri.sid) as cnt from study_reply_info sri join study_info si on sri.sid = si.sid" +
                " where si.user_id = " + uid +
                " group by title order by cnt desc, si.sid limit 5";

        System.out.println(sql);

        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                String title = rs.getString(1);
                int cnt = rs.getInt(2);

                Object[] arr = {title, cnt};
                ans.add(arr);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, ps, conn);
        }

        // --------- 学习专区回帖Top5统计 ------------------
        // JavaWeb --> 1
        for(int i = 0; i < ans.size(); i++) {
            Object[] arr = ans.get(i);
            System.out.println("--------- 学习专区回帖Top5统计 ------------------");
            System.out.println(arr[0] + "-->" + arr[1]);
        }
        return ans;
    }


    /**
     * TODO 普通用户发帖统计Top5
     * @param u_id
     * @return
     */
    @Override
    public List<Object[]> forumCntByUserTop5(String u_id) {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Object[]> ans = new ArrayList<Object[]>();


        /** TODO SQL:
         * select fi.user_id, count(*) cnt
         * from forum_info fi join user_info ui
         * on fi.user_id = ui.user_id
         * where ui.isAdmin != 1
         * GROUP BY user_id;
         */

        String sql = "select fi.user_id, count(*) cnt from forum_info fi join user_info ui " +
                "on fi.user_id = ui.user_id where ui.isAdmin != 1 GROUP BY user_id limit 5";

        System.out.println("sql语句为：" + sql);

        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                int uid = rs.getInt(1);
                int cnt = rs.getInt(2);

                Object[] arr = {uid, cnt};
                ans.add(arr);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, ps, conn);
        }

        /**
         * --------- 普通用户发帖Top5统计 ------------------
         * 20201001-->8
         * --------- 普通用户发帖Top5统计 ------------------
         * 20201002-->3
         * --------- 普通用户发帖Top5统计 ------------------
         * 20201004-->1
         */
        for(int i = 0; i < ans.size(); i++) {
            Object[] arr = ans.get(i);
            System.out.println("--------- 普通用户发帖Top5统计 ------------------");
            System.out.println(arr[0] + "-->" + arr[1]);
        }
        return ans;
    }


    /**
     * TODO 普通用户学习发帖统计Top5
     * @param u_id
     * @return
     */
    @Override
    public List<Object[]> studyCntByUserTop5(String u_id) {

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Object[]> ans = new ArrayList<Object[]>();


        /** TODO SQL:
         * select si.user_id, count(*) cnt
         * from study_info si join user_info ui
         * on si.user_id = ui.user_id
         * where ui.isAdmin != 1
         * GROUP BY si.user_id
         * LIMIT 5
         */

        String sql = "select si.user_id, count(*) cnt from study_info si join user_info ui " +
                "on si.user_id = ui.user_id where ui.isAdmin != 1 GROUP BY si.user_id LIMIT 5";

        System.out.println("sql语句为：" + sql);

        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                int uid = rs.getInt(1);
                int cnt = rs.getInt(2);

                Object[] arr = {uid, cnt};
                ans.add(arr);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, ps, conn);
        }

        for(int i = 0; i < ans.size(); i++) {
            Object[] arr = ans.get(i);
            System.out.println("--------- 普通用户学习发帖Top5统计 ------------------");
            System.out.println(arr[0] + "==>" + arr[1]);
        }
        return ans;
    }
}
