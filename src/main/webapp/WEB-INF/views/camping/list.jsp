<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd>
<html><head><meta charset="UTF-8">
   <title>문의 게시판</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            width: 80%;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
        /* 모달 스타일 */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.4);
        }
        .modal-content {
            background-color: #fefefe;
            margin: 10% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
        }
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>문의 게시판</h1>
    
    <!-- 게시물 목록 테이블 -->
    <table>
        <thead>
            <tr>
                <th>게시물 번호</th>
                <th>제목</th>             
                <th>작성일</th>	 
                <th>최종 수정일</th>
                <th>조회수</th>
                <th>작성자</th>
            </tr>
        </thead>  	
        <tbody>
        
         <c:forEach items="${list}" var="camping">
                <tr>
                    <td><c:out value="${camping.board_no}"/></td>
                    <td><c:out value="${camping.board_title}"/></td>              
                    <td style="display: none;"><c:out value="${camping.board_content}"/></td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd"
                    value="${camping.board_date}"/></td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd"
                    value="${camping.board_updateDate}"/></td>
                    <td><c:out value="${camping.board_hit}"/></td>
                    <td><c:out value="${camping.mem_id}"/></td>
                </tr>
            </c:forEach>

            <!-- 추가적인 게시물은 여기에 추가 -->
        </tbody>
    </table>
</div>

<!-- 모달 -->
<div id="myModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <h2 id="modal-title"></h2>
        <p id="modal-content"></p>
        <p id="modal-date"></p>
        <p id="modal-hit"></p>
        <p id="modal-mem-id"></p>
        <!-- 수정하기 버튼 -->
        <button id="editButton" class="edit-button">수정하기</button>
    </div>
</div>

<div class="container">
    <div class="row">
        <div class="col-lg-6 offset-lg-6 col-md-6 offset-md-6 col-sm-6 offset-sm-6 col-6 offset-6">
            <a href="/camping/register" class="btn btn-primary btn-block">글쓰기</a>
        </div>
    </div>
</div>

<%@ include file="../includes/footer.jsp" %>

<style>
    /* 수정하기 버튼 스타일 */
    .edit-button {
        float: right; /* 우측으로 이동 */
        font-size: smaller; /* 작은 글꼴 크기 */
        margin-top: 5px; /* 상단 여백 추가 */
    }
</style>

<script>
    // 모달 열기 함수
    function openModal(board) {
        const modal = document.getElementById("myModal");
        const modalTitle = document.getElementById("modal-title");
        const modalContent = document.getElementById("modal-content");
        const modalDate = document.getElementById("modal-date");
        const modalHit = document.getElementById("modal-hit");
        const modalMemId = document.getElementById("modal-mem-id");
		const modalNo = document.getElementById("modal-no");

        modal.style.display = "block";
        modalTitle.textContent = board.querySelector('td:nth-child(2)').textContent; // 제목 가져오기
        modalContent.textContent = board.querySelector('td:nth-child(3)').textContent; // 내용 가져오기
        modalDate.textContent = "작성일: " + board.querySelector('td:nth-child(4)').textContent; // 작성일 가져오기
        modalHit.textContent = "조회수: " + board.querySelector('td:nth-child(5)').textContent; // 조회수 가져오기
        modalMemId.textContent = "작성자: " + board.querySelector('td:nth-child(7)').textContent; // 작성자 가져오기

        // 수정하기 버튼 클릭 시 이동
        const editButton = document.getElementById("editButton");
        editButton.addEventListener("click", function() {
            // 현재 선택된 게시물의 번호를 가져옴 (예시로 board_no라 가정)
            const boardNo = board.querySelector('td:nth-child(1)').textContent;
            // 수정 페이지로 이동
            window.location.href = "/camping/modify?board_no=" + boardNo;
        });

        // 모달 닫기 버튼 이벤트 처리
        const span = document.getElementsByClassName("close")[0];
        span.onclick = function() {
            modal.style.display = "none";
        }
    }

    // 페이지 로드 시 모든 게시물에 클릭 이벤트 추가
    const boardRows = document.querySelectorAll("tbody tr");
    boardRows.forEach(row => {
        row.addEventListener("click", function(event) {
            const board = this;
            openModal(board);
        });
    });

    // 모달 창 바깥 영역 클릭 시 모달 창 닫기
    window.onclick = function(event) {
        const modal = document.getElementById("myModal");
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
</script>

</body>
</html>   