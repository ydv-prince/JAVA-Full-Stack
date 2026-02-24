package com.prince.dao;

import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.prince.model.User;

@Repository
public class UserDao {
	private final JdbcTemplate jdbcTemplate;
	
	public UserDao(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate=jdbcTemplate;
	}
	public void save(User u) {
		String sql="insert into users(name,email) value(?,?)";
		jdbcTemplate.update(sql,u.getName(),u.getEmail());
	}
	public List<User> getAll(){
		return jdbcTemplate.query("select * from users",(rs,rowNum)->{
			User u=new User();
			u.setId(rs.getInt("id"));
			u.setName(rs.getString("name"));
			u.setEmail(rs.getString("email"));
			return u;
		});
	}
	//delete
	public void delete(int id) {
		String sql ="delete from users where id=?";
		jdbcTemplate.update(sql,id);
	}
	//edit by id
	
	public User getById(int id) {
		String sql="select * from users where id=?";
		return jdbcTemplate.queryForObject(sql,(rs,rowNum)->{User u = new User();
		u.setId(rs.getInt("id"));
		u.setName(rs.getString("name"));
		u.setEmail(rs.getString("email"));
		return u;
		},id);
	}
	//update
	public void update(User u) {
		String sql="update users set name=?,email=? where id=?";
				jdbcTemplate.update(sql,u.getName(),u.getEmail(),u.getId());
	}
}
