package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;

import entity.Admin;
import entity.InventoryUpdate;
import util.BaseDAO;
import util.Mapper;

public class AdminDAO extends BaseDAO{
	public Admin login(String account,String password) {
		String sql = "SELECT a.*,at.type_name FROM admin a "
				+ "join admin_type at on at.id=a.admin_type_id "
				+ "WHERE a.account = ? AND a.admin_password = ? ";
		List<Admin> list = this.executeQuery(sql, new Mapper<Admin>() {

			@Override
			public List<Admin> mapper(ResultSet rs) throws SQLException {
				List<Admin> list = new ArrayList<Admin>();
				if (rs.next()) {
					Admin admin = new Admin(
							rs.getLong(1),
							rs.getString(2),
							rs.getString(3),
							rs.getString(4),
							rs.getString(5),
							rs.getInt(6),
							rs.getString(7),
							rs.getLong(8),
							rs.getDate(9)
						);
					admin.setTypeName(rs.getString("at.type_name"));
					list.add(admin);
				}
				return list;
			}
		}, account,password);
		
		if (list.size()>0) {
			return list.get(0);
		}else {
			return null;
		}
		
	}
	
	public List<Admin> getAdmin() {
		String sql = "SELECT * FROM admin ";
		return this.executeQuery(sql, new Mapper<Admin>() {

			@Override
			public List<Admin> mapper(ResultSet rs) throws SQLException {
				List<Admin> list = new ArrayList<Admin>();
				while(rs.next()) {
					list.add(new Admin(
								rs.getLong(1),
								rs.getString(2),
								rs.getString(3),
								rs.getString(4),
								rs.getString(5),
								rs.getInt(6),
								rs.getString(7),
								rs.getLong(8),
								rs.getDate(9)
							));
				}
				return list;
			}
		});
	}

	public Map<String, Object> getAdminByWheres(String account, String name, String phone, String type, String sex,
			String startTime, String endTime, String page, String limit) {
		StringBuilder sqlBuilder = new StringBuilder("select * from admin where nickname like ? ");
	    Map<String, Object> map = new HashMap<String, Object>();
	    List<Object> params = new ArrayList<>();
	    params.add("%"+name+"%");
	    
	    if (account != null && !account.isEmpty()) {
	    	sqlBuilder.append("AND account like ? ");
	    	params.add("%"+account+"%");
		}
	    
	    if (phone != null && !phone.isEmpty()) {
	    	sqlBuilder.append("AND phone like ? ");
	    	params.add("%"+phone+"%");
		}
	    
	    if (sex != null && !sex.isEmpty()) {
	    	sqlBuilder.append("AND sex = ? ");
	    	params.add(sex);
		}
	    
	    if (startTime != null && !startTime.isEmpty()) {
	    	sqlBuilder.append("AND create_time >= ? ");
	    	params.add(startTime);
		}
	    
	    if (endTime != null && !endTime.isEmpty()) {
	    	sqlBuilder.append("AND create_time <= ? ");
	    	params.add(endTime);
		}
	    int count = this.executeQuery(sqlBuilder.toString(), new Mapper<Object>() {

			@Override
			public List<Object> mapper(ResultSet rs) throws SQLException {
				List<Object> list = new ArrayList<Object>();
				while(rs.next()) {
					list.add("1");
				}
				return list;
			}
		}, params.toArray()).size();
	    map.put("count", count);
	    
	    sqlBuilder.append("ORDER BY id DESC ");
	    Integer li = Integer.valueOf(limit);
	    Integer pag = Integer.valueOf(page);
	    //添加分页
	    sqlBuilder.append("LIMIT "+limit+" OFFSET "+(pag-1)*li);
	    
	    List<Admin> list = this.executeQuery(sqlBuilder.toString(), new Mapper<Admin>() {

			@Override
			public List<Admin> mapper(ResultSet rs) throws SQLException {
				List<Admin> list = new ArrayList<Admin>();
				while(rs.next()) {
					Admin iu = new Admin(
							rs.getLong(1),
							rs.getString(2),
							rs.getString(3),
							rs.getString(4),
							rs.getString(5),
							rs.getInt(6),
							rs.getString(7),
							rs.getLong(8),
							rs.getDate(9)
							);

					list.add(iu);
				}
				return list;
			}
		}, params.toArray());
		
	    map.put("list", list);
	    return map;
	}
	public boolean isAccountExists(String account) {
		String sql = "SELECT COUNT(*) AS COUNT FROM admin WHERE account = ? ";
		return Integer.valueOf(this.execute(sql, account))>0;
	}
	
	public boolean isAccountExists(String id,String account) {
		String sql = "SELECT COUNT(*) AS COUNT FROM admin WHERE account = ? and id <> ?";
		return Integer.valueOf(this.execute(sql, account,id))>0;
	}

	public String doInsert(String account, String pwd, String nickname, String phone, String name, String type,
			String sex) {
		String sql = "insert into "
				+ "admin(account, nickname, admin_name, phone, sex, admin_password, admin_type_id) "
				+ "VALUES (?,?,?,?,?,?,?)";
		if (isAccountExists(account)) {
			return "账号已存在";
		}
		return this.execute(sql,account,nickname,name,phone,sex,pwd,type)>0?"true":"false";
	}

	public String doUpdateById(String id, String account, String pwd, String nickname, String phone, String admin_name,
			String type, String sex) {
		String sql = "UPDATE admin SET account = ?, nickname = ?, admin_name = ?, phone = ?, admin_password = ?, admin_type_id = ?, sex = ? WHERE id = ?";
		if (isAccountExists(id,account)) {
			return "账号已存在";
		}
		
		return this.execute(sql,account,nickname,admin_name,phone,pwd,type,sex,id)>0?"true":"false";
	}

	public int doDeleteById(String id) {
		String sql = "delete from admin where id = ?";
		return this.execute(sql, id);
	}

	public String doUpdateById(String userID, String account, String nickname, String phone, String sex) {
		String sql = "UPDATE admin SET account = ?, nickname = ?, phone = ?, sex = ? WHERE id = ?";
		if (isAccountExists(userID,account)) {
			return "账号已存在";
		}
		return this.execute(sql,account,nickname,phone,sex,userID)>0?"true":"false";
	}

	public Admin getAdminById(String userId) {
		String sql = "SELECT a.*,at.type_name FROM admin a "
				+ "join admin_type at on at.id=a.admin_type_id "
				+ "WHERE a.id = ? ";
		return this.executeQuery(sql, new Mapper<Admin>() {

			@Override
			public List<Admin> mapper(ResultSet rs) throws SQLException {
				List<Admin> list = new ArrayList<Admin>();
				while(rs.next()) {
					Admin admin = new Admin(
							rs.getLong(1),
							rs.getString(2),
							rs.getString(3),
							rs.getString(4),
							rs.getString(5),
							rs.getInt(6),
							rs.getString(7),
							rs.getLong(8),
							rs.getDate(9)
						);
					admin.setTypeName(rs.getString("at.type_name"));
					list.add(admin);
				}
				return list;
			}
			
		}, userId).get(0);
	}

	public String updatePasswordByOldPwdAndId(String userID, String oldPwd, String newPwd) {
		String sql = "UPDATE admin SET admin_password = ? WHERE id = ? AND admin_password = ?";
		return this.execute(sql, newPwd,userID,oldPwd)>0?"true":"false";
	}
}
