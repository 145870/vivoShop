package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.Products_information;
import util.BaseDAO;
import util.Mapper;

public class Products_informationDAO extends BaseDAO{
	public List<Products_information> queryInfor(){
		String sql = "SELECT * FROM products_information INNER JOIN products_images_url ON products_information.`id`=products_images_url.`information_id` WHERE products_images_url.`class_name`=1";
		return this.executeQuery(sql, new Mapper<Products_information>() {

			@Override
			public List<Products_information> mapper(ResultSet rs) throws SQLException {
				List<Products_information> list = new ArrayList<Products_information>();
				while(rs.next()) {
					list.add(new Products_information(
							rs.getInt("id"),
							rs.getString("information_name"),
							rs.getString("description"),
							rs.getInt("class_id"),
							rs.getInt("information_status"),
							rs.getInt("is_last"),
							rs.getDate("create_time"),
							rs.getDate("shelves_time"),
							rs.getInt("information_id"),
							rs.getInt("class_name"),
							rs.getString("url")
							));
					System.out.println(rs.getString(11));
				}
				return list;
			}
		});
	}
		
}
