package dao;
import java.sql.*;
import java.util.*;

import util.DBUtil;
import vo.*;
public class ActorDao {
	public void updateActor(Actor actor) throws Exception{
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		String sql = "UPDATE actor SET first_name=?, last_name=? WHERE sakila_actor_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, actor.getFirstName());
		stmt.setString(2, actor.getLastName());
		stmt.setInt(3, actor.getActorId());
		stmt.executeUpdate();
	}
	
	public void deleteActor(int actorId) throws Exception {
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		PreparedStatement stmt = conn.prepareStatement("DELETE FROM sakila_actor WHERE actor_id=?");
		stmt.setInt(1, actorId);
		stmt.executeUpdate();
	}
	public int selectTotalCount() throws Exception {
		//SELECT COUNT(*) FROM actor 필요
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		PreparedStatement stmt = conn.prepareStatement("SELECT COUNT(*) FROM sakila_actor");
		ResultSet rs = stmt.executeQuery();
		int totalCount = 0;
		if(rs.next()) {
			totalCount = rs.getInt("count(*)");
		}
		return totalCount;
	}
	public ArrayList<Actor> selectActorByPage( String searchWord,int beginRow, int rowPerPage) throws Exception{
		System.out.println(beginRow +"/1/class");
		System.out.println(rowPerPage + "/2/class");
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		PreparedStatement stmt = conn.prepareStatement("SELECT * FROM sakila_actor WHERE first_name LIKE ? ORDER BY actor_id LIMIT ?,?");
		stmt.setString(1, "%"+searchWord+"%");
		stmt.setInt(2, beginRow);
		stmt.setInt(3, rowPerPage);		
		ResultSet rs = stmt.executeQuery();
		//ResultSet -> Arraylist 로 변경
		ArrayList<Actor> list = new ArrayList<Actor>();
		while(rs.next()) {
			Actor actor = new Actor();
			actor.setActorId(rs.getInt("actor_id"));
			actor.setFirstName(rs.getString("first_name"));
			actor.setLastName(rs.getString("last_name"));
			actor.setLastUpdate(rs.getString("last_update"));
			list.add(actor);
		}
		return list;
	}
	
	public void insertActor(Actor actor) throws Exception {
		DBUtil dbutil = new DBUtil();
		Connection conn = dbutil.getConnection();
		PreparedStatement stmt = conn.prepareStatement("INSERT INTO sakila_actor( first_name, last_name, last_update) VALUES (?,?, now())");
		stmt.setString(1, actor.getFirstName());
		stmt.setString(2, actor.getLastName());
		stmt.executeQuery();
	}
}
