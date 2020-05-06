package dao;

import vo.*;
import util.*;
import java.sql.*;
import java.util.*;


public class AddressDao {
	public void updateAddress(Address address) throws Exception{
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "UPDATE address SET address=?, address2=?, district=?, city_id=?, postal_code=?, phone=? WHERE address_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, address.getAddress());
		stmt.setString(2, address.getAddress2());
		stmt.setString(3, address.getDistrict());
		stmt.setInt(4, address.getCityId());
		stmt.setString(5, address.getPostalCode());
		stmt.setString(6, address.getPhone());
		stmt.setInt(7, address.getAddressId());
		stmt.executeUpdate();
	}
	public int SelectCountAddress() throws Exception{
	      DBUtil dbUtil = new DBUtil();
	      Connection conn = dbUtil.getConnection();
	      String sql = "SELECT COUNT(*) cnt FROM address";
	      PreparedStatement stmt = conn.prepareStatement(sql);
	      ResultSet rs = stmt.executeQuery();
	      int totalCount = 0;
	      if(rs.next()) {
	    	  totalCount = rs.getInt("cnt");
	      }
	      return totalCount;
	}
	
	
	public ArrayList<Address> SelectAddressOne() throws Exception{
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "SELECT * FROM address";
		PreparedStatement stmt = conn.prepareStatement(sql); 
		ResultSet rs = stmt.executeQuery();
		ArrayList<Address> list = new ArrayList<Address>();
		while(rs.next()) {
			Address address = new Address();			
			address.setAddressId(rs.getInt("address_id"));
			address.setAddress(rs.getString("address"));
			address.setAddress2(rs.getString("address2"));
			address.setDistrict(rs.getString("district"));
			address.setCityId(rs.getInt("city_id"));
			address.setPostalCode(rs.getString("postal_code"));
			address.setPhone(rs.getString("phone"));
			address.setLastUpdate(rs.getString("last_update"));
			list.add(address);			
		}
		
		return list;
	}
	
	// addressList
	public ArrayList<AddressAndCityAndCountry> SelectAddress(String searchWord, int beginRow, int rowPerPage ) throws Exception{
		  System.out.println(searchWord + "/searchWrod");
	      DBUtil dbUtil = new DBUtil();
	      Connection conn = dbUtil.getConnection();
	      String sql = "SELECT ad.*,co.*,ci.* FROM address ad INNER JOIN country co INNER JOIN city ci "
	      		+ "ON ad.city_id = ci.city_id AND ci.country_id = co.country_id WHERE ad.address like ? ORDER BY ad.address_id limit ?,?";
	      PreparedStatement stmt = conn.prepareStatement(sql);
	      stmt.setString(1, "%"+searchWord+"%");
	      stmt.setInt(2, beginRow);
	      stmt.setInt(3, rowPerPage);
	      ResultSet rs = stmt.executeQuery();
	      ArrayList<AddressAndCityAndCountry> list = new ArrayList<AddressAndCityAndCountry>();
	      while(rs.next()) {
	         AddressAndCityAndCountry ad = new AddressAndCityAndCountry();

	         City city = new City();
	         city.setCity(rs.getString("city"));
	         //System.out.println(city.getCity());
	         city.setCityId(rs.getInt("city_id"));
	         city.setCountryId(rs.getInt("country_id"));
	         city.setLastUpdate(rs.getString("last_update"));
	         
	         ad.setCity(city);
	         
	         Country country = new Country();
	         country.setCountry(rs.getString("country"));
	         country.setCountryId(rs.getInt("country_id"));
	         country.setLastUpdate(rs.getString("last_update"));
	         
	         ad.setCountry(country);

	         Address address = new Address();
	         address.setAddress(rs.getString("address"));
	         address.setAddress2(rs.getString("address2"));
	         address.setAddressId(rs.getInt("address_id"));
	         address.setCityId(rs.getInt("city_id"));
	         address.setDistrict(rs.getString("district"));
	         address.setLastUpdate(rs.getString("last_update"));
	         address.setPhone(rs.getString("phone"));
	         address.setPostalCode(rs.getString("postal_code"));
	         
	         ad.setAddress(address);
	            
	         list.add(ad);
	      }
	      return list;
	   }
	
	/*
	// addressList cityId �� �������� �κ�
	public City selectCityId(int cityId) throws Exception{
	      DbUtil dbUtil = new DbUtil();
	      Connection conn = dbUtil.getConnection();
	      String sql = "SELECT city_id FROM city WHERE city_id=?";
	      PreparedStatement stmt = conn.prepareStatement(sql);
	      stmt.setInt(1, cityId);
	      ResultSet rs = stmt.executeQuery();
	      City city = new City();
	      while(rs.next()) {
	         city.setCityId(rs.getInt("city_id"));
	      }
	      return city;
	   }
	*/ 

	// insertAddressAction
	public void insertAddress(Address a) throws Exception {
		System.out.println("AddressDao.insertAddress()");
		System.out.println(a.getAddressId() + " <-- a.getAddressId");
		System.out.println(a.getAddress() + " <-- a.getAddress");
		System.out.println(a.getAddress2() + " <-- a.getAddress2");
		System.out.println(a.getDistrict() + " <-- a.getDistrict");
		System.out.println(a.getCityId() + " <-- a.getCityId");
		System.out.println(a.getPostalCode() + " <-- a.getPostalCode");
		System.out.println(a.getPhone() + " <-- a.getPhone");
		
		String sql = 
		"INSERT INTO address(address, address2, district, city_id, postal_code, phone, last_update) VALUES(?, ?, ?, ?, ?, ?, now())";
		
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, a.getAddress());
		stmt.setString(2, a.getAddress2());
		stmt.setString(3, a.getDistrict());
		stmt.setInt(4, a.getCityId());
		stmt.setString(5, a.getPostalCode());
		stmt.setString(6, a.getPhone());
		stmt.executeUpdate();
	}
	
	public int insertAddressAndSelectKey(Address a) throws Exception {
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		
		String sql =
		"INSERT INTO address(address_id, address, address2, district, city_id, postal_code, phone, last_update)"
		+ "VALUES(?, ?, ?, ?, ?, ?, ?, now())";
		
		PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
		stmt.executeUpdate();
		// SELECT address_id FROM address WHERE address_id = ?
		ResultSet rs = stmt.getGeneratedKeys();
		
		int addressId = 0;
		if(rs.next()) {
			addressId = rs.getInt(1);
		}
		return addressId;
	}
}
