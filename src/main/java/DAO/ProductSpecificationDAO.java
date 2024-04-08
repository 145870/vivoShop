package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.mysql.cj.conf.StringProperty;

import entity.ProductSpecification;
import util.BaseDAO;
import util.Mapper;

public class ProductSpecificationDAO extends BaseDAO {
	public Map<String, Object> getProductSpecificationById(String id) {
		String sql = "SELECT * FROM products_specifications WHERE information_id = ? ";
		Map<String, Object> map = new HashMap();

		List<ProductSpecification> list = this.executeQuery(sql, new Mapper<ProductSpecification>() {

			@Override
			public List<ProductSpecification> mapper(ResultSet rs) throws SQLException {
				List<ProductSpecification> list = new ArrayList<ProductSpecification>();
				while (rs.next()) {

					list.add(new ProductSpecification(rs.getLong(1), rs.getInt(2), rs.getString(3),
							new Gson().fromJson(rs.getString(4), String[].class)));
				}
				return list;
			}
		}, id);
		map.put("list", list);
		map.put("count", list.size());

		return map;
	}

	public List<ProductSpecification> getProductSpecificationsWithDetailsByProductId(String id) {
		String sql = "SELECT *\r\n" + "FROM products_specifications ps\r\n"
				+ "JOIN products_specifications_detailed psd ON ps.id = psd.specifications_id\r\n"
				+ "WHERE ps.information_id = ? " + "ORDER BY ps.id DESC";
		return this.executeQuery(sql, new Mapper<ProductSpecification>() {

			@Override
			public List<ProductSpecification> mapper(ResultSet rs) throws SQLException {
				List<ProductSpecification> list = new ArrayList<ProductSpecification>();
				while (rs.next()) {
					ProductSpecification p = new ProductSpecification(rs.getLong(1), rs.getInt(2), rs.getString(3),
							new Gson().fromJson(rs.getString(4), String[].class));
					list.add(p);
				}
				return list;
			}
		}, id);
	}

	public Map<String, Object> getProductSpecificationByIdAndName(String id, String name, String page, String limit) {
		Integer li = Integer.valueOf(limit);
		Integer pag = Integer.valueOf(page);

		String sql = "SELECT * FROM products_specifications WHERE information_id = ? and specifications_name like ? LIMIT "
				+ limit + " OFFSET " + (pag - 1) * li;
		if (name == null) {
			name = "";
		}
		Map<String, Object> map = new HashMap();

		List<ProductSpecification> list = this.executeQuery(sql, new Mapper<ProductSpecification>() {

			@Override
			public List<ProductSpecification> mapper(ResultSet rs) throws SQLException {
				List<ProductSpecification> list = new ArrayList<ProductSpecification>();
				while (rs.next()) {

					list.add(new ProductSpecification(rs.getLong(1), rs.getInt(2), rs.getString(3),
							new Gson().fromJson(rs.getString(4), String[].class)));
				}
				return list;
			}
		}, id, "%" + name + "%");
		map.put("list", list);
		map.put("count", list.size());

		return map;
	}
	
	public boolean isExistsByNameAndPid(String name,String pid) {
		String sql = "select * from products_specifications where specifications_name = ? and information_id = ?";
		return this.executeQuery(sql, new Mapper<Object>() {

			@Override
			public List<Object> mapper(ResultSet rs) throws SQLException {
				if (rs.next()) {
					return new ArrayList<Object>();
				}
				return null;
			}
		},name,pid) != null;
	}
	
	
	public String doInsert(String pid,String name,String[] vals) {
		String sql = "INSERT INTO products_specifications (information_id, specifications_name, specifications_values) VALUES "
				+ "(?, ?, ?)";
		JsonArray jsonArray = new JsonArray();
		for (String w : vals) {
			jsonArray.add(w);
		}
		
		if (isExistsByNameAndPid(name,pid)) {
			return "该规格已经存在";
		}
		
		return this.execute(sql, pid,name,jsonArray.toString()) > 0 ? "新增成功":"新增失败";
	}
}
