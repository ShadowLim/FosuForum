package cn.lbj.forum.service;

import cn.lbj.forum.dao.PoDaoImpl;
import cn.lbj.forum.dao.PoDaoInf;

import java.util.ArrayList;
import java.util.List;

public class PoServiceImpl implements PoServiceInf {
    /**
     * TODO 按时间（月份）分组统计帖子发表数量
     * @return
     */
    public List<Object> releaseCntByDate(String uid) {

        // TODO 调用DAO获取数据(List)
        PoDaoInf poDao = new PoDaoImpl();
        List<Object[]> list = poDao.releaseCntByDate(uid);

        List<Object> ans = new ArrayList<>();

        for(int i = 0; i < list.size(); i++) {
            Object[] arr = list.get(i);
            ans.add(arr[0]);
            ans.add(arr[1]);
        }

        /**
         * ***************************
         * 9月份-1
         * ***************************
         * 10月份-3
         */
        for(int i = 0; i < ans.size() - 1; i += 2) {
            System.out.println("***************************");
            System.out.println(ans.get(i) + "-" + ans.get(i + 1));
        }

        return ans;
    }


    /**
     * TODO 统计回帖数量前5的帖子
     * @param uid
     * @return
     */
    @Override
    public List<Object> replyCntTop5(String uid) {
        // TODO 调用DAO获取数据(List)
        PoDaoInf poDao = new PoDaoImpl();
        List<Object[]> list = poDao.replyCntTop5(uid);

        List<Object> ans = new ArrayList<>();

        for(int i = 0; i < list.size(); i++) {
            Object[] objects = list.get(i);
            ans.add(objects[0]);
            ans.add(objects[1]);
        }

        /**
         * ***************************
         * 分页查询==>3
         * ***************************
         * tset==>2
         * ***************************
         * 程序员第一行代码==>2
         * ***************************
         * 列举大数据常用组件及框架==>1
         * ***************************
         * fa==>1
         */
        for(int i = 0; i < ans.size() - 1; i += 2) {
            System.out.println("***************************");
            System.out.println(ans.get(i) + "==>" + ans.get(i + 1));
        }

        return ans;
    }

    /**
     * TODO 按时间（月份）分组统计学习专区帖子发表数量
     * @param u_id
     * @return
     */
    @Override
    public List<Object> studyReleaseCntByDate(String u_id) {
        // TODO 调用DAO获取数据(List)
        PoDaoInf poDao = new PoDaoImpl();
        List<Object[]> list = poDao.studyReleaseCntByDate(u_id);

        List<Object> ans = new ArrayList<>();

        for(int i = 0; i < list.size(); i++) {
            Object[] arr = list.get(i);
            ans.add(arr[0]);
            ans.add(arr[1]);
        }


        for(int i = 0; i < ans.size() - 1; i += 2) {
            System.out.println("************ 学习专区帖子统计 ***************");
            System.out.println(ans.get(i) + "-" + ans.get(i + 1));
        }

        return ans;
    }

    /**
     * TODO 统计学习专区回帖数量前5的帖子
     * @param uid
     * @return
     */
    @Override
    public List<Object> studyReplyCntTop5(String uid) {

        // TODO 调用DAO获取数据(List)
        PoDaoInf poDao = new PoDaoImpl();
        List<Object[]> list = poDao.studyReplyCntTop5(uid);

        List<Object> ans = new ArrayList<>();

        for(int i = 0; i < list.size(); i++) {
            Object[] objects = list.get(i);
            ans.add(objects[0]);
            ans.add(objects[1]);
        }


        for(int i = 0; i < ans.size() - 1; i += 2) {
            System.out.println("*********** 学习专区回帖Top5统计 ****************");
            System.out.println(ans.get(i) + "==>" + ans.get(i + 1));
        }

        return ans;
    }


    /**
     * TODO 普通用户发帖统计Top5
     * @param u_id
     * @return
     */
    @Override
    public List<Object> forumCntByUserTop5(String u_id) {

        // TODO 调用DAO获取数据(List)
        PoDaoInf poDao = new PoDaoImpl();
        List<Object[]> list = poDao.forumCntByUserTop5(u_id);

        List<Object> ans = new ArrayList<>();

        for(int i = 0; i < list.size(); i++) {
            Object[] objects = list.get(i);
            ans.add(objects[0]);
            ans.add(objects[1]);
        }

        /**
         * *********** 普通用户发帖统计Top5 ****************
         * 20201001-->8
         * *********** 普通用户发帖统计Top5 ****************
         * 20201002-->3
         * *********** 普通用户发帖统计Top5 ****************
         * 20201004-->1
         */
        for(int i = 0; i < ans.size() - 1; i += 2) {
            System.out.println("*********** 普通用户发帖统计Top5 ****************");
            System.out.println(ans.get(i) + "-->" + ans.get(i + 1));
        }

        return ans;

    }


    /**
     * TODO 普通用户学习发帖统计Top5
     * @param u_id
     * @return
     */
    @Override
    public List<Object> studyCntByUserTop5(String u_id) {

        // TODO 调用DAO获取数据(List)
        PoDaoInf poDao = new PoDaoImpl();
        List<Object[]> list = poDao.studyCntByUserTop5(u_id);

        List<Object> ans = new ArrayList<>();

        for(int i = 0; i < list.size(); i++) {
            Object[] objects = list.get(i);
            ans.add(objects[0]);
            ans.add(objects[1]);
        }


        for(int i = 0; i < ans.size() - 1; i += 2) {
            System.out.println("*********** 普通用户学习发帖统计Top5 ****************");
            System.out.println(ans.get(i) + "==>" + ans.get(i + 1));
        }

        return ans;
    }
}
