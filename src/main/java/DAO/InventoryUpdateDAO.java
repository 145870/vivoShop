package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;

import entity.InventoryUpdate;
import util.BaseDAO;
import util.Mapper;

public class InventoryUpdateDAO extends BaseDAO{
	/**
	 * @param IDid
	 * @param type
	 * @param old_quantity
	 * @param new_quantity
	 * @param admin_id
	 * @param reason
	 * @return
	 */
	public int doInsert(String IDid,String type,String old_quantity,String new_quantity,String admin_id,String reason) {
		String sql = "INSERT INTO inventory_update "
				+ "(inventory_details_id, update_type, old_quantity, new_quantity, admin_id,reason) VALUES "
				+ "(?, ?, ?, ?, ?,?)";
		
		return this.execute(sql, IDid,type,old_quantity,new_quantity,admin_id,reason);
	}
	
	
	/**
	 * @param pname 产品名
	 * @param type 类型
	 * @param adminID 管理员id
	 * @param startTime 开始时间
	 * @param endTime 结束时间
	 * @param page 当前页
	 * @param limit 显示数量
	 * @return 多表条件查询
	 */
	public Map<String, Object> getInventoryUpdateAndPavAndPByWhere(String pname,String type,String adminID,String startTime,String endTime,String page,String limit){
	    StringBuilder sqlBuilder = new StringBuilder(
	    		"SELECT iu.`id`,p.`information_name`,pav.`attr_vals`,iu.`update_type`,iu.`old_quantity`,iu.`new_quantity`,iu.`update_time`,iu.`reason`,a.`admin_name` FROM inventory_update iu "
	    		+ "JOIN inventory_details id ON iu.inventory_details_id = id.`id` "
	    		+ "JOIN product_attr_vals pav ON id.`attr_vals_id` = pav.`id` "
	    		+ "JOIN products_information p ON pav.`product_id` = p.`id` "
	    		+ "JOIN admin a ON iu.`admin_id` = a.`id` "
	    		+ "WHERE p.`information_name` LIKE ? ");
	    
	    Map<String, Object> map = new HashMap<String, Object>();
	    List<Object> params = new ArrayList<>();
	    params.add("%"+pname+"%");
	    
	    if (type != null && !type.isEmpty()) {
	    	sqlBuilder.append("AND iu.`update_type` = ? ");
	    	params.add(type);
		}
	    
	    if (adminID != null && !adminID.isEmpty()) {
	    	sqlBuilder.append("AND a.`id`= ? ");
	    	params.add(adminID);
		}
	    
	    if (startTime != null && !startTime.isEmpty()) {
	    	sqlBuilder.append("AND iu.`update_time` >= ? ");
	    	params.add(startTime);
		}
	    
	    if (endTime != null && !endTime.isEmpty()) {
	    	sqlBuilder.append("AND iu.`update_time` <= ? ");
	    	params.add(endTime);
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
	    
	    sqlBuilder.append("ORDER BY iu.id DESC ");
	    Integer li = Integer.valueOf(limit);
	    Integer pag = Integer.valueOf(page);
	    //添加分页
	    sqlBuilder.append("LIMIT "+limit+" OFFSET "+(pag-1)*li);
	    
	    List<InventoryUpdate> list = this.executeQuery(sqlBuilder.toString(), new Mapper<InventoryUpdate>() {

			@Override
			public List<InventoryUpdate> mapper(ResultSet rs) throws SQLException {
				List<InventoryUpdate> list = new ArrayList<InventoryUpdate>();
				while(rs.next()) {
					InventoryUpdate iu = new InventoryUpdate();
					iu.setId(rs.getLong(1));
					iu.setpName(rs.getString(2));
					iu.setAttr_vals(new Gson().fromJson(rs.getString(3), String[].class));
					iu.setUpdateType(rs.getInt(4));
					iu.setOldQuantity(rs.getInt(5));
					iu.setNewQuantity(rs.getInt(6));
					iu.setUpdateTime(rs.getTimestamp(7));
					iu.setReason(rs.getString(8));
					iu.setAdmin_name(rs.getString(9));
					
					
					list.add(iu);
				}
				return list;
			}
		}, params.toArray());
	    
	    
	    map.put("list", list);
	    return map;
	    
	}


	public int doDeleteByID(String id) {
		String sql = "delete from inventory_update where id = ?";
		return this.execute(sql, id);
	}
}
