package DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.ProductsClass;
import util.BaseDAO;
import util.Mapper;

public class ProductsClassDAO extends BaseDAO{
	public List<ProductsClass> getProductsClasses(){
		String sql = "select * from products_class ORDER BY id DESC";
		return this.executeQuery(sql, new Mapper<ProductsClass>() {

			@Override
			public List<ProductsClass> mapper(ResultSet rs) throws SQLException {
				List<ProductsClass> list = new ArrayList<ProductsClass>();
				while(rs.next()) {
					list.add(new ProductsClass(
								rs.getLong(1),
								rs.getString(2)
							));
					
				}
				return list;
			}
		});
	}
}
