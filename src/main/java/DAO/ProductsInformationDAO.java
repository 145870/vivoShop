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

	//修改产品信息
	public int updateById(String id,String name,String description,String type,String status,String isNew) {
		String sql="update products_information set information_name=?,description=?,class_id=?,information_status=?,is_last=? where id=?";
		return this.execute(sql, name,description,type,status,isNew,id);
	}
	
	//删除产品
	public int deleteById(String id) {
		String sql="delete from products_information where id=?";
		return this.execute(sql, id);
	}

	public int setProducts(String name, String type, String date, String isNew, String description) {
		String sql="INSERT INTO products_information (information_name, description, class_id, is_last, shelves_time) \n"
				+ "VALUES \n"
				+ "(?,?,?,?,?)";
		return this.execute(sql, name,description,type,isNew,date);
	}

	public int updateStatuOnTrue(String id) {
		String sql="update products_information set information_status=0 where id=?";
		return this.execute(sql,id);
	}
	
	public List<ProductsInformation> getProductsInformation(){
		String sql = "SELECT * FROM products_information ORDER BY id DESC";
		
		return this.executeQuery(sql, new Mapper<ProductsInformation>() {
			@Override
			public List<ProductsInformation> mapper(ResultSet rs) throws SQLException {
				List<ProductsInformation> list = new ArrayList<ProductsInformation>();
				while (rs.next()) {
					ProductsInformation p = new ProductsInformation(
							rs.getLong("id"),
							rs.getString("information_name"),
							rs.getString("description"), 
							rs.getInt("class_id"),
							rs.getInt("information_status"),
							rs.getInt("is_last"), 
							rs.getTimestamp("create_time"),
							rs.getTimestamp("shelves_time"));
					list.add(p);
				}
				return list;
			}
		});
	}
	
	
	public Map<String, Object> getProductsInformationByWhere(String name,String isNew,String startTime,String endTime,String type,String status,String page,String limit) {
		 // 构建基本的 SQL 查询语句
	    StringBuilder sqlBuilder = new StringBuilder("SELECT * FROM products_information i ");
	    sqlBuilder.append("LEFT JOIN products_class c ON c.id = i.class_id ");
		
	    StringBuilder sqlWhere = new StringBuilder();
	    List<Object> params = new ArrayList<>();
	    boolean hasCondition = false; // 标记是否有条件
	    
	    if (name != null && !name.isEmpty()) {
	    	sqlWhere.append("WHERE i.information_name LIKE ? ");
	        params.add("%" + name + "%");
	        hasCondition = true;
	    }
	    if (isNew != null && !isNew.isEmpty()) {
	        if (hasCondition) {
	        	sqlWhere.append("AND ");
	        } else {
	        	sqlWhere.append("WHERE ");
	            hasCondition = true;
	        }
	        sqlWhere.append("i.is_last = ? ");
	        params.add(isNew);
	    }
	    
	    if (startTime != null && !startTime.isEmpty()) {
	        if (hasCondition) {
	        	sqlWhere.append("AND ");
	        } else {
	        	sqlWhere.append("WHERE ");
	            hasCondition = true;
	        }
	        sqlWhere.append("i.create_time >= ? ");
	        params.add(startTime);
	    }
	    
	    if (endTime != null && !endTime.isEmpty()) {
	        if (hasCondition) {
	        	sqlWhere.append("AND ");
	        } else {
	        	sqlWhere.append("WHERE ");
	            hasCondition = true;
	        }
	        sqlWhere.append("i.create_time <= ? ");
	        params.add(endTime);
	    }
	    
	    if (status != null && !status.isEmpty()) {
	        if (hasCondition) {
	        	sqlWhere.append("AND ");
	        } else {
	        	sqlWhere.append("WHERE ");
	            hasCondition = true;
	        }
	        sqlWhere.append("i.information_status = ? ");
	        params.add(status);
	    }
	    
	    if (type != null && !type.isEmpty()) {
	        if (hasCondition) {
	        	sqlWhere.append("AND ");
	        } else {
	        	sqlWhere.append("WHERE ");
	            hasCondition = true;
	        }
	        sqlWhere.append("i.class_id = ? ");
	        params.add(type);
	    }
	    
	    // 添加排序
	    sqlWhere.append("ORDER BY i.id DESC ");
	    
	    
	    Integer li = Integer.valueOf(limit);
	    Integer pag = Integer.valueOf(page);
	    sqlBuilder.append(sqlWhere);
	    //添加分页
	    sqlBuilder.append("LIMIT "+limit+" OFFSET "+(pag-1)*li);
	   
	    	List<ProductsInformation> list = this.executeQuery(sqlBuilder.toString(), new Mapper<ProductsInformation>() {
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

		},params.toArray());
	    	sqlBuilder = new StringBuilder("SELECT * FROM products_information i ");
	    	sqlBuilder.append(sqlWhere);
		    
		    List<Integer> listcount = this.executeQuery(sqlBuilder.toString(), new Mapper<Integer>() {

				@Override
				public List<Integer> mapper(ResultSet rs) throws SQLException {
					List<Integer> list = new ArrayList<Integer>();
					while(rs.next()) {
						list.add(rs.getInt(1));
					}
					return list;
				}
		    	
		    },params.toArray());
	    	
	    	
	    int count = listcount.size();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("count",count);
		
		return map;
	}
	
	

}
