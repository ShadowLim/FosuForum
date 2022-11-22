package cn.lbj.forum.dao;

import cn.lbj.forum.entity.StudyEntity;
import cn.lbj.forum.entity.StudyReplyEntity;
import cn.lbj.forum.entity.UserEntity;
import cn.lbj.forum.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class StudyDaoImpl implements StudyDaoInf {
    /**
     * TODO 查询考研帖子列表
     * @return
     */
    public List<StudyEntity> findStudyList() {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<StudyEntity> list = new ArrayList<StudyEntity>();
        String sql = "select * from study_info order by create_time desc";
        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                StudyEntity study = new StudyEntity();
                study.setSid(rs.getInt(1));
                study.setTitle(rs.getString(2));
                study.setContent(rs.getString(3));
                study.setCover(rs.getString(4));
                study.setCreateTime(rs.getTimestamp(5));
                // TODO 获取对应用户表中的外键
                UserEntity author = new UserEntity();
                author.setUser_id(rs.getInt(6));
                study.setAuthor(author);
                list.add(study);
                System.out.println("查询所有考研帖子：" + rs.getString(3));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, ps, conn);
        }
        return list;
    }

    /**
     * TODO 添加考研帖子
     * @param study
     * @return
     */
    public int addStudy(StudyEntity study) {
        Connection conn = null;
        PreparedStatement ps = null;
        String sql = "insert into study_info(title,content,cover,create_time,user_id) values(?,?,?,?,?)";

        System.out.println("添加考研帖子");
        int i = 0;
        System.out.println(study.getCreateTime());
        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, study.getTitle());
            ps.setString(2, study.getContent());
            ps.setString(3, study.getCover());
            ps.setTimestamp(4, study.getCreateTime());
            ps.setInt(5, study.getAuthor().getUser_id());
            i = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(null, ps, conn);
        }
        return i;
    }

    /**
     * TODO 根据ID查询某个考研帖子
     * @param sid
     * @return
     */
    public StudyEntity findStudyById(int sid) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        StudyEntity study = null;
        String sql = "select * from study_info where sid = ?";
        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, sid);
            rs = ps.executeQuery();
            if(rs.next()){
                study = new StudyEntity();
                study.setSid(rs.getInt(1));
                study.setTitle(rs.getString(2));
                study.setContent(rs.getString(3));
                study.setCover(rs.getString(4));
                study.setCreateTime(rs.getTimestamp(5));
                // TODO 获取对应用户表中的外键
                UserEntity author = new UserEntity();
                author.setUser_id(rs.getInt(6));
                study.setAuthor(author);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, ps, conn);
        }
        return study;
    }

    /**
     * TODO 查询考研帖子对应的所有回复
     * @param sid
     * @return
     */
    public List<StudyReplyEntity> findStudyReplyList(int sid) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<StudyReplyEntity> list = new ArrayList<StudyReplyEntity>();
        // TODO 根据外键作为条件查询当前帖子的所有回复
        String sql = "select * from study_reply_info where sid = ?";
        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, sid);
            rs = ps.executeQuery();
            while(rs.next()){
                StudyReplyEntity reply = new StudyReplyEntity();
                reply.setRid(rs.getInt(1));
                reply.setContent(rs.getString(2));
                reply.setStudyReplyTime(rs.getTimestamp(3));
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
     * TODO 添加考研回复
     * @param reply
     * @return
     */
    public int addStudyReply(StudyReplyEntity reply) {
        Connection conn = null;
        PreparedStatement ps = null;
        int i = 0;

        System.out.println("添加回复成功");
        String sql = "insert into study_reply_info(reply_content, reply_time, user_id, sid) values(?,?,?,?)";
        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, reply.getContent());
            ps.setTimestamp(2, reply.getStudyReplyTime());
            // TODO 将相应的两个外键设值
            ps.setInt(3, reply.getUser().getUser_id());
            ps.setInt(4, reply.getStudy().getSid());

            i = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(null, ps, conn);
        }
        return i;
    }

    /**
     * TODO 根据用户ID查询用户的所有考研发帖
     * @param pid
     * @return
     */
    public List<StudyEntity> personStudy(int pid){
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String sql = "select * from study_info where user_id=?";
        List<StudyEntity> list = new ArrayList<StudyEntity>();

        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, pid);
            rs = ps.executeQuery();

            while (rs.next()) {
                StudyEntity study = new StudyEntity();
                study.setSid(rs.getInt(1));
                study.setTitle(rs.getString(2));
                study.setContent(rs.getString(3));
                study.setCover(rs.getString(4));
                study.setCreateTime(rs.getTimestamp(5));

                UserEntity user = new UserEntity();
                user.setUser_id(rs.getInt(6));
                study.setAuthor(user);
                list.add(study);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    /**
     * TODO 用户删除个人某个学习帖子
     * @param sid
     */
    public void deleteStudy(int sid){
        Connection conn = null;
        PreparedStatement ps = null;

        String sql = "delete from study_info where sid =?";

        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, sid);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(null, ps, conn);
        }
    }

    /**
     * TODO 管理员根据学习帖子id删除所有回复
     * @param sid
     */
    public void deleteStudyReply(int sid){

        System.out.println("sid: " + sid);
        Connection conn = null;
        PreparedStatement ps = null;

        String sql = "delete from study_reply_info where sid = ?";

        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, sid);

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(null, ps, conn);
        }
    }

    /**
     * TODO 用户删除某个考研学习回帖
     * @param rid
     */
    public void deleteStudyReplyByRid(int rid){
        Connection conn = null;
        PreparedStatement ps = null;

        String sql = "delete from study_reply_info where reply_id = ?";

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
     * TODO 删除用户所有考研发帖
     * @param uid
     */
    public void dUserAllStudyByUid(int uid){
        Connection conn = null;
        PreparedStatement ps = null;

        String sql = "delete from study_info where user_id=?";

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
     * TODO 删除用户的所有考研回帖
     * @param uid
     */
    public void dUserAllStudyReplyByUid(int uid){
        Connection conn = null;
        PreparedStatement ps = null;

        String sql = "delete from study_reply_info where user_id=?";

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
     * TODO 删除用户帖子下的所有考研回帖
     * @param uid
     */
    public void dUserOtherStudyRelyBySid(int uid){
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String sql = "select sid from study_info where user_id=?";

        List<StudyEntity> sidlist = new ArrayList<StudyEntity>();
        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, uid);
            rs = ps.executeQuery();

            while (rs.next()) {
                StudyEntity forum=new StudyEntity();
                forum.setSid(rs.getInt(1));
                sidlist.add(forum);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(null, ps, conn);
        }

        String ssql = "delete from study_reply_info where sid=?";

        try {
            for (StudyEntity forum : sidlist) {
                conn = DBUtil.getConnection();
                ps = conn.prepareStatement(ssql);
                ps.setInt(1, forum.getSid());

                ps.executeUpdate();
                DBUtil.close(null, ps, conn);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
