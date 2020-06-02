package dao;
import vo.*;
import java.sql.*;
import java.util.*;

import util.DBUtil;

public class CityDao {
	public void updateCity(City city) throws Exception{
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "UPDATE sakila_city SET city=?, country_id=? WHERE city_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, city.getCity());
		stmt.setInt(2, city.getCountryId());
		stmt.setInt(3, city.getCityId());
		stmt.executeUpdate();
	}
	
	public void deleteCity(int cityId) throws Exception{
		 DBUtil dbUtil = new DBUtil();
	      Connection conn = dbUtil.getConnection();
	      String sql ="delete FROM sakila_city where city_id=?";
	      PreparedStatement stmt = conn.prepareStatement(sql);
		  stmt.setInt(1, cityId);
		  stmt.executeUpdate();
	}
	
	public int selectTotalCount() throws Exception {
		//SELECT COUNT(*) FROM actor 필요
		DBUtil dbUtil = new DBUtil();
	    Connection conn = dbUtil.getConnection();
		PreparedStatement stmt = conn.prepareStatement("SELECT COUNT(*) FROM sakila_city");
		ResultSet rs = stmt.executeQuery();
		int totalCount = 0;
		if(rs.next()) {
			totalCount = rs.getInt("count(*)");
		}
		return totalCount;
	}
   public ArrayList<City> selectCityIdList()throws Exception{
      DBUtil dbUtil = new DBUtil();
      Connection conn = dbUtil.getConnection();
      System.out.println(conn + "/conn/CityDao");
      String sql = "SELECT city_id, city FROM sakila_city";
      System.out.println(sql + "/sql/CityDao");
      PreparedStatement stmt = conn.prepareStatement(sql);
      System.out.println(stmt + "/stmt/CityDao");
      ResultSet rs = stmt.executeQuery();
      System.out.println(rs + "/rs/CityDao");
      ArrayList<City> list = new ArrayList<City>();
      while(rs.next()) {
         City city = new City();
         city.setCityId(rs.getInt("city_id"));
         city.setCity(rs.getString("city"));
         list.add(city);
      }
      
      return list;
   }
   
   

      
   public void insertCityAndSelectKey(CityAndCountry cityAndCountry)throws Exception{
      DBUtil dbUtil = new DBUtil();
      Connection conn = dbUtil.getConnection();
      String sql = "INSERT INTO sakila_city(city,country_id,last_update) VALUES (?,?,now())";
      PreparedStatement stmt = conn.prepareStatement(sql);
      // stmt + insert + select
      
      // 1. insert
      stmt.setString(1,cityAndCountry.getCity().getCity());
      stmt.setInt(2, cityAndCountry.getCountry().getCountryId());
      stmt.executeUpdate();
      // 2. select
   
      }
   
   
   
   
   //insert into city inner join country where
   //City�뀒�씠釉붽낵 Country�뀒�씠釉붿쓣 JOIN�븳 �뜲�씠�꽣瑜� �굹�뿴
   public ArrayList<CityAndCountry>selectCityList(String searchWord, int beginRow, int rowPerPage) throws Exception {
      
      //�꽌踰꾩젒�냽
      
      
      DBUtil dbUtil = new DBUtil();
	  Connection conn = dbUtil.getConnection();
	  String sql ="SELECT ci.*,co.* FROM sakila_city ci INNER JOIN sakila_country co on ci.country_id = co.country_id WHERE ci.city LIKE? ORDER BY ci.city_id LIMIT ?,?";
      PreparedStatement stmt = conn.prepareStatement(sql);
      System.out.println(stmt + "<--stmt/CityDao");
      stmt.setString(1, "%"+searchWord+"%");
      stmt.setInt(2, beginRow);
      stmt.setInt(3, rowPerPage);
      
      ResultSet rs = stmt.executeQuery();
      System.out.println(rs + "<--rs/CityDao");
      //異쒕젰�븳 rs媛믪쓣 �떎瑜� �삎�깭濡� 蹂��솚�븯�뒗 �옉�뾽 
      ArrayList<CityAndCountry> list = new ArrayList<CityAndCountry>();
      while(rs.next()) {         
         CityAndCountry cityAndCountry = new CityAndCountry();
         City city = new City();
         
         city.setCityId(rs.getInt("city_id"));
         System.out.println(city.getCityId() + "cityId/CityDao");
         
         city.setCity(rs.getString("city"));
         System.out.println(city.getCity() + "<--city/CityDao");
         
         city.setCountryId(rs.getInt("country_id"));
         System.out.println(city.getCountryId() + "<--countryId/CityDao");
         
         city.setLastUpdate(rs.getString("last_update"));
         System.out.println(city.getLastUpdate() + "lastUpdate/CityDao");
         
         cityAndCountry.setCity(city);
         //System.out.println(cityAndCountry.geCity() + "<--cityAndcountry.city/CityDao");
         Country country = new Country();
         country.setCountryId(rs.getInt("country_id"));
         country.setCountry(rs.getString("country"));
         country.setLastUpdate(rs.getString("last_update"));
         
         cityAndCountry.setCountry(country);
         list.add(cityAndCountry);
      }
      return list;
   }

}