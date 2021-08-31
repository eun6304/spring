package kr.smhrd.board;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.smhrd.mapper.BoardMapper;
import kr.smhrd.mapper.BoardVO;

@Controller
public class BoardController { // POJO > new BoardController();
	
	@Autowired // DI
	private BoardMapper boardMapper;
	// 게시판 데이터를 MySQL -> 테이블(tbl_board)에서 가져오기
	// 요청 -> 메서드 : HandlerMapping
	@RequestMapping("/boardList.do")
	public String boardList(HttpServletRequest request) {
		// DAO 를 연결해서 게시판리스트를 가져오기
		List<BoardVO> list = boardMapper.boardList();
		// list를 View(JSP) 에게 넘겨줘야 한다.
		request.setAttribute("list", list);
		return "list"; // list.jsp
	}
	@RequestMapping("/boardListAjax.do")
		public @ResponseBody List<BoardVO> boardListAjax() {
			// DAO 를 연결해서 게시판리스트를 가져오기
			List<BoardVO> list = boardMapper.boardListAjax();
			return list; //list -> JSON 포맷으로 변경시켜야 함
	}
	@RequestMapping("/boardInsertForm.do")
	public String boardInsertForm() {
		return "boardInsertForm"; //WEB-INF/views/boardInsertForm.jsp
	}
	@RequestMapping("/boardInsert.do")
	// 파라메터수집(title,contents,writer) => BoardVO -> new BoardVO()
	public String boardInsert(BoardVO vo) {
		boardMapper.boardInsert(vo);
		return "redirect:/boardList.do";
	}
	@GetMapping("/boardContent.do")
	public String boardContent(@RequestParam("idx") int idx, Model model) {
		BoardVO vo = boardMapper.boardContent(idx);
		model.addAttribute("vo", vo);
		return "boardContent"; // boardContent.jsp
	}
	@RequestMapping("/boardDelete.do")
	public String boardDelete(int idx) {
		boardMapper.boardDelete(idx);
		return "redirect:/boardList.do";
	}
	@RequestMapping("/boardUpdate.do")
	public String boardUpdate(BoardVO vo) {
		boardMapper.boardUpdate(vo);
		return "redirect:/boardList.do";
	}
	
}
