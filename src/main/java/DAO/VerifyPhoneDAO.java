package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.BaseDAO;
import util.Mapper;

public class VerifyPhoneDAO extends BaseDAO{
	public List<Boolean> isPhoneNumberExist(String phonenumber) {
        // 查询手机号sql语句
        String sql = "SELECT * FROM user_profile WHERE phone = ?";
        
        // 执行查询并返回结果
        return executeQuery(sql, new Mapper<Boolean>() {
            @Override
            public List<Boolean> mapper(ResultSet rs) throws SQLException {
                // 读取查询结果
            	List<Boolean> list=new ArrayList<>();
                if (rs.next()) {
                   list.add(true);
                    
                } else {
                	list.add(false);
                }
                return list;
            }
        }, phonenumber);
    }
	
	
	public List<Boolean> selectUserPhPw(String phone,String pwd) {
		String sql = "SELECT * FROM user_profile WHERE phone = ? AND user_password = ?";
		return executeQuery(sql, new Mapper<Boolean>() {
			@Override
			public List<Boolean> mapper(ResultSet rs) throws SQLException {
				List<Boolean> list=new ArrayList<>();
				 if (rs.next()) {
	                   list.add(true);
	                    
	                } else {
	                	list.add(false);
	                }
	                return list;
			}
			
		}, phone,pwd);
	}
}
