package DAO;

import util.BaseDAO;

public class OrdersDetailsDAO extends BaseDAO{
	public int getSold() {
		String sql = "SELECT SUM(quantity) FROM orders_details";
		Object jg = this.singleObject(sql);
		if (jg==null) {
			return 0;
		}
		return Integer.valueOf(jg.toString());
	}

	public Double getSales() {
		String sql = "SELECT SUM(od.quantity*pav.`sale_amount`) FROM orders_details od JOIN product_attr_vals pav ON od.`product_attr_vals_id`=pav.`id` ";
		Object jg = this.singleObject(sql);
		if (jg==null) {
			return 0.0;
		}
		return Double.valueOf(jg.toString());
	}

	public int doDeleteByOid(String id) {
		String sql = "delete from orders_details where order_id = ?";
		return this.execute(sql, id);
	}
}

