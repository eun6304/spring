package kr.smhrd.mapper;

import java.util.List;

//1. Mapper interface + Mapper file(SQL)
//2. Mapper interface + @어노테이션
/*3. Mapper interface (Spring JPA 제공해주는 interface + JPA Method(SQL 대신, findAll, findByOne,
save, delete)*/
public interface BoardMapper { // root-context.xml -> DB연결
	
	// @Select("select * from tbl_board")
	public List<BoardVO> boardList(); //추상메서드
	public List<BoardVO> boardListAjax();
	public void boardInsert(BoardVO vo);
	public BoardVO boardContent(int idx);
	public void boardDelete(int idx);
	public void boardUpdate(BoardVO vo);

}
