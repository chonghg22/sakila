package dao;
import java.util.*;

import util.DBUtil;

import java.sql.*;
import vo.*;
import java.sql.*;

public class CategoryDao {
	
	
	public int selectTotalCount() throws Exception{
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement("SELECT COUNT(*) FROM sakila_category");
		ResultSet rs = stmt.executeQuery();
		int totalCount = 0;
		if(rs.next()) {
			totalCount = rs.getInt("count(*)");
		}
		return totalCount;
	}
	
	public void updateCategory(Category category) throws Exception {
		System.out.println(category.getCategoryId() +"</1/categoryDao");
		System.out.println(category.getName() +"</2/categoryDao");
		//System.out.println(category.lastUpdate +"</3/categoryDao");
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "update sakila_category set name=? where category_id=?";		
		//System.out.println(conn + "conn.updateDao");
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, category.getName());
		stmt.setInt(2, category.getCategoryId());
		stmt.executeUpdate();
		System.out.println(stmt + "stmt.updateDao");
		
	
		
		
	}
	public void deleteCategory(int categoryId) throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement("DELETE FROM sakila_category WHERE category_id=?");
		System.out.println(stmt+"deleteDao");
		stmt.setInt(1, categoryId);
		int row = stmt.executeUpdate();
		if(row==1) {
			System.out.println(categoryId+"번 삭제");
		}else{
			System.out.println(categoryId+"번 삭제실패");
		}
	}
	
	public void insertCategory(Category category) throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement("INSERT INTO sakila_category(category_id, name, last_update) VALUES (?,?, now())");
													
		stmt.setInt(1, category.getCategoryId());
		stmt.setString(2, category.getName());
		stmt.executeQuery();
		
		
	}
	public Category selectCategoryOne(int categoryId) throws Exception {//throws Exception은 서버연결 오류 해결해주는 메소드 
		
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		System.out.println(conn);
		
		PreparedStatement stmt = conn.prepareStatement("SELECT * FROM sakila_category WHERE category_id=?");
														
		stmt.setInt(1, categoryId);
		
		ResultSet rs = stmt.executeQuery();
		Category cs = null;
		
		if(rs.next()) {
			cs = new Category();
			cs.setCategoryId(rs.getInt("category_id"));
			cs.setName(rs.getString("name"));
			System.out.println(cs.getCategoryId() + "<-selectDao");
			System.out.println(cs.getName() + "<-selectDao");
			System.out.println(cs.getLastUpdate() + "<-selectDao");
		
		}
		
		return cs;
			
		}
		
		
	
	// select* from category
	public ArrayList<Category> selectCategoryAll(String searchWord, int beginRow, int rowPerPage) throws Exception{
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement("SELECT category_id,name,last_update FROM sakila_category WHERE name LIKE ? ORDER BY category_id LIMIT ?,?");
		stmt.setString(1, "%"+searchWord+"%");
		stmt.setInt(2, beginRow);
		stmt.setInt(3, rowPerPage);
		ResultSet rs = stmt.executeQuery();
		
		ArrayList<Category> list = new ArrayList<Category>();
		while(rs.next()) {
			Category category = new Category();
			category.setCategoryId(rs.getInt("category_id"));
			category.setName(rs.getString("name"));
			category.setLastUpdate(rs.getString("last_update"));
			list.add(category);
			
		}
		
		
		return list;
		
	
	}
}


