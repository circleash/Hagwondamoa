package com.hagwondamoa.post.comment.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hagwondamoa.post.comment.dao.CommentDAO;
import com.hagwondamoa.post.comment.model.Comment;

@Service
public class CommentBO {
	
	@Autowired
	private CommentDAO commentDAO;
	
	public int addComment(int postId, int userId, String isWho, String userName, String content) {
		return commentDAO.insertComment(postId, userId, isWho, userName, content);
	}
	
	//postId에 해당하는 댓글 리스트 가져오기
	//이거하면서 jsp에서 사용할 model 생성
	public List<Comment> getCommentListByPostId(int postId) {
		return commentDAO.selectCommentListByPostId(postId);
	}
	
	// postId 를 대상으로 삭제 
		public int deleteCommentByPostId(int postId) {
			return commentDAO.deleteCommentByPostId(postId);
		}
}
