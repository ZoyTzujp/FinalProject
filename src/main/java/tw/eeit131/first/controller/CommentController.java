package tw.eeit131.first.controller;

import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.eeit131.first.model.Artical;
import tw.eeit131.first.model.Comment;
import tw.eeit131.first.service.ArticalService;
import tw.eeit131.first.service.CommentService;

@Controller
public class CommentController {
	
	@Autowired
	CommentService commentService;
	
	@Autowired
	ArticalService articalservice;
	
	@Autowired
	EntityManager e;
	
	@PostMapping(value="/comment/findby" , produces = { "application/json; charset=UTF-8" })
	public @ResponseBody List<Comment> findCommentById(
			@RequestParam(value = "articalID") Integer id
			) {
		System.err.println("id======="+id);
//		articalId = 4;
		List<Comment> comment = commentService.findCommentByArticalId(id);		
		System.out.println("String="+comment);
		
		return comment;
	}
	
	@PostMapping("/comment/save/{id}")
	public @ResponseBody List<Comment> saveCommentByArticalId(
		
		@RequestParam(value="content", defaultValue = "(未輸入)") String content,
		@PathVariable("id") Integer articalId 
			){
		System.err.println("content==="+content);
		System.err.println("articalId==="+articalId);
		Integer memberID = 2;
		
		Artical artical = articalservice.selectById(articalId);
		Comment c = new Comment();
		c.setArtical(artical);
		c.setContent(content);
		c.setMemberID(memberID);
		commentService.saveComment(c);
		
		List<Comment> comment = commentService.findCommentByArticalId(articalId);		
		System.err.println("id======="+articalId );
		System.out.println(comment);
		
		return comment;

	}
	
}
