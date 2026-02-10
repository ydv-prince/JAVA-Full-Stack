package com.prince.dao;

import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.prince.model.User;


public class UserDao {
private final JdbcTemplate jdbcTemplate;

public UserDao(JdbcTemplate jdbcTemplate) {
	this.jdbcTemplate = jdbcTemplate;
}
	
	public void save(User u)
	{
		String sql = "insert into users(name,email) value(?,?)";
		jdbcTemplate.update(sql,u.getName(),u.getEmail());
	}
	public List<User> getAll(){
		return jdbcTemplate.query("select * from users", 
				(rs,rowNum)->{
					User u=new User();
					u.setId(rs.getInt("id"));
					u.setName(rs.getString("name"));
					u.setEmail(rs.getString("email"));
					return u;
				});
	}
}
