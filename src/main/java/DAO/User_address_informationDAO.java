package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.User_address_information;
import util.BaseDAO;
import util.Mapper;

public class User_address_informationDAO extends BaseDAO {
	// 根据用户id查找地址
	public List<User_address_information> queryAdderid(int id) {
		String sql = "SELECT * FROM user_address_information WHERE user_id=?";
		return this.executeQuery(sql, new Mapper<User_address_information>() {
			@Override
			public List<User_address_information> mapper(ResultSet rs) throws SQLException {
				List<User_address_information> list = new ArrayList<User_address_information>();
				while (rs.next()) {
					list.add(new User_address_information(rs.getInt("id"), rs.getInt("user_id"),
							rs.getString("address_name"), rs.getString("phone"), rs.getString("province"),
							rs.getString("city"), rs.getString("district"), rs.getString("address"),
							rs.getInt("is_default")));
				}
				return list;
			}
		}, id);
	}
	

//	插入新地址
	public int insertAdd(int user_id, String address_name, String phone, String province, String city, String district,
			String address, int is_default) {
		String sql = "INSERT INTO user_address_information VALUES(NULL,?,?,?,?,?,?,?,?)\r\n";
		return this.execute(sql, user_id, address_name, phone, province, city, district, address, is_default);
	}

	//根据id删除
	public int delete(int id) {
		String sql = "DELETE FROM user_address_information WHERE id=?";
		return this.execute(sql,id);
	}
	
	//修改地址
	public int updateadd(String address_name,String phone,String province,String city,String district,String address,int is_default,int id) {
		String sql = "UPDATE  user_address_information SET\r\n"
				+ "address_name=?,phone=?,province=?,city=?,district=?,address=?,is_default=? WHERE id=?";
		return this.execute(sql,address_name,phone,province,city,district,address,is_default,id);
	}
}
