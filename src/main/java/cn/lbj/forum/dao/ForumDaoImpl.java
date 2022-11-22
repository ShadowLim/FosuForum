package cn.lbj.forum.dao;

import cn.lbj.forum.entity.ForumEntity;
import cn.lbj.forum.entity.ReplyEntity;
import cn.lbj.forum.entity.UserEntity;
import cn.lbj.forum.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ForumDaoImpl implements ForumDaoInf {

    /**
     * TODO 模糊查询帖子
     * @param keyWord
     * @return
     */
    public List<ForumEntity> findForumListByKeyWord(int pid, String keyWord) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        /**
         * TODO 模糊查询
         *  select * from forum_info where title like "%a%"
         *  and user_id = '20201002';
         */
        String sql = "select * from forum_info where title like " + "\"" + "%" + keyWord + "%" + "\"" +" and user_id = ?";
        System.out.println("sql语句：" + sql);
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
                System.out.println("模糊查询结果的帖子标题为：" + rs.getString(2));

//                if (!rs.next()) {
//                    // TODO 获取keyword
//                    System.out.println("====================================");
//                    ForumEntity kw = new ForumEntity();
//                    kw.setKeyWord(keyWord);
//                    list.add(kw);
//
//                    System.out.println("**************************************");
//                    for (ForumEntity forumEntity : list) {
//                        System.out.println("集合keyword元素为：" + forumEntity.getKeyWord());
//                    }
//                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, ps, conn);
        }
        return list;
    }


    /**
     * TODO 查询帖子列表
     * @return
     */
    public List<ForumEntity> findForumList() {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<ForumEntity> list = new ArrayList<ForumEntity>();

        String sql = "select * from forum_info order by create_time desc";
        System.out.println(sql);

        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
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
                System.out.println("查询所有帖子：" + rs.getString(3));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, ps, conn);
        }
        return list;
    }

    /**
     * TODO 添加帖子
     * @param forum
     * @return
     */
    public int addForum(ForumEntity forum) {
        Connection conn = null;
        PreparedStatement ps = null;
        String sql = "insert into forum_info(title,content,create_time,user_id) values(?,?,?,?)";


        System.out.println("添加帖子");
        int i = 0;
        System.out.println(forum.getCreateTime());
        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, forum.getTitle());
            ps.setString(2, forum.getContent());
            ps.setTimestamp(3, forum.getCreateTime());
            ps.setInt(4, forum.getAuthor().getUser_id());
            i = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(null, ps, conn);
        }
        return i;
    }

    /**
     * TODO 根据ID查询某个帖子
     * @param fid
     * @return
     */
    public ForumEntity findForumById(int fid) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ForumEntity forum = null;
        String sql = "select * from forum_info where fid = ?";
        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, fid);
            rs = ps.executeQuery();
            if(rs.next()){
                forum = new ForumEntity();
                forum.setFid(rs.getInt(1));
                forum.setTitle(rs.getString(2));
                forum.setContent(rs.getString(3));
                forum.setCreateTime(rs.getTimestamp(4));
                // TODO 获取对应用户表中的外键
                UserEntity author = new UserEntity();
                author.setUser_id(rs.getInt(5));
                forum.setAuthor(author);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, ps, conn);
        }
        return forum;
    }

    /**
     * TODO 查询帖子对应的所有回复
     * @param fid
     * @return
     */
    public List<ReplyEntity> findReplyList(int fid) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<ReplyEntity> list = new ArrayList<ReplyEntity>();
        // TODO 根据外键作为条件查询当前帖子的所有回复
        String sql = "select * from reply_info where fid = ?";
        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, fid);
            rs = ps.executeQuery();
            while(rs.next()){
                ReplyEntity reply = new ReplyEntity();
                reply.setRid(rs.getInt(1));
                reply.setContent(rs.getString(2));
                reply.setReplyTime(rs.getTimestamp(3));
                // TODO 获取对应用户表中的外键
                UserEntity replyUser = new UserEntity();
                replyUser.setUser_id(rs.getInt(4));
                reply.setUser(replyUser);
                list.add(reply);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, ps, conn);
        }
        return list;
    }

    /**
     * TODO 添加回复
     * @param reply
     * @return
     */
    public int addReply(ReplyEntity reply) {
        Connection conn = null;
        PreparedStatement ps = null;
        int i = 0;

        System.out.println("添加回复成功");
        String sql = "insert into reply_info(reply_content,reply_time,user_id,fid) values(?,?,?,?)";
        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, reply.getContent());
            ps.setTimestamp(2, reply.getReplyTime());
            // TODO 将相应的两个外键设值
            ps.setInt(3, reply.getUser().getUser_id());
            ps.setInt(4, reply.getForum().getFid());
           
            i = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(null, ps, conn);
        }
        return i;
    }

    /**
     * TODO 根据用户ID查询用户的所有发帖
     * @param pid
     * @return
     */
    public List<ForumEntity> personForum(int pid){
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String sql = "select * from forum_info where user_id=?";
        System.out.println(sql);
        System.out.println("user_id：" + String.valueOf(pid));
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
                
                UserEntity user = new UserEntity();
                user.setUser_id(rs.getInt(5));
                forum.setAuthor(user);
                list.add(forum);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    /**
     * TODO 用户删除个人某个帖子
     * @param fid
     */
    public void deleteForum(int fid){
        Connection conn = null;
        PreparedStatement ps = null;

        String sql = "delete from forum_info where fid =?";

        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, fid);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(null, ps, conn);
        }
    }

    /**
     * TODO 根据帖子id删除所有回复
     * @param fid
     */
    public void deleteReply(int fid){

        System.out.println(fid);
        Connection conn = null;
        PreparedStatement ps = null;

        String sql = "delete from reply_info where fid =?";

        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, fid);

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(null, ps, conn);
        }
    }

    /**
     * TODO 用户删除某个回帖
     * @param rid
     */
    public void deleteReplyByRid(int rid){
        Connection conn = null;
        PreparedStatement ps = null;

        String sql = "delete from reply_info where reply_id=?";

        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, rid);

            ps.executeUpdate();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            DBUtil.close(null, ps, conn);
        }
    }

    // TODO 2. 用户管理模块

    /**
     * TODO 删除用户所有发帖
     * @param uid
     */
    public void dUserAllforumByUid(int uid){
        Connection conn = null;
        PreparedStatement ps = null;

        String sql = "delete from forum_info where user_id=?";

        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, uid);

            ps.executeUpdate();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            DBUtil.close(null, ps, conn);
        }
    }

    /**
     * TODO 删除用户的所有回帖
     * @param uid
     */
    public void dUserAllreplyByUid(int uid){
        Connection conn = null;
        PreparedStatement ps = null;

        String sql = "delete from reply_info where user_id=?";

        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, uid);

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(null, ps, conn);
        }
    }

    /**
     * TODO 删除用户帖子下的所有回帖
     * @param uid
     */
    public void dUserOtherRelyByFid(int uid){
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String sql = "select fid from forum_info where user_id=?";

        List<ForumEntity> fidlist = new ArrayList<ForumEntity>();
        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, uid);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                ForumEntity forum=new ForumEntity();
                forum.setFid(rs.getInt(1));
                fidlist.add(forum);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(null, ps, conn);
        }

        String fsql = "delete from reply_info where fid=?";

        try {
            for (ForumEntity forum : fidlist) {
                conn = DBUtil.getConnection();
                ps = conn.prepareStatement(fsql);
                ps.setInt(1, forum.getFid());

                ps.executeUpdate();
                DBUtil.close(null, ps, conn);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
