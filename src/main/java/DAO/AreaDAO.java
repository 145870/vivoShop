package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import entity.Area;
import util.BaseDAO;
import util.Mapper;

public class AreaDAO extends BaseDAO{
	public List<Area> getAreaByProvince(){
		String sql = "select * from `area` where `level` = 1";
		return this.executeQuery(sql, new Mapper<Area>() {

			@Override
			public List<Area> mapper(ResultSet rs) throws SQLException {
				List<Area> list = new ArrayList<Area>();
				while(rs.next()) {
					list.add(new Area(
								rs.getInt(1),
								rs.getInt(2),
								rs.getString(3),
								rs.getString(4),
								rs.getString(5),
								rs.getString(6),
								rs.getInt(7),
								rs.getInt(8),
								rs.getInt(9)
							));
				}
				return list;
			}
			
		});
	}

	public List<Area> getSubAreasByParentName(String province) {
		String sql = "SELECT * FROM `area` WHERE `parent_id` = (SELECT id FROM `area` WHERE `name` = ? )";
		return this.executeQuery(sql, new Mapper<Area>() {

			@Override
			public List<Area> mapper(ResultSet rs) throws SQLException {
				List<Area> list = new ArrayList<Area>();
				while(rs.next()) {
					list.add(new Area(
								rs.getInt(1),
								rs.getInt(2),
								rs.getString(3),
								rs.getString(4),
								rs.getString(5),
								rs.getString(6),
								rs.getInt(7),
								rs.getInt(8),
								rs.getInt(9)
							));
				}
				return list;
			}
			
		},province);
	}
	
	public List<Area> getSubAreasByID(String id) {
		String sql = "SELECT * FROM `area` WHERE `parent_id` = ?";
		return this.executeQuery(sql, new Mapper<Area>() {

			@Override
			public List<Area> mapper(ResultSet rs) throws SQLException {
				List<Area> list = new ArrayList<Area>();
				while(rs.next()) {
					list.add(new Area(
								rs.getInt(1),
								rs.getInt(2),
								rs.getString(3),
								rs.getString(4),
								rs.getString(5),
								rs.getString(6),
								rs.getInt(7),
								rs.getInt(8),
								rs.getInt(9)
							));
				}
				return list;
			}
			
		},id);
	}
	
	public String getNameById(String id) {
		String sql = "select `name` from `area` where id = ?";
		return this.singleObject(sql, id).toString();
	}
}
