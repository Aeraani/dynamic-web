
package com.multi.controller;

import com.multi.util.DBUtil;
import com.multi.vo.EmpVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ListAction  implements Action {
    private String path;
    private boolean isRedirect;

    public ListAction(String path, boolean isRedirect) {
        this.path = path;
        this.isRedirect = isRedirect;
    }

    @Override
    public ActionForWard execute(HttpServletRequest request, HttpServletResponse response) {
        //BL수행
        System.out.println("ListAction execute");
        request.setAttribute("arraylist","hello World");
        //System.out.println("connection="+ DBUtil.getConnection());
        Connection connection=null; //DB 커낵션 가져옴
        String sql="select * from emp";
        PreparedStatement pstmt=null;
        ResultSet resultSet=null;
        List <EmpVO> empVOList=new ArrayList<EmpVO>();
        try{
            connection=DBUtil.getConnection();
            pstmt=connection.prepareStatement(sql);
            resultSet=pstmt.executeQuery();
            while (resultSet.next()){ //tuple별로 데이터 가져오기
                EmpVO empVO=new EmpVO();
                empVO.setEmpno(resultSet.getInt("empno"));
                empVO.setEname(resultSet.getString("ename"));

            }
        }catch(Exception e){

        }finally {

        }

        return new ActionForWard(path, isRedirect);
    }
}
