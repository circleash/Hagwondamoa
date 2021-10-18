package com.hagwondamoa.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.hagwondamoa.user.model.User;

@Repository
public interface UserDAO {
	
	public int insertUser(@Param("loginId") String loginId
			, @Param("password") String password
			, @Param("isWho") String isWho
			, @Param("userName") String userName
			, @Param("userSchool") String userSchool
			, @Param("email") String email);
	
	public int selectCountByLoginId(@Param("loginId") String loginId);
	
	public User selectUserByLoginIdPassword(
			@Param("loginId") String loginId
			, @Param("password") String password);
}
