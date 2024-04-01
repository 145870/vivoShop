package servlets.background.product_detailed;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ProductSpecificationDAO;
import DAO.ProductSpecificationDetailedDAO;
import entity.ProductSpecification;
import entity.ProductSpecificationDetailed;

@WebServlet("/background/pages/function/product_detailed/selAll")
public class SelectAllServlet extends HttpServlet{
	ProductSpecificationDAO psdao=new ProductSpecificationDAO();
	ProductSpecificationDetailedDAO psddao=new ProductSpecificationDetailedDAO();
	@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        String id = req.getParameter("id");

        List<ProductSpecification> pslist = psdao.getProductSpecificationById("2");

        // 存储对应值
        Map<String, List<ProductSpecificationDetailed>> map = new HashMap<String, List<ProductSpecificationDetailed>>();

        // 获取每一行对应的值
        for (ProductSpecification ps : pslist) {
            List<ProductSpecificationDetailed> psdList = psddao.getProductSpecificationDetailedBySpecifications_id(ps.getId() + "");
            map.put(ps.getId().toString(), psdList);
        }

        // 生成所有组合
        List<Map<String, Object>> allCombinations = generateCombinations(pslist, map, 0, new HashMap<>());

        // 对所有组合进行计算价格
        for (Map<String, Object> combination : allCombinations) {
            System.out.println(combination);
        }
    }

    // 递归生成所有组合
    private List<Map<String, Object>> generateCombinations(List<ProductSpecification> psList, Map<String, List<ProductSpecificationDetailed>> psdMap, int index, Map<String, Object> currentCombination) {
        List<Map<String, Object>> combinations = new ArrayList<>();

        if (index == psList.size()) {
            // 当所有规格都处理完毕时，将当前组合加入到结果中
            combinations.add(new HashMap<>(currentCombination));
            return combinations;
        }

        ProductSpecification currentPS = psList.get(index);
        List<ProductSpecificationDetailed> psdList = psdMap.get(currentPS.getId().toString());

        for (ProductSpecificationDetailed psd : psdList) {
            // 将当前规格值加入到当前组合中
            currentCombination.put(currentPS.getSpecificationsName(), psd.getDetailedValue());
            // 递归处理下一个规格
            combinations.addAll(generateCombinations(psList, psdMap, index + 1, currentCombination));
            // 移除当前规格值，以便尝试其他值
            currentCombination.remove(currentPS.getSpecificationsName());
        }

        return combinations;
    }
}
