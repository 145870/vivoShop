package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.Products_images_url;
import util.AliyunOssUtil;
import util.BaseDAO;
import util.Mapper;

public class Products_images_urlDAO extends BaseDAO{
	AliyunOssUtil alyoss=new AliyunOssUtil();
	// 查询图片
		public List<Products_images_url> queryInforLun() {
			String sql = "SELECT * FROM products_images_url WHERE class_name=3 ORDER BY id  DESC LIMIT 5";
			return this.executeQuery(sql, new Mapper<Products_images_url>() {

				@Override
				public List<Products_images_url> mapper(ResultSet rs) throws SQLException {
					List<Products_images_url> list = new ArrayList<Products_images_url>();
					while (rs.next()) {
						String url=rs.getString("url");
						list.add(new Products_images_url(rs.getInt("id"), rs.getInt("information_id"), rs.getInt("class_name"), alyoss.getImageUrl(url), rs.getDate("create_time")));
					}
					return list;
				}
			});
		}
}
