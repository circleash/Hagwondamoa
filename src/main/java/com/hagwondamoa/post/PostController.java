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
import com.hagwondamoa.post.model.Post;

@Controller
@RequestMapping("/post")
public class PostController {
	
	@Autowired
	private PostBO postBO;
	
	@GetMapping("/main_view")
	public String mainView() {
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
		
		model.addAttribute("post", post);
		
		return "post/detailView";
	}

}
