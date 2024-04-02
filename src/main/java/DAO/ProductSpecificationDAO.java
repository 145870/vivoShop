package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;
import com.mysql.cj.conf.StringProperty;

import entity.ProductSpecification;
import util.BaseDAO;
import util.Mapper;

public class ProductSpecificationDAO extends BaseDAO{
	public Map<String, Object> getProductSpecificationById(String id){
		String sql="SELECT * FROM products_specifications WHERE information_id = ? ";
		Map<String, Object> map = new HashMap();
		
		List<ProductSpecification> list = this.executeQuery(sql, new Mapper<ProductSpecification>() {

			@Override
			public List<ProductSpecification> mapper(ResultSet rs) throws SQLException {
				List<ProductSpecification> list = new ArrayList<ProductSpecification>();
				while(rs.next()) {
					
					
					list.add(new ProductSpecification(
								rs.getLong(1),
								rs.getInt(2),
								rs.getString(3),
								new Gson().fromJson(rs.getString(4),String[].class)
							));
				}
				return list;
			}
		}, id);
		map.put("list", list);
		map.put("count", list.size());
		
		return map;
	}
	
	public List<ProductSpecification> getProductSpecificationsWithDetailsByProductId(String id){
		String sql="SELECT *\r\n"
				+ "FROM products_specifications ps\r\n"
				+ "JOIN products_specifications_detailed psd ON ps.id = psd.specifications_id\r\n"
				+ "WHERE ps.information_id = ? "
				+ "ORDER BY ps.id DESC";
		return this.executeQuery(sql, new Mapper<ProductSpecification>() {

			@Override
			public List<ProductSpecification> mapper(ResultSet rs) throws SQLException {
				List<ProductSpecification> list = new ArrayList<ProductSpecification>();
				while(rs.next()) {
					ProductSpecification p = new ProductSpecification(
							rs.getLong(1),
							rs.getInt(2),
							rs.getString(3),
							new Gson().fromJson(rs.getString(4),String[].class)						);
					list.add(p);
				}
				return list;
			}
		}, id);
	}
	
	
	public Map<String, Object> getProductSpecificationByIdAndName(String id,String name){
		String sql="SELECT * FROM products_specifications WHERE information_id = ? and specifications_name like ?";
		if (name==null) {
			name = "";
		}
		Map<String, Object> map = new HashMap();
		
		List<ProductSpecification> list = this.executeQuery(sql, new Mapper<ProductSpecification>() {

			@Override
			public List<ProductSpecification> mapper(ResultSet rs) throws SQLException {
				List<ProductSpecification> list = new ArrayList<ProductSpecification>();
				while(rs.next()) {
					
					
					list.add(new ProductSpecification(
								rs.getLong(1),
								rs.getInt(2),
								rs.getString(3),
								new Gson().fromJson(rs.getString(4),String[].class)
							));
				}
				return list;
			}
		}, id,"%"+name+"%");
		map.put("list", list);
		map.put("count", list.size());
		
		return map;
	}
}
