package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import entity.ProductImageUrl;
import entity.ProductsInformation;
import util.BaseDAO;
import util.Mapper;

public class ProductImageUrlDAO extends BaseDAO{
	public Map<String, Object> getAllByWhere(String pid,String type,String startTime,String endTime,String page,String limit){
		 // 构建 SQL 查询语句的基础部分
        StringBuilder sql = new StringBuilder("SELECT * FROM products_images_url");
        // 构建 WHERE 子句
        StringBuilder whereClause = new StringBuilder(" WHERE 1 = 1");
        // 存储查询参数
        List<String>  params = new ArrayList<String>();
        
        // 添加 pid 参数条件
        if (pid != null && !pid.isEmpty()) {
            whereClause.append(" AND information_id = ?");
            params.add(pid);
        }
        
        // 添加 type 参数条件
        if (type != null && !type.isEmpty()) {
            whereClause.append(" AND class_name = ?");
            params.add(type);
        }
        
        // 添加 startTime 参数条件
        if (startTime != null && !startTime.isEmpty()) {
            whereClause.append(" AND create_time >= ?");
            params.add(startTime);
        }
        
        // 添加 endTime 参数条件
        if (endTime != null && !endTime.isEmpty()) {
            whereClause.append(" AND create_time <= ?");
            params.add(endTime);
        }
        
        whereClause.append(" ORDER BY id DESC");
        // 拼接完整的 SQL 查询语句
        sql.append(whereClause);
        
        //查询总数
        List<Integer> listcount = this.executeQuery(sql.toString(), new Mapper<Integer>() {

			@Override
			public List<Integer> mapper(ResultSet rs) throws SQLException {
				List<Integer> list = new ArrayList<Integer>();
				while(rs.next()) {
					list.add(rs.getInt(1));
				}
				return list;
			}
	    	
	    },params.toArray());
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("count", listcount.size());

        // 添加分页限制
        Integer li = Integer.valueOf(limit);
	    Integer pag = Integer.valueOf(page);
        sql.append(" LIMIT "+limit+" OFFSET "+(pag-1)*li);    
        
        List<ProductImageUrl> list = this.executeQuery(sql.toString(), new Mapper<ProductImageUrl>() {
			@Override
			public List<ProductImageUrl> mapper(ResultSet rs) throws SQLException {
				List<ProductImageUrl> list = new ArrayList<ProductImageUrl>();
				while (rs.next()) {
					ProductImageUrl p = new ProductImageUrl(
							rs.getLong(1),
							rs.getInt(2),
							rs.getInt(3), 
							rs.getString(4),
							rs.getTimestamp(5)
							);
					list.add(p);
				}
				return list;
			}
		},params.toArray());
        
        map.put("list", list);
        
        return map;
   }
	//判断指定url是否存在
	public boolean isUrlExists(String url) {
		String sql = "select * from products_images_url where url=?";
		return this.executeQuery(sql, new Mapper<Object>() {

			@Override
			public List<Object> mapper(ResultSet rs) throws SQLException {
				if (rs.next()) {
					return new ArrayList<Object>();
				}
				return null;
			}

		},url) != null;
	}
	//根据商品id增加数据
	public String doInsertByPid(String pid,String type,String url) {
		String sql = "INSERT INTO products_images_url (information_id, class_name, url) VALUES(?,?,?) ";
		if (isUrlExists(url)) {
			return "路径已经存在";
		}
		
		return this.execute(sql,pid,type,url) > 0 ? "新增成功" : "新增失败";
	}
	
	//判断指定url是否存在
		public boolean isUrlExistsByPid(String id,String url) {
			String sql = "select * from products_images_url where url=? and id <> ? ";
			return this.executeQuery(sql, new Mapper<Object>() {

				@Override
				public List<Object> mapper(ResultSet rs) throws SQLException {
					if (rs.next()) {
						return new ArrayList<Object>();
					}
					return null;
				}

			},url,id) != null;
		}
	
	public String updateById(String id,String type,String url) {
		String sql = "update products_images_url set class_name = ?, url = ? where id = ? ";
		if (isUrlExistsByPid(id,url)) {
			return "路径已经存在";
		}
		
		return this.execute(sql,type,url,id) > 0 ? "修改成功" : "修改失败";
	}
	
	public int deleteById(String id) {
		String sql = "delete from products_images_url where id = ? ";
		return this.execute(sql, id);
	}
}
