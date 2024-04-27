package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;

import entity.shopping_cartDetails;
import util.AliyunOssUtil;
import util.BaseDAO;
import util.Mapper;

public class FavoritesDAO extends BaseDAO{
	AliyunOssUtil alyoss = new AliyunOssUtil();
	//查询购物车数据
	public List<shopping_cartDetails> selectShoppingData(int SID) {
		String sql = "SELECT usc.`id`,usc.`user_id`,p.`information_name`,pav.`attr_vals`,pav.`sale_amount`,usc.`quantity`,(pav.`sale_amount`*usc.`quantity`),piu.`url`\r\n"
				+ "FROM user_shopping_cart usc\r\n"
				+ "JOIN product_attr_vals pav ON pav.`id`=usc.`product_attr_vals_id`\r\n"
				+ "JOIN products_information p ON p.`id`=pav.`product_id`\r\n"
				+ "JOIN products_images_url piu ON piu.`information_id`=p.`id`\r\n"
				+ "WHERE usc.`user_id` = 1  AND piu.`url` LIKE '%DM_%_001.%' AND usc.`user_id` = ?";
		return this.executeQuery(sql, new Mapper<shopping_cartDetails>() {

			@Override
			public List<shopping_cartDetails> mapper(ResultSet rs) throws SQLException {
				List<shopping_cartDetails> list = new ArrayList<>();
				while(rs.next()) {
					Long id = rs.getLong(1);//用户购物车里面商品唯一标识符ID
					Long uid = rs.getLong(2);//用户购物车所属用户ID
					String name = rs.getString(3);//商品名称
					String vals[] = (new Gson().fromJson(rs.getString(4), String[].class));
					
					 String val = "";
					 for (int x = 0; x < vals.length; x++) {
					 	val += vals[x];
					    // 如果不是最后一个值，则添加逗号分隔符
					    if (x < vals.length - 1) {
					    	val += ",";
					    }
					}
					String price = rs.getString(5);
					Integer num = rs.getInt(6);
					Double sumPrice = rs.getDouble(7);
					String image = alyoss.getImageUrl(rs.getString(8));
					shopping_cartDetails shop = new shopping_cartDetails(id,uid,name,val,price,num,sumPrice,image);
					list.add(shop);
				}
				return list;
			}
		}, SID);
	}
	
	//新增收藏
	public int insertFavorites(long uid,long pid) {
		String sql = "\r\n"
				+ "INSERT INTO user_collect VALUES(NULL,?,?,NOW()) ";
		return this.execute(sql,uid,pid);
	}
	
}
