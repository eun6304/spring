<%@page import="kr.smhrd.mapper.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BoardVO vo = (BoardVO)request.getAttribute("vo");
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
  <script>
  	function goDel(idx){
  		//삭제요청(boardDelete.do)
  		location.href = "boardDelete.do?idx="+idx;
  	}
  	function goList(){
  		location.href = "boardList.do";
  	}
  </script>
</head>
<body>
 
<div class="container">
  <h2>Spring MVC BOARD</h2>
  <div class="panel panel-default">
    <div class="panel-heading">BOARD VIEW</div>
    <div class="panel-body">
    	<form action="boardUpdate.do?idx=<%=vo.getIdx() %>" method="post">
    	<input type="hidden" name="idx" value="<%=vo.getIdx() %>">
    	<table class="table">
    		<tr>
    			<td>번호</td>
    			<td><%=vo.getIdx() %></td>
   			</tr>
   			<tr>
   				<td>제목</td>
    			<td><input class="form-control" type="text" name="title" value="<%=vo.getTitle() %>"></td>
    		
    		</tr>
    		<tr>
    			<td>내용</td>
    			<td><textarea class="form-control" rows="5" name="contents"><%=vo.getContents() %></textarea></td>
    		</tr>
    		<tr>
   				<td>작성자</td>
    			<td><%=vo.getWriter() %></td>
    		</tr>
    		<tr>
    			<td colspan="2" align="center">
					<button type="submit" class="btn btn-primary btn-sm">수정</button>
					<button type="reset" class="btn btn-success btn-sm">취소</button>
					<button type="button" class="btn btn-warning btn-sm" onclick="goDel(<%=vo.getIdx()%>)">삭제</button>
					<button type="button" class="btn btn-info btn-sm" onclick="goList()">목록</button>
    	</table>
    	</form>
    </div>
    <div class="panel-footer">빅데이터-5차(백은서)</div>
  </div>
</div>

</body>
</html>