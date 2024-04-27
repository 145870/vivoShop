package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import entity.Admin;
import entity.Orders;
import util.BaseDAO;
import util.Mapper;

public class OrdersDAO extends BaseDAO{
	public Map<String,Object> getOrdersByWhere(String id,String name,String phone,String stata,String startTime,String endTime,String service,String page,String limit){
		StringBuilder sqlBuilder = new StringBuilder("select * from orders where address_name like ? ");
	    Map<String, Object> map = new HashMap<String, Object>();
	    List<Object> params = new ArrayList<>();
	    params.add("%"+name+"%");
	    
	    if (id != null && !id.isEmpty()) {
	    	sqlBuilder.append("AND id like ? ");
	    	params.add("%"+id+"%");
		}
	    
	    if (phone != null && !phone.isEmpty()) {
	    	sqlBuilder.append("AND phone like ? ");
	    	params.add("%"+phone+"%");
		}
	    
	    if (stata != null && !stata.isEmpty()) {
	    	sqlBuilder.append("AND orders_status = ? ");
	    	params.add(stata);
		}
	    
	    if (startTime != null && !startTime.isEmpty()) {
	    	sqlBuilder.append("AND create_time >= ? ");
	    	params.add(startTime);
		}
	    
	    if (endTime != null && !endTime.isEmpty()) {
	    	sqlBuilder.append("AND create_time <= ? ");
	    	params.add(endTime);
		}
	    
	    if (service != null && !service.isEmpty()) {
	    	if (service.equals("0")) {
	    		sqlBuilder.append("AND service_id is not null ");
			}else {
	    		sqlBuilder.append("AND service_id is null ");
			}
	    	
		}
	    
	    int count = this.executeQuery(sqlBuilder.toString(), new Mapper<Object>() {

			@Override
			public List<Object> mapper(ResultSet rs) throws SQLException {
				List<Object> list = new ArrayList<Object>();
				while(rs.next()) {
					list.add("1");
				}
				return list;
			}
		}, params.toArray()).size();
	    map.put("count", count);
	    
	    sqlBuilder.append("ORDER BY id DESC ");
	    Integer li = Integer.valueOf(limit);
	    Integer pag = Integer.valueOf(page);
	    //添加分页
	    sqlBuilder.append("LIMIT "+limit+" OFFSET "+(pag-1)*li);
	    
	    List<Orders> list = this.executeQuery(sqlBuilder.toString(), new Mapper<Orders>() {

			@Override
			public List<Orders> mapper(ResultSet rs) throws SQLException {
				List<Orders> list = new ArrayList<Orders>();
				while(rs.next()) {
					Orders order = new Orders();
					order.setId(rs.getLong("id"));
			        order.setUserId(rs.getLong("user_id"));
			        order.setAddressName(rs.getString("address_name"));
			        order.setPhone(rs.getString("phone"));
			        order.setProvince(rs.getString("province"));
			        order.setCity(rs.getString("city"));
			        order.setDistrict(rs.getString("district"));
			        order.setAddress(rs.getString("address"));
			        order.setCreateTime(rs.getTimestamp("create_time"));
			        order.setOrdersStatus(rs.getInt("orders_status"));
			        order.setServiceId(rs.getLong("service_id"));

					list.add(order);
				}
				return list;
			}
		}, params.toArray());
	    map.put("list", list);
	    return map;
	}
	
	public int doUpdateById(String id,String name,String phone,String province,String city,String district,String address,String state) {
		String sql = "UPDATE orders SET address_name = ?,phone=?,province=?,city=?,district=?,address=?,orders_status=? WHERE id = ? ";
		return this.execute(sql, name,phone,province,city,district,address,state,id);
	}

	public int doDeleteByID(String id) {
		String sql = "delete from orders where id = ? ";
		return this.execute(sql, id);
	}
}
