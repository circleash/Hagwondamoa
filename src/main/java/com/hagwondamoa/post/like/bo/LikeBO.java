package com.hagwondamoa.post.like.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hagwondamoa.post.like.dao.LikeDAO;

@Service
public class LikeBO {
	
	@Autowired
	private LikeDAO likeDAO;
	
	public boolean addLike(int postId, int userId) {
		
		// 좋아요 상태면 좋아요 취소
		if(this.likeByUserId(postId, userId) ) {
			int count = likeDAO.deleteLike(postId, userId);
			if(count == 0) {
				return false;
			} else {
				return true;
			}
		} else {
			int count = likeDAO.insertLike(postId, userId);
			if(count == 1) {
				return true;
			} else {
				return false;
			}
		}
	}
	
	public int unlike(int postId, int userId) {
		return likeDAO.deleteLike(postId, userId);
	}
	
	// postId와 userId로 좋아요 여부 확인
	public boolean likeByUserId(int postId, int userId) {
		int count = likeDAO.selectCountLikeByUserId(postId, userId);
		
		if(count == 0) {
			return false;
		} else {
			return true;
		}
	}
	
	//postId로 생성된 좋아요 개수
	public int likeCount(int postId) {
		return likeDAO.selectCountLikeByPostId(postId);
	}
	
	public int deleteLikeByPostId(int postId) {
		return likeDAO.deleteLikeByPostId(postId);
	}

}
