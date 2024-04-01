package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;

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
		
		sql="select count(*) from product_attr_vals WHERE product_id = ?";
		int count = this.executeQuery(sql, new Mapper<Integer>() {

			@Override
			public List<Integer> mapper(ResultSet rs) throws SQLException {
				List<Integer> list = new ArrayList<Integer>();
				rs.next();
				list.add(rs.getInt(1));
				return list;
			}
			
		},id).get(0);
		map.put("count",count);
		return map;
	}
}
