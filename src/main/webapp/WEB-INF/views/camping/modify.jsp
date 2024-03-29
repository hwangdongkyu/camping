<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정처리 글쓰기</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<form role="form" action="/camping/modify" method="post">
    <div class="form-group">
        <label>게시물 번호</label>
        <input class="form-control" name='board_no' value='<c:out value="${camping.board_no}"/>' readonly="readonly">
    </div>
    <div class="form-group">
        <label>제목</label>
        <input class="form-control" name='board_title' value='<c:out value="${camping.board_title}"/>'>
    </div>
    <div class="form-group">
        <label>내용</label>
        <textarea class="form-control" rows="3" name='board_content'><c:out value="${camping.board_content}"/></textarea>
    </div>
    <div class="form-group">
        <label>작성일</label>
        <input class="form-control" name='board_date' value='<fmt:formatDate pattern="yyyy-MM-dd" value="${camping.board_date}"/>' readonly="readonly">
    </div>
    <div class="form-group">
        <label>최종 수정일</label>
        <input class="form-control" name='board_updateDate' value='<fmt:formatDate pattern="yyyy-MM-dd" value="${camping.board_updateDate}"/>' readonly="readonly">
    </div>
    <div class="form-group">
        <label>작성자</label>
        <input class="form-control" name='mem_id' value='<c:out value="${camping.mem_id}"/>' readonly="readonly">
    </div>
    <button type="submit" data-oper='modify' class="btn btn-default">수정</button>
</form>
<form action="/camping/remove" method="get">
	<input type="hidden" name="board_no" value="${camping.board_no}">
	<button type="submit" data-oper='delete' class="btn btn-danger">삭제</button>
</form>
<%@ include file="../includes/footer.jsp" %>

<script>
    // 수정 버튼 클릭 시 모달 표시 및 폼 채우기
    const editButton = document.getElementById("editButton");
    const editForm = document.getElementById("editForm");
    const editBoardNo = document.getElementById("editBoardNo");

    editButton.addEventListener("click", function() {
        // 모달 표시
        const modal = document.getElementById("myModal");
        modal.style.display = "block";

        // 폼 채우기
        const modalTitle = document.getElementById("modal-title");
        const modalContent = document.getElementById("modal-content");
        const modalDate = document.getElementById("modal-date");
        const modalHit = document.getElementById("modal-hit");
        const modalMemId = document.getElementById("modal-mem-id");

        // 여기서 선택한 게시물의 정보를 가져와서 모달에 채웁니다.
        const selectedBoardNo = this.getAttribute("data-board-no"); // 선택한 게시물 번호
        const selectedBoardTitle = ""; // 선택한 게시물 제목
        const selectedBoardContent = ""; // 선택한 게시물 내용
        const selectedBoardDate = ""; // 선택한 게시물 작성일
        const selectedBoardHit = ""; // 선택한 게시물 조회수
        const selectedBoardMemId = ""; // 선택한 게시물 작성자

        modalTitle.textContent = selectedBoardTitle;
        modalContent.textContent = selectedBoardContent;
        modalDate.textContent = selectedBoardDate;
        modalHit.textContent = selectedBoardHit;
        modalMemId.textContent = selectedBoardMemId;

        // 수정할 게시물 번호를 폼에 설정
        editBoardNo.value = selectedBoardNo;
    });

    // 모달 닫기 버튼
<%@ include file="../includes/footer.jsp" %>