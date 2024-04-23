package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import util.*;

import entity.UserProfile;

public class UserProfileDAO extends BaseDAO{
	public Map<String,Object> getAllByPageAndWhere(String account,String name,String phone,String email,String startTime,String endTime,String page,String limit){
	    StringBuilder sqlBuilder = new StringBuilder("SELECT * FROM user_profile where user_name like ? ");
	    List<Object> params = new ArrayList<>();
	    params.add("%"+name+"%");
	    
	    if (account != null && !account.isEmpty()) {
	    	sqlBuilder.append("and account_number like ? ");
	        params.add("%" + account + "%");
	    }
	    
	    if (phone != null && !phone.isEmpty()) {
	    	sqlBuilder.append("and phone = ? ");
	        params.add(phone);
	    }
	    
	    if (email != null && !email.isEmpty()) {
	    	sqlBuilder.append("and mailbox = ? ");
	        params.add(email);
	    }
	    
	    if (startTime != null && !startTime.isEmpty()) {
	    	sqlBuilder.append("and create_time >= ? ");
	        params.add(startTime);
	    }
	    
	    if (startTime != null && !startTime.isEmpty()) {
	    	sqlBuilder.append("and end_time >= ? ");
	        params.add(startTime);
	    }
	    
	    // 添加排序
	    sqlBuilder.append("ORDER BY id DESC ");
	    
	    List<Integer> listcount = this.executeQuery(sqlBuilder.toString(), new Mapper<Integer>() {

			@Override
			public List<Integer> mapper(ResultSet rs) throws SQLException {
				List<Integer> list = new ArrayList<Integer>();
				while(rs.next()) {
					list.add(rs.getInt(1));
				}
				return list;
			}
	    	
	    },params.toArray());
	    
	    int count = listcount.size();
	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("count",count);
	    
	    Integer li = Integer.valueOf(limit);
	    Integer pag = Integer.valueOf(page);
	    //添加分页
	    sqlBuilder.append("LIMIT "+limit+" OFFSET "+(pag-1)*li);
	    
	    List<UserProfile> list = this.executeQuery(sqlBuilder.toString(), new Mapper<UserProfile>() {

			@Override
			public List<UserProfile> mapper(ResultSet rs) throws SQLException {
				List<UserProfile> list = new ArrayList<UserProfile>();
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
							));
				}
				return list;
			}
		}, params.toArray());
	    map.put("list",list);
	    return map;
	    
	}
}
