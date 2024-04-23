package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;

import entity.ProductsClass;
import util.AliyunOssUtil;
import util.BaseDAO;
import util.Mapper;


public class ProductsClassDAO extends BaseDAO {
	AliyunOssUtil alyoss=new AliyunOssUtil();
	public List<ProductsClass> getProductsClasses() {
		String sql = "select * from products_class";
		return this.executeQuery(sql, new Mapper<ProductsClass>() {

			@Override
			public List<ProductsClass> mapper(ResultSet rs) throws SQLException {
				List<ProductsClass> list = new ArrayList<ProductsClass>();
				while (rs.next()) {
					list.add(new ProductsClass(rs.getLong("id"), rs.getString("class_name")));
				}
				return list;
			}
		});
	}

	// 查找版本信息
	public List<ProductsClass> quClassesbanben(int id) {
		String sql = "SELECT information_name,description,specifications_values FROM products_class c INNER JOIN products_information i ON c.id=i.class_id\r\n"
				+ "	INNER JOIN products_specifications s ON i.id=s.information_id \r\n"
				+ "	WHERE specifications_name='内存' AND information_id=?";
		return this.executeQuery(sql, new Mapper<ProductsClass>() {
			@Override
			public List<ProductsClass> mapper(ResultSet rs) throws SQLException {
				List<ProductsClass> list = new ArrayList<ProductsClass>();
				while (rs.next()) {
					list.add(new ProductsClass(rs.getString("information_name"), rs.getString("description"),
							new Gson().fromJson(rs.getString("specifications_values"), String[].class)));
				}
				return list; // 返回填充了对象的列表
			}
		}, id);
	}

	// 查找颜色信息
	public List<ProductsClass> quClassescolor(int id) {
		String sql = "SELECT specifications_values FROM products_class c INNER JOIN products_information i ON c.id=i.class_id\r\n"
				+ "	INNER JOIN products_specifications s ON i.id=s.information_id \r\n"
				+ "	WHERE specifications_name='颜色' AND information_id=?";
		return this.executeQuery(sql, new Mapper<ProductsClass>() {
			@Override
			public List<ProductsClass> mapper(ResultSet rs) throws SQLException {
				List<ProductsClass> list = new ArrayList<ProductsClass>();
				while (rs.next()) {
					list.add(new ProductsClass(
							new Gson().fromJson(rs.getString("specifications_values"), String[].class)));

				}
				return list; // 返回填充了对象的列表
			}
		}, id);
	}

		// 查找系列的缩略图
		public List<ProductsClass> queryclassById(Long pcId) {
			String sql = "SELECT * FROM products_class c INNER JOIN products_information i ON c.id=i.class_id\r\n"
					+ "			 INNER JOIN products_images_url u ON i.id=u.information_id WHERE c.id=? AND u.`class_name`=0 and u.url like '%DM_%001.%'";
			return this.executeQuery(sql, new Mapper<ProductsClass>() {
	
				@Override
				public List<ProductsClass> mapper(ResultSet rs) throws SQLException {
					List<ProductsClass> list = new ArrayList<ProductsClass>();
					while (rs.next()) {
						String url = rs.getString(14);
						
						
						list.add(new ProductsClass(rs.getLong(1), rs.getString(2), rs.getInt(3), rs.getString(4),
								rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getDate(9), rs.getDate(10),
								rs.getInt(11), rs.getInt(12), rs.getInt(13),alyoss.getImageUrl(url) , rs.getDate(15)));
					}
					return list;
				}
			},pcId);
		}


}
