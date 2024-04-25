package DAO;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import entity.UserProfile;
import util.*;

public class UserProfileDAO extends BaseDAO{
	
	//新增用户基本数据（注册）
	public int insertUserData(String phone,String user_password,String head_image_url) {
		//编写新增数据的sql语句
		String sql = "INSERT user_profile (phone,user_password,create_time,head_image_url)VALUES(?,?,NOW(),?)";
		//调用execute方法执行sql语句，并传入参数
		return execute(sql,phone,user_password,head_image_url);
	}
	
	
	//修改vivo号
	public int updatavivonum(String id,String num){
		String sql = "UPDATE user_profile SET account_number = ? WHERE id = ?";
		if (isNumberExistsByPid(id,num)) {//调用判断vivo号是否重复的方法
			return -1;
		}
		return execute(sql, num,id);
	}
	
	//判断vivo号是否重复
	public boolean isNumberExistsByPid(String id, String num) {
		String sql = "SELECT * FROM user_profile WHERE account_number = ? AND id <> ?";

		return this.executeQuery(sql, new Mapper<Object>() {

			@Override
			public List<Object> mapper(ResultSet rs) throws SQLException {
				if (rs.next()) {
					return new ArrayList<Object>();
				}
				return null;
				}
			}, num,id) != null;
		}
	
	public Map<String,Object> getAllByWhere(String account,String name,String phone,String email,String startTime,String endTime,String page,String limit){
		Map<String,Object> map = new HashMap<String, Object>();
        StringBuilder sql = new StringBuilder("SELECT * FROM user_profile where user_name like ?");
        List<String>  params = new ArrayList<String>();
        params.add("%"+name+"%");
        if (account != null && !account.isEmpty()) {
        	sql.append(" AND account_number like ?");
            params.add("%"+account+"%");
        }
        
        if (phone != null && !phone.isEmpty()) {
        	sql.append(" AND phone like ?");
            params.add("%"+phone+"%");
        }
        
        if (email != null && !email.isEmpty()) {
        	sql.append(" AND mailbox like ?");
            params.add("%"+email+"%");
        }
        
        if (startTime != null && !startTime.isEmpty()) {
        	sql.append(" AND create_time >= ?");
            params.add(startTime);
        }
        
        if (endTime != null && !endTime.isEmpty()) {
        	sql.append(" AND create_time <= ?");
            params.add(endTime);
        }
        sql.append(" ORDER BY id DESC");
        
      //查询总数
        List<Integer> listcount = this.executeQuery(sql.toString(), new Mapper<Integer>() {

			@Override
			public List<Integer> mapper(ResultSet rs) throws SQLException {
				List<Integer> list = new ArrayList<Integer>();
				while(rs.next()) {
					list.add(rs.getInt(1));
				}
				return list;
			}
	    	
	    },params.toArray());
        map.put("count", listcount.size());
        
        // 添加分页限制
        Integer li = Integer.valueOf(limit);
	    Integer pag = Integer.valueOf(page);
        sql.append(" LIMIT "+limit+" OFFSET "+(pag-1)*li);  
        
        List<UserProfile> list = this.executeQuery(sql.toString(), new Mapper<UserProfile>() {

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
        
        map.put("list", list);
        
		return map;
	}


	public String doInsertByCount(String account,String pwd, String name, String phone, String mailbox, String sex,
			String birthday) {
		StringBuilder sqlBuilderHead = new StringBuilder("INSERT INTO user_profile (account_number, user_name, phone, user_password, head_image_url");
		StringBuilder sqlBuilderTail = new StringBuilder("VALUES (?, ?, ?, ?, '/images/user/head_image/default.jpg'");
		List<Object> params = new ArrayList<>();

	    // 添加必填参数到 SQL 语句和参数列表中
	    params.add(account);
	    params.add(name);
	    params.add(phone);
	    params.add(pwd);

	    // 添加可选参数到 SQL 语句和参数列表中
	    if (!mailbox.isEmpty()) {
	    	sqlBuilderHead.append(",mailbox ");
	    	sqlBuilderTail.append(",? ");
	        params.add(mailbox);
	    }
	    if (!birthday.isEmpty()) {
	    	sqlBuilderHead.append(",birthday ");
	    	sqlBuilderTail.append(",? ");
	        params.add(birthday);
	    }
	    sqlBuilderHead.append(") ");
	    sqlBuilderTail.append(") ");
	    
	    // 构建最终的 SQL 语句
	    String sql = sqlBuilderHead.toString()+sqlBuilderTail.toString();
	    String isExists = existsField(phone, account, mailbox);
	    if (isExists!=null) {
			return isExists+"已存在";
		}
	    
		return this.execute(sql, params.toArray())>0?"true":"false";
	}
	
	public String existsField(String phone, String account, String email) {
	    String sql = "SELECT CASE "
	               + "WHEN EXISTS (SELECT * FROM user_profile WHERE phone = ?) THEN '手机号' "
	               + "WHEN EXISTS (SELECT * FROM user_profile WHERE account_number = ?) THEN '账号' "
	               + "WHEN EXISTS (SELECT * FROM user_profile WHERE mailbox = ?) THEN '邮箱' "
	               + "ELSE NULL END AS exists_field";

	    return this.executeQuery(sql, new Mapper<String>() {
	        @Override
	        public List<String> mapper(ResultSet rs) throws SQLException {
	            if (rs.next()) {
	                return Collections.singletonList(rs.getString("exists_field"));
	            }
	            return null;
	        }
	    }, phone, account, email).get(0);
	}

	public String existsFieldByNotID(String id,String phone, String account, String email) {
	    String sql = "SELECT CASE "
	               + "WHEN EXISTS (SELECT * FROM user_profile WHERE phone = ? and id <> "+id+") THEN '手机号' "
	               + "WHEN EXISTS (SELECT * FROM user_profile WHERE account_number = ? and id <> "+id+") THEN '账号' "
	               + "WHEN EXISTS (SELECT * FROM user_profile WHERE mailbox = ? and id <> "+id+") THEN '邮箱' "
	               + "ELSE NULL END AS exists_field ";

	    return this.executeQuery(sql, new Mapper<String>() {
	        @Override
	        public List<String> mapper(ResultSet rs) throws SQLException {
	            if (rs.next()) {
	                return Collections.singletonList(rs.getString("exists_field"));
	            }
	            return null;
	        }
	    }, phone, account, email,id).get(0);
	}

	public String doUpdateById(String id, String account, String pwd, String name, String phone, String mailbox,
			String sex, String birthday, String address) {
		String sql = "UPDATE user_profile SET account_number=?,user_name=?,phone=?,user_password=?,mailbox=?,address=?,sex=?,birthday=? WHERE id = ?";
	    String isExists = existsFieldByNotID(id,phone, account, mailbox);
		if (isExists!=null) {
			return isExists+"已存在";
		}
		if (birthday.isEmpty()) {
			birthday=null;
		}
		
		return this.execute(sql,account,name,phone,pwd,mailbox,address,sex,birthday,id)>0?"true":"false";
	}


	public int deleteById(String id) {
		String sql="delete from user_profile where id=?";
		return this.execute(sql, id);
	}


	public String doUpdateByIdAndUrl(String id, String url) {
		String sql="update user_profile set head_image_url=? where id=?";
		return this.execute(sql,url,id)>0?"true":"false";
	}
}
