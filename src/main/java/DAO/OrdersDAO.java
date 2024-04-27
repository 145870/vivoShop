package DAO;

import java.sql.Date;

import util.BaseDAO;

public class OrdersDAO extends BaseDAO {
//	插入新订单表
	public int insertAddOrder(int user_id, String address_name, String phone, String province, String city, String district,
			String address,int orders_status) {
		String sql = "INSERT INTO orders VALUES(NULL,?,?,?,?,?,?,?,now(),?,null)";
		return this.execute(sql, user_id, address_name, phone, province, city, district, address ,orders_status );
		

	}
}
