package kr.smhrd.mapper;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

//게시판 1개의 구조 설계 (Modeling)
@Data
@NoArgsConstructor // 디폴트클래스
@AllArgsConstructor // 인자 들어있는 클래스
@RequiredArgsConstructor
public class BoardVO {
	// property(프로퍼티) : 멤버 변수를 부르는 이름
	
	@NonNull
	private int idx; //번호
	private String title; //제목
	private String contents; //내용
	private int count; //조회수
	private String writer; //작성자
	private String indate; //작성일
	
	// 생성자, getter, setter 만들지 x
}
