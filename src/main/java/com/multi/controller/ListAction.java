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
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
        //BL수행
        System.out.println("ListAction execute");
        request.setAttribute("arraylist", "Hello World");
        //System.out.println("Connetion="+DBUtil.getConnection());
        Connection connection=null;
        String sql="SELECT * FROM EMP";
        PreparedStatement pstmt=null;
        ResultSet resultSet=null;
        List<EmpVO> empVOList=new ArrayList<EmpVO>();
        try {
            connection=DBUtil.getConnection();
            pstmt=connection.prepareStatement(sql);
            resultSet=pstmt.executeQuery();
            while (resultSet.next()) {//tuple별로 데이터를 가져온다~
                EmpVO empVO=new EmpVO();
                empVO.setEmpno(resultSet.getInt("empno"));
                empVO.setEname(resultSet.getString("ename"));
                empVO.setJob(resultSet.getString("job"));
                empVO.setSal(resultSet.getInt("sal"));
                empVO.setHiredate(resultSet.getString("hiredate"));
                empVOList.add(empVO);
            }

        }catch (Exception e) {
            e.printStackTrace();//console Exception 발생

        }finally {
            try{
                if(connection!=null||pstmt!=null||resultSet!=null){
                    connection.close();
                    pstmt.close();
                    resultSet.close();
                }

            }catch (Exception e){

            }


        }
        //empVOList를 list라는 이름으로 request에 저장을 해서 이동을 반드시 forward로 이동
        request.setAttribute("list", empVOList);

        return new ActionForward(path, isRedirect);
    }
}