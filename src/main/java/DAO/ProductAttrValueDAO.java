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

public class ProductAttrValueDAO extends BaseDAO {
	public Map<String, Object> getAllAndCountByProductId(String id, String page, String limit) {
		Integer li = Integer.valueOf(limit);
		Integer pag = Integer.valueOf(page);

		String sql = "SELECT * FROM product_attr_vals WHERE product_id = ? ORDER BY id DESC LIMIT " + limit + " OFFSET "
				+ (pag - 1) * li;
		Map<String, Object> map = new HashMap<String, Object>();

		List<ProductAttrValue> list = this.executeQuery(sql, new Mapper<ProductAttrValue>() {

			@Override
			public List<ProductAttrValue> mapper(ResultSet rs) throws SQLException {
				List<ProductAttrValue> list = new ArrayList<ProductAttrValue>();
				while (rs.next()) {
					list.add(new ProductAttrValue(rs.getLong(1), rs.getInt(2),
							new Gson().fromJson(rs.getString(3), String[].class), rs.getInt(4)));
				}
				return list;
			}
		}, id);

		map.put("list", list);

		sql = "SELECT * FROM product_attr_vals WHERE product_id = ? ";
		List<Integer> count = this.executeQuery(sql, new Mapper<Integer>() {

			@Override
			public List<Integer> mapper(ResultSet rs) throws SQLException {
				List<Integer> list = new ArrayList<Integer>();
				while (rs.next()) {
					list.add(1);
				}
				return list;
			}
		}, id);

		map.put("count", count.size());
		return map;
	}

	public Map<String, Object> getAllAndCountByProductIdAndWhere(String min, String max, List<String> wheres, String id,
			String page, String limit) {
		// 构建基本的 SQL 查询语句
		StringBuilder sqlBuilder = new StringBuilder("SELECT * FROM product_attr_vals ");
		StringBuilder sqlWhere = new StringBuilder();
		List<Object> params = new ArrayList<>();
		boolean hasCondition = false; // 标记是否有条件

		if (min != null && !min.isEmpty()) {
			if (hasCondition) {
				sqlWhere.append("AND ");
			} else {
				sqlWhere.append("WHERE ");
				hasCondition = true;
			}
			sqlWhere.append("sale_amount >= COALESCE(?, '-∞') ");
			params.add(min);
		}

		if (max != null && !max.isEmpty()) {
			if (hasCondition) {
				sqlWhere.append("AND ");
			} else {
				sqlWhere.append("WHERE ");
				hasCondition = true;
			}
			sqlWhere.append("sale_amount <= COALESCE(?, '+∞') ");
			params.add(max);
		}
		JsonArray jsonArray = new JsonArray();
		if (wheres != null && wheres.size() != 0) {

			if (hasCondition) {
				sqlWhere.append("AND ");
			} else {
				sqlWhere.append("WHERE ");
				hasCondition = true;
			}

			for (String w : wheres) {
				if (w != null && !w.isEmpty()) {
					jsonArray.add(w);

				}
			}

			sqlWhere.append("JSON_CONTAINS(attr_vals, ?) ");
			params.add(jsonArray.toString());
		}

		if (id != null && !id.isEmpty()) {
			if (hasCondition) {
				sqlWhere.append("AND ");
			} else {
				sqlWhere.append("WHERE ");
				hasCondition = true;
			}

			sqlWhere.append("product_id = ? ");
			params.add(id);
		}
		sqlBuilder.append(sqlWhere);
		// 添加排序
		sqlBuilder.append("ORDER BY id DESC ");
	    
		Integer li = Integer.valueOf(limit);
		Integer pag = Integer.valueOf(page);
		
		// 添加分页
		sqlBuilder.append("LIMIT " + limit + " OFFSET " + (pag - 1) * li);

		Map<String, Object> map = new HashMap<String, Object>();

		List<ProductAttrValue> list = this.executeQuery(sqlBuilder.toString(), new Mapper<ProductAttrValue>() {
			@Override
			public List<ProductAttrValue> mapper(ResultSet rs) throws SQLException {
				List<ProductAttrValue> list = new ArrayList<ProductAttrValue>();
				while (rs.next()) {
					list.add(new ProductAttrValue(rs.getLong(1), rs.getInt(2),
							new Gson().fromJson(rs.getString(3), String[].class), rs.getInt(4)));
				}
				return list;
			}
		}, params.toArray());

		sqlBuilder = new StringBuilder("SELECT * FROM product_attr_vals ");
		sqlBuilder.append(sqlWhere);

		List<Integer> listcount = this.executeQuery(sqlBuilder.toString(), new Mapper<Integer>() {

			@Override
			public List<Integer> mapper(ResultSet rs) throws SQLException {
				List<Integer> list = new ArrayList<Integer>();
				while (rs.next()) {
					list.add(rs.getInt(1));
				}
				return list;
			}

		}, params.toArray());

		int count = listcount.size();

		map.put("list", list);
		map.put("count", count);

		return map;
	}

	// 查询是否存在 商品id,json数据, 长度
	public boolean isAttrValsExistsByPid(String pid, String attr_vals, int attr_valsLen) {
		String sql = "SELECT * \r\n" + "FROM product_attr_vals \r\n" + "WHERE JSON_CONTAINS(attr_vals, ?) \r\n"
				+ "  AND JSON_LENGTH(attr_vals) = ? \r\n" + "  AND product_id = ?;";

		return this.executeQuery(sql, new Mapper<Object>() {

			@Override
			public List<Object> mapper(ResultSet rs) throws SQLException {
				if (rs.next()) {
					return new ArrayList<Object>();
				}
				return null;
			}

		}, attr_vals, attr_valsLen, pid) != null;
	}

	public String insertByPid(String id, List<String> attr_vals, String price) {
		String sql = "INSERT INTO product_attr_vals (product_id, attr_vals, sale_amount) VALUES (?, ?, ?)";

		List<Object> params = new ArrayList<>();
		params.add(id);
		JsonArray jsonArray = new JsonArray();
		for (String w : attr_vals) {
			jsonArray.add(w);
		}
		params.add(jsonArray.toString());
		params.add(price);

		if (isAttrValsExistsByPid(id, jsonArray.toString(), attr_vals.size())) {
			return "搭配已存在!";
		}

		return this.execute(sql, params.toArray()) > 0 ? "新增成功" : "新增失败";
	}
}
