<%@page import="kr.smhrd.mapper.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<BoardVO> list = (List<BoardVO>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  	function goWriter(){
  		//글쓰기 화면
  		location.href="boardInsertForm.do";
  	}
  	function goJSON(){
  		// 서버와 통신 -> Ajax(jQuery->jquery.com) -> boardListAjax.do
  		$.ajax({
  			url : "boardListAjax.do",
  			type : "get",
  			//data : {}
  			dataType : "json",//[{   }, {   }, {   },,,,,]
  			success : resultHtml, // 직접 만드는 callBack 함수
  			error : function(){alert("error");  }
  		});
  	}
  	function resultHtml(data){
  		var view = "<table class = 'table'>";
  		view += "<tr>";
  		view += "<td>번호</td>";
  		view += "<td>내용</td>";
  		view += "<td>조회수</td>";
  		view += "<td>작성자</td>";
  		view += "<td>작성일</td>";
  	 	view += "</tr>";
  	 	
  	 	$.each(data, function(index, obj){
  	 		view += "<tr>";
  	  		view += "<td>"+obj.idx+"</td>";
  	  		view += "<td>"+obj.title+"</td>";
  	  		view += "<td>"+obj.count+"</td>";
  	  		view += "<td>"+obj.writer+"</td>";
  	  		view += "<td>"+obj.indate+"</td>";
  	  	 	view += "</tr>";
  	 	})
  	 	
  	 	view += "</table>"
  		$("#list").html(view);
  	}
  </script>

</head>
<body>
 
<div class="container">
  <h2>Spring MVC BOARD</h2>
  <div class="panel panel-default">
    <div class="panel-heading">BOARD LIST</div>
    <div class="panel-body">
		<table class="table">
			<tr>
			<td>번호</td>
			<td>제목</td>
			<td>조회수</td>
			<td>작성자</td>
			<td>작성일</td>
			</tr>
			<%
				for(BoardVO vo : list) {
			%>
			<tr>
			<td><%=vo.getIdx()%></td>
			<td><a href = "boardContent.do?idx=<%=vo.getIdx() %>"><%=vo.getTitle()%></a></td>
			<td><%=vo.getCount() %></td>
			<td><%=vo.getWriter() %></td>
			<td><%=vo.getIndate() %></td>
			</tr>
			<%} %>
		</table>
		<button class="btn btn-primary btn-sm" onclick="goWriter()">글쓰기</button><br><br>
		<button class="btn btn-info btn-sm" onclick="goJSON()">JSON으로 게시판 가져오기</button>
		<div id="list">여기에 게시판을 출력하시오</div>
	</div>
    <div class="panel-footer">빅데이터5차-백은서</div>
  </div>
</div>

</body>
</html>
    