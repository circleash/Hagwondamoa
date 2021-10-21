package com.hagwondamoa.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.hagwondamoa.post.model.Post;

@Repository
public interface PostDAO {
	
	public int insertPost(
			@Param("userId") int userId
			,@Param("isWho") String isWho
			,@Param("userName") String userName
			,@Param("userSchool") String userSchool
			,@Param("category") String category 
			,@Param("content") String content
			,@Param("imagePath") String imagePath);
	
	public List<Post> selectPostList(@Param("category") String category);
	
	public Post selectPost(
			 @Param("id") int id); 
	
	public deletePost(@Param("id") int id
			, @Param("userId") int userId);

}
