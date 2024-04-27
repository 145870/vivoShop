package DAO;

import util.BaseDAO;

public class OrdersDetailsDAO extends BaseDAO {
//	插入新订单明细表
	public int insertAddOrder(int order_id, int product_attr_vals_id, int quantity) {
		String sql = "INSERT INTO orders_details(NULL,?,?,?)";
		return this.execute(sql, order_id, product_attr_vals_id, quantity);
		

	}
}
