package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;
import com.google.gson.JsonArray;

import entity.ProductAttrValue;
import util.BaseDAO;
import util.Mapper;

public class ProductAttrValueDAO extends BaseDAO{
	public Map<String, Object> getAllAndCountByProductId(String id){
		String sql = "SELECT * FROM product_attr_vals WHERE product_id = ?";
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<ProductAttrValue> list = this.executeQuery(sql, new Mapper<ProductAttrValue>() {

			@Override
			public List<ProductAttrValue> mapper(ResultSet rs) throws SQLException {
				List<ProductAttrValue> list = new ArrayList<ProductAttrValue>();
				while(rs.next()) {
					list.add(new ProductAttrValue(
								rs.getLong(1),
								rs.getInt(2),
								new Gson().fromJson(rs.getString(3),String[].class),
								rs.getInt(4)
							));
				}
				return list;
			}
		}, id);
		
		map.put("list", list);
		
		map.put("count",list.size());
		return map;
	}
	
	
	
	public Map<String, Object> getAllAndCountByProductIdAndWhere(String min,String max,List<String> wheres,String id){
		 // 构建基本的 SQL 查询语句
	    StringBuilder sqlBuilder = new StringBuilder("SELECT * FROM product_attr_vals ");
	    
	    List<Object> params = new ArrayList<>();
	    boolean hasCondition = false; // 标记是否有条件
	    
	    if (min != null && !min.isEmpty()) {
	    	 if (hasCondition) {
		            sqlBuilder.append("AND ");
		        } else {
		            sqlBuilder.append("WHERE ");
		            hasCondition = true;
		        }
		        sqlBuilder.append("sale_amount >= COALESCE(?, '-∞') ");
		        params.add(min);
	    }
	    
	    if (max != null && !max.isEmpty()) {
	    	 if (hasCondition) {
		            sqlBuilder.append("AND ");
		        } else {
		            sqlBuilder.append("WHERE ");
		            hasCondition = true;
		        }
		        sqlBuilder.append("sale_amount <= COALESCE(?, '+∞') ");
		        params.add(max);
	    }
        JsonArray jsonArray = new JsonArray();
        if (wheres != null && wheres.size()!=0) {
        	
        	 if (hasCondition) {
		            sqlBuilder.append("AND ");
		     } else {
		         sqlBuilder.append("WHERE ");
		         hasCondition = true;
		     }
        	 
        	 for(String w:wheres) {
    	    	 if (w!= null && !w.isEmpty()) {
    	    		 jsonArray.add(w);
    	    		 
    	    	 }
    	     }
        	 
		     sqlBuilder.append("JSON_CONTAINS(attr_vals, ?) ");
		     params.add(jsonArray.toString());
	    }
	   
        if (id != null && !id.isEmpty()) {	
       	 	if (hasCondition) {
		            sqlBuilder.append("AND ");
		     } else {
		         sqlBuilder.append("WHERE ");
		         hasCondition = true;
		     }
       	 	 
       	 	sqlBuilder.append("product_id = ? ");
       	 	params.add(id);
	    }
	    
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		List<ProductAttrValue> list = this.executeQuery(sqlBuilder.toString(), new Mapper<ProductAttrValue>() {
			@Override
			public List<ProductAttrValue> mapper(ResultSet rs) throws SQLException {
				List<ProductAttrValue> list = new ArrayList<ProductAttrValue>();
				while(rs.next()) {
					list.add(new ProductAttrValue(
								rs.getLong(1),
								rs.getInt(2),
								new Gson().fromJson(rs.getString(3),String[].class),
								rs.getInt(4)
							));
				}
				return list;
			}
		}, params.toArray());
		map.put("list", list);		
		map.put("count",list.size());
		
		return map;
	}
}
