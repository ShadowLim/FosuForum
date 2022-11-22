package cn.lbj.forum.service;

import cn.lbj.forum.entity.UserEntity;

import java.util.List;

public interface UserServiceInf {
    // TODO 登录时作用户的验证查询
    public UserEntity login(String userId, String passwd);

    // TODO 添加用户
    public int saveUser(UserEntity user);

    // TODO 删除用户
    public void deleteUser(int uid);

    // TODO 修改用户
    public void updateUser(UserEntity user);

    // TODO 查询用户信息ById
    public UserEntity findUser(int uid);

    // TODO 查询所有用户
    public List<UserEntity> findUserList();
}
