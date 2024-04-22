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

	public Map<String, Object> getProductSpecificationByNames(String pname,String psname, String page, String limit) {
		Integer li = Integer.valueOf(limit);
		Integer pag = Integer.valueOf(page);

		String sql = "SELECT p.id,p.information_name,ps.* FROM products_specifications ps JOIN products_information p "
				+ "ON p.id=ps.information_id "
				+ "WHERE p.information_name LIKE ? "
				+ "AND ps.specifications_name LIKE ? ";
				
		if (pname == null) {
			pname = "";
		}
		if (psname == null) {
			psname = "";
		}
		Map<String, Object> map = new HashMap();

		List<Object> sizeList = this.executeQuery(sql, new Mapper<Object>() {

			@Override
			public List<Object> mapper(ResultSet rs) throws SQLException {
				List<Object> list = new ArrayList<Object>();
				while (rs.next()) {
					list.add("1");
				}
				return list;
			}
		},"%" + pname + "%","%" + psname + "%");
		
		sql += "ORDER BY ps.information_id DESC,ps.id DESC ";
		sql += "LIMIT "+ limit + " OFFSET " + (pag - 1) * li;
		List<ProductSpecification> list = this.executeQuery(sql, new Mapper<ProductSpecification>() {

			@Override
			public List<ProductSpecification> mapper(ResultSet rs) throws SQLException {
				List<ProductSpecification> list = new ArrayList<ProductSpecification>();
				while (rs.next()) {
					ProductSpecification ps = new ProductSpecification(
							rs.getLong(3),
							rs.getInt(4),
							rs.getString(5),
							new Gson().fromJson(rs.getString(6), String[].class));
					ps.setPid(rs.getLong(1));
					ps.setPname(rs.getString(2));
					
					list.add(ps);
				}
				return list;
			}
		},"%" + pname + "%","%" + psname + "%");
		map.put("list", list);
		map.put("count", sizeList.size());

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
	
	public boolean isExistsByNameAndPidAndNotPSId(String name,String pid,String psid) {
		String sql = "select * from products_specifications where specifications_name = ? and id <> ? and information_id = ?";
		return this.executeQuery(sql, new Mapper<Object>() {

			@Override
			public List<Object> mapper(ResultSet rs) throws SQLException {
				if (rs.next()) {
					return new ArrayList<Object>();
				}
				return null;
			}
		},name,psid,pid) != null;
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
	
	public String doUpdateById(String pid,String psid,String name,String[] vals) {
		String sql = "update products_specifications set specifications_name = ?,specifications_values=? where id = ? ";
		JsonArray jsonArray = new JsonArray();
		for (String w : vals) {
			jsonArray.add(w);
		}
		if (isExistsByNameAndPidAndNotPSId(name,pid,psid)) {
			return "该规格已经存在";
		}
		
		return this.execute(sql, name,jsonArray.toString(),psid) > 0 ? "修改成功":"修改失败";
	}
	
	public int doDeleteById(String id) {
		String sql = "delete from products_specifications where id = ?";
		return this.execute(sql, id);
	}
	
	public Long getInsertedId(){
		String sql = "SELECT MAX(id) FROM products_specifications";
		return this.executeQuery(sql, new Mapper<Long>() {

			@Override
			public List<Long> mapper(ResultSet rs) throws SQLException {
				List<Long> list = new ArrayList<Long>();
				if (rs.next()) {
					list.add(rs.getLong(1));
				}else {
					list.add((long) -1);
				}
				return list;
			}
			
		}).get(0);
	}
}
