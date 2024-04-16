package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;

import entity.InventoryDetails;
import util.BaseDAO;
import util.Mapper;

public class InventoryDetailsDAO extends BaseDAO{
	//查询库存连接商品，根据条件查询，支持分页
	public Map<String,Object> getInventoryDetailsAndCountByWhere(String pname,String cid,String page,String limit){
		String sql = "SELECT id.id,p.`information_name`,pav.`attr_vals`,id.quantity FROM inventory_details id JOIN product_attr_vals pav "
				+ "ON pav.id = id.attr_vals_id JOIN products_information p "
				+ "ON p.id = pav.`product_id` "
				+ "WHERE p.`information_name` LIKE ? ";
		List<Object> params = new ArrayList<Object>();
		params.add("%"+pname+"%");
		if (cid!=null&&!cid.isEmpty()) {
			sql+="AND p.`class_id` = ? ";
			params.add(cid);
		}
		
		Map<String,Object> map = new HashMap<String, Object>();
		int count = this.executeQuery(sql, new Mapper<Object>() {

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
		
		Integer li = Integer.valueOf(limit);
		Integer pag = Integer.valueOf(page);
		//添加分页
		sql+="LIMIT "+limit+" OFFSET "+(pag-1)*li;
		
		List<InventoryDetails> list = this.executeQuery(sql, new Mapper<InventoryDetails>() {

			@Override
			public List<InventoryDetails> mapper(ResultSet rs) throws SQLException {
				List<InventoryDetails> list = new ArrayList<InventoryDetails>();
				while(rs.next()) {
					InventoryDetails i = new InventoryDetails();
					i.setId(rs.getLong(1));
					i.setPname(rs.getString(2));
					i.setAttr_vals(new Gson().fromJson(rs.getString(3), String[].class));
					i.setQuantity(rs.getInt(4));
					
					list.add(i);
				}
				return list;
			}
		},  params.toArray());
		
		map.put("list", list);
		return map;
		
	}
	
	public int doInsert(String pavid,String count) {
		String sql = "INSERT INTO inventory_details(attr_vals_id,quantity) VALUES(?,?)";
		return this.execute(sql, pavid,count);
	}
	

	public int doUpdateCountByID(String id,String count) {
		String sql = "update inventory_details set quantity = ? where id = ?" ;
		return this.execute(sql,count,id);
	}

	public int doDeleteByID(String id) {
		String sql = "delete from inventory_details where id = ? " ;
		return this.execute(sql,id);
	}
}
