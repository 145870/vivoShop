package DAO;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import entity.ProductSpecification;
import entity.ProductsInformation;
import util.BaseDAO;

public class SetPAVDAO extends BaseDAO{
	public static void main(String[] args) {
		ProductsInformationDAO pidao = new ProductsInformationDAO();
		ProductSpecificationDAO psdao = new ProductSpecificationDAO();
		ProductAttrValueDAO pavdao = new ProductAttrValueDAO();
		InventoryDetailsDAO iddao = new InventoryDetailsDAO();
		SetPAVDAO dao = new SetPAVDAO();
		
		List<ProductsInformation> allProductsInformations = pidao.getProductsInformation();
		
		//for (ProductsInformation pi:allProductsInformations) {
			String pid="33";
			
			List<ProductSpecification> PSlist = (List<ProductSpecification>) psdao.getProductSpecificationById(pid).get("list");
			
			List<String> psnameList = new ArrayList<String>();
			List<String[]> psValsList = new ArrayList<String[]>();
			for(ProductSpecification ps:PSlist) {
				String psname = ps.getSpecificationsName();
				String[] psVals = ps.getSpecificationsValues();
				
				psnameList.add(psname);
				psValsList.add(psVals);
			}
			
			System.out.println("---------------------------------");
			 List<List<String>> combinations = generateCombinations(psValsList, 0, new ArrayList<>(), new ArrayList<>());

		        for (List<String> combination : combinations) {
		        	double price=0.0;
		        	List<String> arrs = new ArrayList<String>();
		        	
		            for (int i = 0; i < psnameList.size(); i++) {
		            	String name=psnameList.get(i);
		            	String val = combination.get(i);
		            	
		            	if (name.equals("版本")&& val.equals("esim版")) {
		            		price=1999;
						}else if (name.equals("版本")&& val.equals("蓝牙版")) {
		            		price=1799;
						}
		            	arrs.add(val);
		                System.out.print(name + ": " + val + " ") ;
		            }
		            System.out.print(price+"\t\t");
		            //执行新增数据
		            String jg = "失败";
		            if (price!=0) {
		            	jg = pavdao.insertByPid(pid, arrs, price+"");
					}
		            if(jg.equals("新增成功")) {
		    			String newID = pavdao.getInsertedId().toString();
		    			if (newID!="-1") {
		    				iddao.doInsert(newID, "1000");
		    			}else {
		    				jg = "规格新增成功,库存新增错误";
		    			}
		    		}
		            System.out.println(jg);
		        }
		        System.out.println("-------------------------------");
		//}
		
		
		
	}
	
	private static List<List<String>> generateCombinations(List<String[]> psValsList, int index, List<String> current, List<List<String>> result) {
        if (index == psValsList.size()) {
            result.add(new ArrayList<>(current));
            return result;
        }

        String[] currentOptions = psValsList.get(index);
        for (String option : currentOptions) {
            current.add(option);
            generateCombinations(psValsList, index + 1, current, result);
            current.remove(current.size() - 1);
        }

        return result;
    }
}
