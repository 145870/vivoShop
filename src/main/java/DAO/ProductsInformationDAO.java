package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import entity.ProductsInformation;
import util.BaseDAO;
import util.Mapper;

public class ProductsInformationDAO extends BaseDAO {
	public Map<String, Object> getProductsInformation() {
		String sql = "SELECT * FROM products_information i " + "LEFT JOIN products_class c ON c.id = i.class_id";
		List<ProductsInformation> list = this.executeQuery(sql, new Mapper<ProductsInformation>() {
			@Override
			public List<ProductsInformation> mapper(ResultSet rs) throws SQLException {
				List<ProductsInformation> list = new ArrayList<ProductsInformation>();
				while (rs.next()) {
					ProductsInformation p = new ProductsInformation(
							rs.getLong("i.id"),
							rs.getString("i.information_name"),
							rs.getString("i.description"), 
							rs.getInt("i.class_id"),
							rs.getInt("i.information_status"),
							rs.getInt("i.is_last"), 
							rs.getTimestamp("i.create_time"),
							rs.getTimestamp("i.shelves_time"));
					p.setClassName(rs.getString("c.class_name"));
					list.add(p);
				}
				return list;
			}

		});
		sql="select count(*) from products_information";
		int count = this.executeQuery(sql, new Mapper<Integer>() {

			@Override
			public List<Integer> mapper(ResultSet rs) throws SQLException {
				List<Integer> list = new ArrayList<Integer>();
				rs.next();
				list.add(rs.getInt(1));
				return list;
			}
			
		}).get(0);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("count",count);
		
		return map;
	}
	
	public static void main(String[] args) {
		ProductsInformationDAO dao = new ProductsInformationDAO();
		
		Map<String, Object> map = dao.getProductsInformation();
		System.out.println(map.get("list"));
	}
	//修改产品信息
	public int updateById(String id,String name,String description,String type,String status,String isNew) {
		String sql="update products_information set information_name=?,description=?,class_id=?,information_status=?,is_last=? where id=?";
		return this.execute(sql, name,description,type,status,isNew,id);
	}
}
