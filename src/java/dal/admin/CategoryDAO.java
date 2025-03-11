/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal.admin;

import entity.Category;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class CategoryDAO extends DBContext {

    public List<Category> getAllCategories() {
        String sql = "SELECT [category__id]\n"
                + "      ,[category__name]\n"
                + "      ,[description]\n"
                + "  FROM [dbo].[Categories]";
        
        List<Category> list = new ArrayList<>();
        connection = getConnection();
        try {
            ps = connection.prepareStatement(sql);

            rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("category__id");
                String categoryName = rs.getString("category__name");
                String des = rs.getString("description");
                list.add(new Category(id, categoryName, des));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public static void main(String[] args) {
        
    }
}
