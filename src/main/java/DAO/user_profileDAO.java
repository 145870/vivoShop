package DAO;
import java.util.Date;

import util.*;

public class user_profileDAO extends BaseDAO{
	public int insertUserData(String phone,String user_password,String head_image_url) {
		//编写新增数据的sql语句
		String sql = "INSERT user_profile (phone,user_password,create_time,head_image_url)VALUES(?,?,NOW(),?)";
		//调用execute方法执行sql语句，并传入参数
		return execute(sql,phone,user_password,head_image_url);
	}
}
