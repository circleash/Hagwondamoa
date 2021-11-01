package com.hagwondamoa.post.like;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hagwondamoa.post.like.bo.LikeBO;

@RestController
@RequestMapping("/post")
public class LikeRestController {
	
	@Autowired
	private LikeBO likeBO;
	
	//GET이냐 POST냐 구분 --> Post는 특수한 경우만임(비밀번호, 개인정보 등) 왠만하면 Get으로 한다.
	@GetMapping("/like")
	public Map<String, String> like (
			@RequestParam("postId") int postId
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
//		int count = likeBO.addLike(postId, userId);
		
		boolean isLike = likeBO.addLike(postId, userId);
		
		Map<String, String> result = new HashMap<>();
		
		if(isLike) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		return result;
	}
	
	@GetMapping("/unlike")
	public Map<String, String> unlike (
			@RequestParam("postId") int postId
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		Map<String, String> result = new HashMap<>();
		int count = likeBO.unlike(postId, userId);
		
		if(count == 0) {
			result.put("result", "fail");
		} else {
			result.put("result", "success");
		}
		return result;
	}

}
