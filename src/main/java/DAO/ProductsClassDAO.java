package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import entity.ProductsClass;
import util.BaseDAO;
import util.Mapper;

public class ProductsClassDAO extends BaseDAO{
	public List<ProductsClass> getProductsClasses(){
		String sql = "select * from products_class";
		return this.executeQuery(sql, new Mapper<ProductsClass>() {

			@Override
			public List<ProductsClass> mapper(ResultSet rs) throws SQLException {
				List<ProductsClass> list = new ArrayList<ProductsClass>();
				while(rs.next()) {
					list.add(new ProductsClass(
								rs.getLong(1),
								rs.getString(2)
							));
					
				}
				return list;
			}
		});
	}
	
	public Map<String,Object> getProductsClassesByName(String name,String page,String limit){
		String sql = "select * from products_class where class_name like ? ORDER BY id DESC ";
		Map<String,Object> map = new HashMap<String, Object>();
		
		List<Object> list = this.executeQuery(sql, new Mapper<Object>() {

			@Override
			public List<Object> mapper(ResultSet rs) throws SQLException {
				List<Object> list = new ArrayList<Object>();
				while(rs.next()) {
					list.add("1");
				}
				return list;
			}
		},"%"+name+"%");
		map.put("count", list.size());
		
		 // 添加分页限制
        Integer li = Integer.valueOf(limit);
	    Integer pag = Integer.valueOf(page);
	    sql +=" LIMIT "+limit+" OFFSET "+(pag-1)*li;  
	    
	    List<ProductsClass> pclist = this.executeQuery(sql, new Mapper<ProductsClass>() {

			@Override
			public List<ProductsClass> mapper(ResultSet rs) throws SQLException {
				List<ProductsClass> list = new ArrayList<ProductsClass>();
				while(rs.next()) {
					list.add(new ProductsClass(
								rs.getLong(1),
								rs.getString(2)
							));
					
				}
				return list;
			}
		},"%"+name+"%");
	    map.put("list", pclist);
	    
	    return map;
	}

	public boolean isClassNameExists(String name) {
		String sql = "select * from products_class where class_name = ?";
		return this.executeQuery(sql, new Mapper<Object>() {

			@Override
			public List<Object> mapper(ResultSet rs) throws SQLException {
				if (rs.next()) {
					return new ArrayList<Object>();
				}
				return null;
			}

		}, name) != null;
	}
	public boolean isClassNameExistsNotById(String id,String name) {
		String sql = "select * from products_class where class_name = ? and id <> ?";
		return this.executeQuery(sql, new Mapper<Object>() {

			@Override
			public List<Object> mapper(ResultSet rs) throws SQLException {
				if (rs.next()) {
					return new ArrayList<Object>();
				}
				return null;
			}

		}, name,id) != null;
	}
	public String doInsert(String val) {
		String sql = "INSERT INTO products_class(class_name) VALUES (?)";
		if (isClassNameExists(val)) {
			return "类别已存在!";
		}
		return this.execute(sql, val) > 0 ? "新增成功" : "新增失败";
	}

	public String updateById(String id, String val) {
		String sql = "update products_class set class_name=? where id=?";
		if (isClassNameExistsNotById(id,val)) {
			return "类别已存在!";
		}
		return this.execute(sql, val,id) > 0 ? "修改成功" : "修改失败";
	}

	public String deleteById(String id) {
		String sql = "delete from products_class where id=?";
		return this.execute(sql,id) > 0 ? "true" : "false";
	}
}
