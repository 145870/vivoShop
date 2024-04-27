package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.Address;
import util.BaseDAO;
import util.Mapper;

public class AddressDAO extends BaseDAO{
	//根据用户id查询对应地址表数据
	public List<Address> selectAddress(long uid){
		String sql  = "SELECT * FROM user_address_information WHERE user_id = ?";
		return this.executeQuery(sql,new Mapper<Address>() {

			@Override
			public List<Address> mapper(ResultSet rs) throws SQLException {
				List<Address> list  = new ArrayList<>();
				while(rs.next()) {
					long id = rs.getInt(1);
					long uid = rs.getInt(2);
					String name = rs.getString(3);
					String phone = rs.getString(4);
					String province = rs.getString(5);
					String city = rs.getString(6);
					String district = rs.getString(7);
					String address = rs.getString(8);
					int is_default = rs.getInt(9);
					Address ad = new Address(id,uid,name,phone,province,city,district,address,is_default);
					list.add(ad);
					
				}
				return list;
			}
		} , uid);
	}
}
