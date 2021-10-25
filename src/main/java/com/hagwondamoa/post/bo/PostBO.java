package com.hagwondamoa.post.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hagwondamoa.common.FileManagerService;
import com.hagwondamoa.post.dao.PostDAO;
import com.hagwondamoa.post.model.Post;

@Service
public class PostBO {
	
	@Autowired
	private PostDAO postDAO;
	
	public int addPost(int userId, String isWho, String userName, String userSchool, String category, String content, MultipartFile file) {
		
		String imagePath = null;
		// 파일이 있을 경우에만 저장 로직 진행
		if(file != null) {
			imagePath = FileManagerService.saveFile(userId, file);
			// saveFile에서 파일 저장에 실패한 경우
			if(imagePath == null) {
				return 0;
			}
		}
		
		return postDAO.insertPost(userId, isWho, userName, userSchool, category, content, imagePath);
	}

	public List<Post> getPostList(String category) {
		return postDAO.selectPostList(category);
	}
	
	public Post getPost(int id) {
		return postDAO.selectPost(id);
	}
	
	public int deletePost(int id, int userId) {
		
		Post post = this.getPost(id);
		
		if(post.getImagePath() != null) {
			FileManagerService.removeFile(post.getImagePath());
		}
		return postDAO.deletePost(id, userId);
	}
	
	public int updatePost(int id, int userId, String content) {
		return postDAO.updatePost(id, userId, content);
		
	}
}


