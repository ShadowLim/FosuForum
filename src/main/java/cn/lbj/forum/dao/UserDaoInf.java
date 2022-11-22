package cn.lbj.forum.dao;

import cn.lbj.forum.entity.UserEntity;

import java.util.List;

public interface UserDaoInf {

    // TODO 登录时作用户的验证查询
    public UserEntity findUser(String userId, String passwd);

    // TODO 根据id查询用户
    public UserEntity findUserById(int id);

    // TODO 添加用户
    public int addUser(UserEntity user);

    // TODO 删除用户
    public void deleteUser(int uid);

    // TODO 修改用户
    public void updateUser(UserEntity user);

    // TODO 查询所有用户信息
    public List<UserEntity> findUserlist();
}
