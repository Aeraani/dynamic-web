package com.multi.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

//1. JDBC를 연결하는 드리이브 코드 설정
//2. MVC구조를 이해하는 코드로 진행
//3. Java부분, jsp부분을 구분해서 프로그램을 구현
//4. eljstl을 이용하는 목록 출력
public class DBUtil {
    private static final String URL = "jdbc:mysql://localhost:3306/spring";
    private static final String USER = "apple";
    private static final String PASSWORD = "apple";

    public static Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }
}