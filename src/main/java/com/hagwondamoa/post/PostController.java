package com.hagwondamoa.post;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hagwondamoa.post.bo.PostBO;
import com.hagwondamoa.post.comment.bo.CommentBO;
import com.hagwondamoa.post.comment.model.Comment;
import com.hagwondamoa.post.like.bo.LikeBO;
import com.hagwondamoa.post.like.model.Like;
import com.hagwondamoa.post.model.Post;

@Controller
@RequestMapping("/post")
public class PostController {
	
	@Autowired
	private LikeBO likeBO;
	
	@Autowired
	private CommentBO commentBO;
	
	@Autowired
	private PostBO postBO;
	
	@GetMapping("/main_view")
	public String mainView(Model model) {
		List<Post> hagwonList = postBO.getGroupList("hagwon");
		List<Post> tutoringList = postBO.getGroupList("tutoring");
		List<Post> schoolList = postBO.getGroupList("school");
		List<Post> healthList = postBO.getGroupList("health");
		List<Post> talkingList = postBO.getGroupList("talking");
		
		model.addAttribute("hagwonList", hagwonList);
		model.addAttribute("tutoringList", tutoringList);
		model.addAttribute("schoolList", schoolList);
		model.addAttribute("healthList", healthList);
		model.addAttribute("talkingList", talkingList);
		
		return "post/main";
	}
	
	@GetMapping("/write_view")
	public String createView() {
		
		return "post/writeView";
	}
	
	@GetMapping("/list_view")
	public String listView(
			@RequestParam("category") String category
			, Model model) {
		
		
		List<Post>postList = postBO.getPostList(category);
		
		model.addAttribute("postList", postList);
		
		return "post/listView";
	}
	
	@GetMapping("/detail_view")
	public String detailView(
			@RequestParam("id") int id
			, Model model
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		Post post = postBO.getPost(id);
		List<Comment>commentList = commentBO.getCommentListByPostId(id);
		boolean like = likeBO.likeByUserId(id, userId);
		int likeCount = likeBO.likeCount(id);
		
		model.addAttribute("post", post);
		model.addAttribute("commentList", commentList);
		model.addAttribute("like", like);
		model.addAttribute("likeCount", likeCount);
		
		return "post/detailView";
	}

}
