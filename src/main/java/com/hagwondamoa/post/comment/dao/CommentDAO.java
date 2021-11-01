package com.hagwondamoa.post.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.hagwondamoa.post.comment.model.Comment;

@Repository
public interface CommentDAO {
	
	public int insertComment(
			@Param("postId") int postId
			, @Param("userId") int userId
			, @Param("isWho") String isWho
			, @Param("userName") String userName
			, @Param("content") String content);
	
	public List<Comment> selectCommentListByPostId(int postId);
	
	public int deleteCommentByPostId(
			@Param("postId") int postId);
}

