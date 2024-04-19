package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.Admin;
import util.BaseDAO;
import util.Mapper;

public class AdminDAO extends BaseDAO{
	public Admin login(String account,String password) {
		String sql = "SELECT * FROM admin WHERE account = ? AND admin_password = ? ";
		List<Admin> list = this.executeQuery(sql, new Mapper<Admin>() {

			@Override
			public List<Admin> mapper(ResultSet rs) throws SQLException {
				List<Admin> list = new ArrayList<Admin>();
				if (rs.next()) {
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
		}, account,password);
		
		if (list.size()>0) {
			return list.get(0);
		}else {
			return null;
		}
		
	}
}
