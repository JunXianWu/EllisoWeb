package com.umc.ovalis.repositories;

import java.util.List;

import com.umc.ovalis.models.User;

public interface UserRepository {

	public void create(User user);

	public List<User> getAll();
}