
package com.multi.dao;

import com.multi.model.User;
import java.util.List;
// 완전 추상클래스인 UserDao
public interface UserDao {
    void addUser(User user);
    void updateUser(User user);
    void deleteUser(int id);
    User getUser(int id);
    List<User> getAllUsers();
}

