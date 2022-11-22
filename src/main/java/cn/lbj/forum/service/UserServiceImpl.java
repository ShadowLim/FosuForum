package cn.lbj.forum.service;

import cn.lbj.forum.dao.UserDaoImpl;
import cn.lbj.forum.dao.UserDaoInf;
import cn.lbj.forum.entity.UserEntity;

import java.util.List;

public class UserServiceImpl implements UserServiceInf {
    public UserEntity login(String userId, String passwd) {
        // TODO 调用dao做用户的查询
        UserDaoInf userDao = new UserDaoImpl();
        UserEntity user = userDao.findUser(userId, passwd);
        return (user==null) ? null : user;
    }

    public int saveUser(UserEntity user) {
        // TODO 调用dao保存用户
        UserDaoInf userDao = new UserDaoImpl();
        return userDao.addUser(user);
    }

    // TODO 调用Dao删除用户
    public void deleteUser(int uid) {
        UserDaoInf user = new UserDaoImpl();
        user.deleteUser(uid);
    }

    public void updateUser(UserEntity user) {
        UserDaoInf userdao = new UserDaoImpl();
        userdao.updateUser(user);
    }

    public UserEntity findUser(int uid) {
        UserDaoInf userDao = new UserDaoImpl();
        UserEntity user = userDao.findUserById(uid);
        return (user==null) ? null : user;
    }

    public List<UserEntity> findUserList() {
        UserDaoInf userDao = new UserDaoImpl();
        List<UserEntity> userList=userDao.findUserlist();
        return userList;
    }

}
