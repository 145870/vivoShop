package DAO;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.rowset.JoinRowSet;
import javax.xml.crypto.Data;

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
	
	
	//查询原密码是否正确
	public boolean isOldPassword(String id,String pwd) {
		String sql = "SELECT * FROM user_profile WHERE id = ? AND user_password = ?";
		return this.executeQuery(sql, new Mapper<Object>() {

			@Override
			public List<Object> mapper(ResultSet rs) throws SQLException {
				if(rs.next()) {
					return new ArrayList<Object>();
				}
				return null;
			}
			
		},id,pwd)!=null;
	}
	
	
	//修改密码
	public int updatePwd(String newpwd,String id) {
		String sql = "UPDATE user_profile SET user_password = ? WHERE id = ?";
		return execute(sql, newpwd,id);
	}
	//修改昵称
	public int updateNickname(String newNickname,long id) {//用户ID、新昵称
		String sql = "UPDATE user_profile SET user_name = ? WHERE id = ?";
		return this.execute(sql, newNickname,id);
	}
	
	//查询全部字段用于替换页面数据
	public List<UserProfile> selectAll(long id){
		AliyunOssUtil alyoss = new AliyunOssUtil();
		String sql = "select * from user_profile where id = ?";
		return this.executeQuery(sql, new Mapper<UserProfile>() {

			@Override
			public List<UserProfile> mapper(ResultSet rs) throws SQLException {
				List<UserProfile> list = new ArrayList<>();
				while(rs.next()) {
					long id = rs.getInt(1);
					String account_number = rs.getString(2);
					String nickname = rs.getString(3);
					String phone = rs.getString(4);
					String password = rs.getString(5);
					String eamil = rs.getString(6);
					String addres = rs.getString(7);
					int sex = rs.getInt(8);
					Date birthday = rs.getDate(9);
					Date create_time = rs.getDate(10);
					String head_image_url = alyoss.getImageUrl(rs.getString(11));
					UserProfile u = new UserProfile(id,account_number,nickname,phone,password,eamil,addres,sex,birthday,create_time,head_image_url);
					list.add(u);
				}
				return list;
			}
		}, id);
	}
}
