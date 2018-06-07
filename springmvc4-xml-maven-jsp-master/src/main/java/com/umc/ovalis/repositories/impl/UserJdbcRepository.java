package com.umc.ovalis.repositories.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.umc.ovalis.models.User;
import com.umc.ovalis.repositories.UserRepository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Repository
public class UserJdbcRepository implements UserRepository {

	@Override
	public void create(User user) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<User> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

//	private final JdbcTemplate jdbcTemplate;
//
//	@Autowired
//	public UserJdbcRepository(JdbcTemplate jdbcTemplate) {
//		this.jdbcTemplate = jdbcTemplate;
//	}
//
//	@Override
//	public void create(User user) {
//		String sql = "INSERT INTO users " + "(id, username) VALUES (seq_users_id.nextval, ?)";
//
//		jdbcTemplate.update(sql, new Object[] { user.getUsername() });
//	}
//
//	@Override
//	public List<User> getAll() {
//		String sql = "SELECT * FROM users";
//
//		return jdbcTemplate.query(sql,
//				(resultSet, rowNum) -> new User(resultSet.getLong("id"), resultSet.getString("username")));
//	}
}
