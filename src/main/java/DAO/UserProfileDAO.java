package DAO;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
	}
