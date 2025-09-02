
package com.multi.service;
import com.multi.dao.UserDao;
import com.multi.dao.UserDaoImpl;
import com.multi.model.User;
import java.util.List;

public class UserServiceImpl implements UserService {
    //UpCast, DownCast,Composition(강한 포함관계 의미), Aggregation(집힙관계 의미), 다형성
    private UserDao userDao = new UserDaoImpl(); //다형성 발생, 유저서비스 안에 다오 있음. 컴포지티브
    // UserServiceImpl가 userDao를 의존

    @Override
    public void addUser(User user) {
        userDao.addUser(user);
    }

    @Override
    public void updateUser(User user) {
        userDao.updateUser(user);
    }

    @Override
    public void deleteUser(int id) {
        userDao.deleteUser(id);
    }

    @Override
    public User getUser(int id) { //상세정보
        return userDao.getUser(id);
    }

    @Override
    public List<User> getAllUsers() {
        return userDao.getAllUsers();
    }
}

