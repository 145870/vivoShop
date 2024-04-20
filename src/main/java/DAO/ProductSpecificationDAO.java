package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;

import entity.ProductSpecification;
import util.BaseDAO;
import util.Mapper;

public class ProductSpecificationDAO extends BaseDAO {
	public Map<String, Object> getProductSpecificationById(int id) {
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
}
