package com.mio.ecom.repositories;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import com.mio.ecom.models.User;

public interface UserRepository extends CrudRepository<User, Long> {
	Optional<User> findByEmail(String email);
}
