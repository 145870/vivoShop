package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;

import entity.Product_attr_vals;
import util.AliyunOssUtil;
import util.BaseDAO;
import util.Mapper;

public class Product_attr_valsDAO extends BaseDAO {
	// 查找规格价格
	public List<Product_attr_vals> getProductsvals(int id, int attr_valsLen, String json) {
		String sql = "SELECT v.id,attr_vals,sale_amount FROM product_attr_vals v INNER JOIN  products_information i ON v.`product_id`=i.`id` WHERE JSON_CONTAINS(v.attr_vals, ?) \r\n"
				+ "				 AND JSON_LENGTH(v.attr_vals) = ? AND v.`product_id`= ?";
		return this.executeQuery(sql, new Mapper<Product_attr_vals>() {
			@Override
			public List<Product_attr_vals> mapper(ResultSet rs) throws SQLException {
				List<Product_attr_vals> list = new ArrayList<Product_attr_vals>();
				while (rs.next()) {
					list.add(new Product_attr_vals(rs.getInt(1),new Gson().fromJson(rs.getString("attr_vals"), String[].class),
							rs.getDouble("sale_amount")));
				}
				return list;
			}
		}, json, attr_valsLen, id);
	}

	// 查找最低价格
	public List<Product_attr_vals> getProductsvalslow(int id) {
		String sql = "SELECT sale_amount FROM product_attr_vals v INNER JOIN  products_information i ON v.`product_id`=i.`id` WHERE  v.`product_id`= ?  ORDER BY sale_amount ASC LIMIT 1\r\n";
		return this.executeQuery(sql, new Mapper<Product_attr_vals>() {
			@Override
			public List<Product_attr_vals> mapper(ResultSet rs) throws SQLException {
				List<Product_attr_vals> list = new ArrayList<Product_attr_vals>();
				while (rs.next()) {
					list.add(new Product_attr_vals(rs.getDouble("sale_amount")));
				}
				return list;
			}
		}, id);
	}

	// 查找最低价格的规格
	public List<Product_attr_vals> getProductsvalslowgui(int id) {
		String sql = "SELECT attr_vals FROM product_attr_vals v INNER JOIN  products_information i ON v.`product_id`=i.`id` WHERE  v.`product_id`= ?  ORDER BY sale_amount ASC LIMIT 1\r\n";
		return this.executeQuery(sql, new Mapper<Product_attr_vals>() {
			@Override
			public List<Product_attr_vals> mapper(ResultSet rs) throws SQLException {
				List<Product_attr_vals> list = new ArrayList<Product_attr_vals>();
				while (rs.next()) {
					list.add(new Product_attr_vals(new Gson().fromJson(rs.getString("attr_vals"), String[].class)));
				}
				return list;
			}
		}, id);
	}
	
	public Product_attr_vals getAttr_valsAndUrlById(String id){
		String sql="SELECT p.`information_name`,pav.`attr_vals`,pav.`sale_amount`,piu.`url` FROM product_attr_vals pav \r\n"
				+ "JOIN products_information p\r\n"
				+ "ON pav.`product_id`=p.`id` \r\n"
				+ "JOIN products_images_url piu \r\n"
				+ "ON p.`id`=piu.information_id \r\n"
				+ "WHERE piu.`url` LIKE '%DM_%_001.%'\r\n"
				+ "AND pav.`id`=?\r\n";
		
		return this.executeQuery(sql, new Mapper<Product_attr_vals>() {
			@Override
			public List<Product_attr_vals> mapper(ResultSet rs) throws SQLException {
				List<Product_attr_vals> list = new ArrayList<Product_attr_vals>();
				while (rs.next()) {
					Product_attr_vals pav=new Product_attr_vals();
					pav.setInformation_name(rs.getString(1));
					pav.setAttr_vals(new Gson().fromJson(rs.getString(2), String[].class));
					pav.setSale_amount(rs.getDouble(3));
					pav.setImageUrl(new AliyunOssUtil().getImageUrl(rs.getString(4)));
					list.add(pav);
				}
				return list;
			}
		}, id).get(0);
	}
}
