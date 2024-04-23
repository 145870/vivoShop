package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import entity.Products_information;
import util.AliyunOssUtil;
import util.BaseDAO;
import util.Mapper;

public class Products_informationDAO extends BaseDAO {
	AliyunOssUtil alyoss=new AliyunOssUtil();
	//根据分类id分类
	public List<Products_information> queryInforClassId(int id) {
		String sql = "SELECT \r\n"
				+ "    u.url, \r\n"
				+ "    i.description, \r\n"
				+ "    i.information_name,i.id\r\n"
				+ "FROM \r\n"
				+ "    products_images_url u \r\n"
				+ "INNER JOIN \r\n"
				+ "    products_information i ON i.id = u.information_id \r\n"
				+ "INNER JOIN \r\n"
				+ "    product_attr_vals v ON i.id = v.product_id \r\n"
				+ "WHERE \r\n"
				+ "    u.class_name = 0 \r\n"
				+ "    AND u.url LIKE '%DM_%001.%'\r\n"
				+ "    AND i.class_id=?\r\n"
				+ "GROUP BY \r\n"
				+ "    u.url, \r\n"
				+ "    i.description, \r\n"
				+ "    i.information_name,i.id;";
		return this.executeQuery(sql, new Mapper<Products_information>() {

			@Override
			public List<Products_information> mapper(ResultSet rs) throws SQLException {
				List<Products_information> list = new ArrayList<Products_information>();
				while (rs.next()) {
					String url=rs.getString("url");
					list.add(new Products_information(rs.getInt("id"), rs.getString("information_name"),
							rs.getString("description"),alyoss.getImageUrl(url)));
				}
				return list;
			}
		},id);
	}
	
	// 产品表和图片表的连接查询
		public List<Products_information> queryInforId(int id) {
			String sql = "SELECT * FROM products_information i INNER JOIN products_images_url u ON i.id=u.information_id\r\n"
					+ "				INNER JOIN products_class c ON c.id=i.class_id\r\n"
					+ "				WHERE u.class_name=1 AND  c.id=? ORDER BY u.id DESC LIMIT 1";
			return this.executeQuery(sql, new Mapper<Products_information>() {

				@Override
				public List<Products_information> mapper(ResultSet rs) throws SQLException {
					List<Products_information> list = new ArrayList<Products_information>();
					while (rs.next()) {
						list.add(new Products_information(rs.getInt("id"), rs.getString("information_name"),
								rs.getString("description"), rs.getInt("class_id"), rs.getInt("information_status"),
								rs.getInt("is_last"), rs.getDate("create_time"), rs.getDate("shelves_time"),
								rs.getInt("information_id"), rs.getInt("class_name"), rs.getString("url")));
					}
					return list;
				}
			},id);
		}
	// 产品表和图片表的连接查询
	public List<Products_information> queryInfor() {
		String sql = "SELECT * FROM products_information INNER JOIN products_images_url ON products_information.`id`=products_images_url.`information_id` WHERE products_images_url.`class_name`=1";
		return this.executeQuery(sql, new Mapper<Products_information>() {

			@Override
			public List<Products_information> mapper(ResultSet rs) throws SQLException {
				List<Products_information> list = new ArrayList<Products_information>();
				while (rs.next()) {
					list.add(new Products_information(rs.getInt("id"), rs.getString("information_name"),
							rs.getString("description"), rs.getInt("class_id"), rs.getInt("information_status"),
							rs.getInt("is_last"), rs.getDate("create_time"), rs.getDate("shelves_time"),
							rs.getInt("information_id"), rs.getInt("class_name"), rs.getString("url")));
				}
				return list;
			}
		});
	}
	
	// 产品表和图片表的连接查询最低价格
		public List<Products_information> queryInforPrice() {
			String sql = "\r\n"
					+ "SELECT u.url,v.`sale_amount`,i.`description`,i.`information_name` FROM products_images_url u INNER JOIN products_information i ON i.`id`=u.`information_id`\r\n"
					+ "							INNER JOIN product_attr_vals v  ON i.`id`=v.`product_id` WHERE u.class_name=0 AND sale_amount IN\r\n"
					+ "							(SELECT MIN(sale_amount) AS min_sale_amount FROM product_attr_vals GROUP BY product_id)	";
			return this.executeQuery(sql, new Mapper<Products_information>() {

				@Override
				public List<Products_information> mapper(ResultSet rs) throws SQLException {
					List<Products_information> list = new ArrayList<Products_information>();
					while (rs.next()) {
						String url=rs.getString("url");
						list.add(new Products_information(rs.getString("information_name"), rs.getString("description"),alyoss.getImageUrl(url) , rs.getDouble("sale_amount")));
					}
					return list;
				}
			});
		}
		// 产品表和图片表的连接查询新品精品手机
				public List<Products_information> queryInforPriceTwo() {
					String sql = "\r\n"
							+ "SELECT \r\n"
							+ "    u.url, \r\n"
							+ "    MIN(v.sale_amount) AS min_sale_amount, \r\n"
							+ "    i.description, \r\n"
							+ "    i.information_name,i.id\r\n"
							+ "FROM \r\n"
							+ "    products_images_url u \r\n"
							+ "INNER JOIN \r\n"
							+ "    products_information i ON i.id = u.information_id \r\n"
							+ "INNER JOIN \r\n"
							+ "    product_attr_vals v ON i.id = v.product_id \r\n"
							+ "WHERE \r\n"
							+ "    u.class_name = 0 \r\n"
							+ "    AND i.is_last = 0 \r\n"
							+ "    AND u.url LIKE '%DM_%001.%'\r\n"
							+ "GROUP BY \r\n"
							+ "    u.url, \r\n"
							+ "    i.description, \r\n"
							+ "    i.information_name,i.id LIMIT 6";
					return this.executeQuery(sql, new Mapper<Products_information>() {

						@Override
						public List<Products_information> mapper(ResultSet rs) throws SQLException {
							List<Products_information> list = new ArrayList<Products_information>();
							while (rs.next()) {
								String url=rs.getString("url");
								list.add(new Products_information(alyoss.getImageUrl(url), rs.getDouble("min_sale_amount"), rs.getString("description"),rs.getString("information_name") ,rs.getInt("id")));
							}
							return list;
						}
					});
				}
				// 产品表和图片表的连接查询智能配件
				public List<Products_information> queryInforPricePei() {
					String sql = "SELECT u.url,MIN(v.sale_amount) AS min_sale_amount,i.`description`,i.`information_name`,i.id FROM products_images_url u INNER JOIN products_information i ON i.`id`=u.`information_id`\r\n"
							+ "						INNER JOIN product_attr_vals v  ON i.`id`=v.`product_id`\r\n"
							+ "						INNER JOIN products_class c ON c.`id`=i.`class_id`\r\n"
							+ "						WHERE u.class_name=0 AND c.`class_name`=\"智能硬件\"   AND u.url LIKE '%DM_%001.%'\r\n"
							+ "						GROUP BY u.url, i.description, i.information_name,i.id LIMIT 8";
					return this.executeQuery(sql, new Mapper<Products_information>() {

						@Override
						public List<Products_information> mapper(ResultSet rs) throws SQLException {
							List<Products_information> list = new ArrayList<Products_information>();
							while (rs.next()) {
								String url=rs.getString("url");
								list.add(new Products_information(alyoss.getImageUrl(url), rs.getDouble("min_sale_amount"), rs.getString("description"),rs.getString("information_name") ,rs.getInt("id")));
							}
							return list;
						}
					});
				}

	// 产品表和图片表的连接查询根据id查找大图片
	public List<Products_information> queryInforurl(int id) {
		String sql = "SELECT * FROM products_information INNER JOIN products_images_url ON products_information.`id`=products_images_url.`information_id` WHERE products_images_url.`class_name`=0\r\n"
				+ "AND products_information.`id`=?";
		return this.executeQuery(sql, new Mapper<Products_information>() {

			@Override
			public List<Products_information> mapper(ResultSet rs) throws SQLException {
				List<Products_information> list = new ArrayList<Products_information>();
				while (rs.next()) {
					String url = rs.getString("url");
					list.add(new Products_information(rs.getInt("id"), rs.getString("information_name"),
							rs.getString("description"), rs.getInt("class_id"), rs.getInt("information_status"),
							rs.getInt("is_last"), rs.getDate("create_time"), rs.getDate("shelves_time"),
							rs.getInt("information_id"), rs.getInt("class_name"), alyoss.getImageUrl(url)));
				}
				return list;
			}
		}, id);
	}
	//商品分页
	//public Map<string, V>
	// 产品表和图片表的连接查询根据id查找大图片只查询一条
	public List<Products_information> queryInforurlone(int id) {
		String sql = "SELECT * FROM products_information INNER JOIN products_images_url ON products_information.`id`=products_images_url.`information_id` WHERE products_images_url.`class_name`=0\r\n"
				+ "AND products_information.`id`=?  LIMIT 1";
		return this.executeQuery(sql, new Mapper<Products_information>() {

			@Override
			public List<Products_information> mapper(ResultSet rs) throws SQLException {
				List<Products_information> list = new ArrayList<Products_information>();
				while (rs.next()) {
					String url = rs.getString("url");
					list.add(new Products_information(rs.getInt("id"), rs.getString("information_name"),
							rs.getString("description"), rs.getInt("class_id"), rs.getInt("information_status"),
							rs.getInt("is_last"), rs.getDate("create_time"), rs.getDate("shelves_time"),
							rs.getInt("information_id"), rs.getInt("class_name"), alyoss.getImageUrl(url)));
				}
				return list;
			}
		}, id);
	}

	// 查找图片 根据id查找详情页的介绍图
	public List<Products_information> queryInforurlin(int id) {
		String sql = "SELECT * FROM products_information INNER JOIN products_images_url ON products_information.`id`=products_images_url.`information_id` WHERE products_images_url.`class_name`=2\r\n"
				+ "AND products_information.`id`=?";
		return this.executeQuery(sql, new Mapper<Products_information>() {

			@Override
			public List<Products_information> mapper(ResultSet rs) throws SQLException {
				List<Products_information> list = new ArrayList<Products_information>();
				while (rs.next()) {
					String url = rs.getString("url");
					list.add(new Products_information(rs.getInt("id"), rs.getString("information_name"),
							rs.getString("description"), rs.getInt("class_id"), rs.getInt("information_status"),
							rs.getInt("is_last"), rs.getDate("create_time"), rs.getDate("shelves_time"),
							rs.getInt("information_id"), rs.getInt("class_name"), alyoss.getImageUrl(url)));
				}
				return list;
			}
		}, id);
	}
	
	//查询商品名称
	public String getPnameById(String id) {
		String sql = "select information_name from products_information where id = ?";
		return this.singleObject(sql, id).toString();
	}
	
}
