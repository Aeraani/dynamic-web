package com.multi.config;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.Reader;

public class MyBatisUtil {
    private static SqlSessionFactory sqlSessionFactory;
    static {
        try {
            //단지 reader 객체를 생성한다 mybatis-config.xml를 읽어오는 객체를 생성
            //mybatis-config.xml 에는 DB 정보와 SQL 문서정보가 들어가있다..
            Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
            //sqlSessionFactory에는 db정보와 sql정보가 들어있는 상태로 sqlSession생성
            sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
        } catch (Exception e) {
            throw new RuntimeException("Error initializing SqlSessionFactory: " + e.getMessage(), e);
        }
    }
    //getSqlSessionFactory는 SqlSession을 만드는 공장.. 공장 만들때는 db, query에 대한 정보가 있어야함
    public static SqlSessionFactory getSqlSessionFactory() { return sqlSessionFactory; }
}