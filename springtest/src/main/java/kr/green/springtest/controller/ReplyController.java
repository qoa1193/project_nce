package kr.green.springtest.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.web.bind.annotation.*;

import kr.green.springtest.pagination.Criteria;
import kr.green.springtest.pagination.PageMaker;
import kr.green.springtest.service.*;
import kr.green.springtest.vo.MemberVO;
import kr.green.springtest.vo.ReplyVO;
import lombok.*;

@RestController
@AllArgsConstructor
public class ReplyController {
/*
 * 컨트롤러로하면 일반 url이 왔을때 화면정보를 이용해서 화면에 뿌려줄 수 있음
 * 앞에 rest를 붙이면 리턴이 데이터를 리턴하는것(실제 데이터를)
 * ->안에있는애들 리스폰스~(@ResponseBody 등등) 안붙여도 쓸수 있음
 * 
 * 모든 댓글을 에이젝스로 처리할 것이기 때문에 그냥 @RestController로 하겠음
 * 안에 오토와일드로 하던가 아니면 컨트롤러에 @AllArgsConstructor(모든 맴버변수의 생성자) 어노테이션 해주던가(이게 더 편함)
 * 
 * 에러:
 * 디펜던시 어노테이션 오류 : 연결했을때 뭔가 잘못되어있으면 뜸(서비스임플에서 서비스어노테이션 삭제했을때) 아래 변수선언 없애면 안뜸 왜?
 * 밑에서 객체 생성하면오류남(인터페이스는 객체를 생성할수없음 = new ReplyService(); ? x 
 * 구현클래스로는 만드는거 가능 = ReplyServiceImp) -> 이 역할하는게 서비스임플에서의 서비스 어노테이션
 * 
 * */
	
	private ReplyService replyService;
	
	@PostMapping("reply/ins")
	public String replyInsPost(@RequestBody ReplyVO rvo) {
		//System.out.println(rvo);
		return replyService.insertReply(rvo) == 0? "FAIL" : "OK";
		
	}
	@GetMapping("reply/list/{num}/{page}")
	public HashMap<String, Object> replyListGet(@PathVariable("num") int num, @PathVariable("page") int page) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		Criteria cri = new Criteria(page, 2);
		int totalCount = replyService.getTotalCount(num);
		PageMaker pm = new PageMaker(totalCount, 1, cri);
		//2.System.out.println(pm);
		ArrayList<ReplyVO> list = replyService.getReplyList(num, cri);
		//1.System.out.println(list);
		
		map.put("replyList", list);
		map.put("pm", pm);//2번째
		return map;
		
	}
	@PostMapping("reply/mod")
	public String replyModPost(@RequestBody ReplyVO reply) {
		//System.out.println(reply);
		return replyService.updateReply(reply);		
	}
	@PostMapping("reply/del")
	public String replyDelPost(@RequestBody ReplyVO reply) {
		//System.out.println(reply);
		//return reply.toString();	
		return replyService.deleteReply(reply);
	}
	
}
