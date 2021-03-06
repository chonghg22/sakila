package dao;
import java.sql.*;
import java.util.*;
import util.*;
import vo.*;
public class CountryDao {
	public void updateCountry(Country country) throws Exception{
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "UPDATE sakila_country SET country=? WHERE country_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, country.getCountry());
		stmt.setInt(2, country.getCountryId());		
		stmt.executeUpdate();
	}
	public void deleteCountry(int countryId) throws Exception {
		DBUtil dbutil = new DBUtil();
	    Connection conn = dbutil.getConnection();
		PreparedStatement stmt = conn.prepareStatement("DELETE FROM sakila_country WHERE country_id=?");
		stmt.setInt(1, countryId);
		stmt.executeUpdate();
	}
	public int selectTotalCount() throws Exception {
		//SELECT COUNT(*) FROM actor 필요
		DBUtil dbutil = new DBUtil();
	    Connection conn = dbutil.getConnection();
		PreparedStatement stmt = conn.prepareStatement("SELECT COUNT(*) FROM sakila_country");
		ResultSet rs = stmt.executeQuery();
		int totalCount = 0;
		if(rs.next()) {
			totalCount = rs.getInt("count(*)");
		}
		return totalCount;
	}
   public void insertCountry(Country country) throws Exception{
      DBUtil dbUtil = new DBUtil();
      Connection conn = dbUtil.getConnection();
      String sql = "INSERT INTO sakila_country( country, last_update) VALUES (?, now())";
      PreparedStatement stmt = conn.prepareStatement(sql);
      stmt.setString(1,  country.getCountry());
      stmt.executeQuery();
      
   }
   
   public ArrayList<Country> selectCountryListAll(String searchWord, int beginRow, int rowPerPage)throws Exception{
      System.out.println(searchWord + "<--searchWord/Dao");
      DBUtil dbUtil = new DBUtil();
      Connection conn = dbUtil.getConnection();
      String sql = "SELECT * FROM sakila_country WHERE country LIKE ? ORDER BY country_id LIMIT ?,?";      
      PreparedStatement stmt = conn.prepareStatement(sql);
      stmt.setString(1, "%"+searchWord+"%");
      stmt.setInt(2, beginRow);
      stmt.setInt(3, rowPerPage);
      ResultSet rs = stmt.executeQuery();
      ArrayList<Country> list = new ArrayList<Country>();
      while (rs.next()) {
         Country country = new Country();
         country.setCountryId(rs.getInt("country_id"));
         country.setCountry(rs.getString("country"));
         country.setLastUpdate(rs.getString("last_update"));
         list.add(country);
         
      }
      return list;
   }
   public ArrayList<Country> selectCountryListOne()throws Exception{

	      DBUtil dbUtil = new DBUtil();
	      Connection conn = dbUtil.getConnection();
	      String sql = "SELECT * FROM sakila_country";      
	      PreparedStatement stmt = conn.prepareStatement(sql);
	      ResultSet rs = stmt.executeQuery();
	      ArrayList<Country> list = new ArrayList<Country>();
	      while (rs.next()) {
	         Country country = new Country();
	         country.setCountryId(rs.getInt("country_id"));
	         country.setCountry(rs.getString("country"));
	         country.setLastUpdate(rs.getString("last_update"));
	         list.add(country);
	         
	      }
	      return list;
	   }
}