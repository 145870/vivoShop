package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;import org.apache.http.conn.BasicEofSensorWatcher;

import entity.AdminType;
import util.BaseDAO;
import util.Mapper;

public class AdminTypeDAO extends BaseDAO{
	public List<AdminType> getAdminDAOs(){
		String sql = "select * from admin_type ";
		return this.executeQuery(sql, new Mapper<AdminType>() {

			@Override
			public List<AdminType> mapper(ResultSet rs) throws SQLException {
				List<AdminType> list = new ArrayList<AdminType>();
				while(rs.next()) {
					list.add(new AdminType(rs.getLong(1), rs.getString(2)));
					
				}
				return list;
			}
		});
	}
	
	public String getTypeNameById(Long id) {
		String sql = "select type_name from admin_type where id=?";
		return this.singleObject(sql, id).toString();
	}
}
