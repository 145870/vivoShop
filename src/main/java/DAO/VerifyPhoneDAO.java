package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.UserProfile;
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
	
	
	public List<UserProfile> selectUserPhPw(String phone,String pwd) {
		String sql = "SELECT * FROM user_profile WHERE phone = ? AND user_password = ?";
		return executeQuery(sql, new Mapper<UserProfile>() {
			@Override
			public List<UserProfile> mapper(ResultSet rs) throws SQLException {
				List<UserProfile> list=new ArrayList<>();
				 	while(rs.next()) {
				 		list.add(new UserProfile(
				 						rs.getLong(1),
				 						rs.getString(2),
				 						rs.getString(3),
				 						rs.getString(4),
				 						rs.getString(5),
				 						rs.getString(6),
				 						rs.getString(7),
				 						rs.getInt(8),
				 						rs.getTimestamp(9),
				 						rs.getTimestamp(10),
				 						rs.getString(11)
				 					)
				 				);
				 	}
	                return list;
			}
			
		}, phone,pwd);
	}


	public List<UserProfile> getByPhone(String phone) {
		String sql = "SELECT * FROM user_profile WHERE phone = ?";
		return executeQuery(sql, new Mapper<UserProfile>() {
			@Override
			public List<UserProfile> mapper(ResultSet rs) throws SQLException {
				List<UserProfile> list=new ArrayList<>();
				 	while(rs.next()) {
				 		list.add(new UserProfile(
				 						rs.getLong(1),
				 						rs.getString(2),
				 						rs.getString(3),
				 						rs.getString(4),
				 						rs.getString(5),
				 						rs.getString(6),
				 						rs.getString(7),
				 						rs.getInt(8),
				 						rs.getTimestamp(9),
				 						rs.getTimestamp(10),
				 						rs.getString(11)
				 					)
				 				);
				 	}
	                return list;
			}
			
		}, phone);
	}
}
