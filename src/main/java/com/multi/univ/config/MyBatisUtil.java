package com.multi.univ.config;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.Reader;

public class MyBatisUtil {
    private static SqlSessionFactory sqlSessionFactory;
    static {
        try {
            Reader reader = Resources.getResourceAsReader("mybatis-config.xml");

            sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader,"dev");
        } catch (Exception e) {
            throw new RuntimeException("Error initializing SqlSessionFactory: " + e.getMessage(), e);
        }
    }

    public static SqlSessionFactory getSqlSessionFactory() { return sqlSessionFactory; }
}