package DAO;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.ProductSpecificationDetailed;
import util.BaseDAO;
import util.Mapper;

public class ProductSpecificationDetailedDAO extends BaseDAO{
	public List<ProductSpecificationDetailed> getProductSpecificationDetailedBySpecifications_id(String specifications_id){
		String sql = "SELECT * FROM products_specifications_detailed WHERE specifications_id = ? ORDER BY id DESC";
		return this.executeQuery(sql, new Mapper<ProductSpecificationDetailed>() {

			@Override
			public List<ProductSpecificationDetailed> mapper(ResultSet rs) throws SQLException {
				List<ProductSpecificationDetailed> list = new ArrayList<ProductSpecificationDetailed>();
				while(rs.next()) {
					list.add(new ProductSpecificationDetailed(
								rs.getLong(1),
								rs.getInt(2),
								rs.getString(3)
							));
				}
				
				return list;
			}
		}, specifications_id);
		
	}
}
