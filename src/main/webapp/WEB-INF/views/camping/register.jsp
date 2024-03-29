<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판 글쓰기</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">글쓰기</h1>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <form role="form" action="/camping/register" method="post">
                        <div class="form-group">
                            <label for="title">제목</label>
                            <input type="text" class="form-control" id="board_title" name="board_title">
                        </div>
                        <div class="form-group">
                            <label for="content">내용</label>
                            <textarea class="form-control" id="board_content" rows="5" name='board_content'></textarea>
                        </div>
                        <div class="form-group">
                            <label for="writer">작성자</label>
                            <input type="text" class="form-control" id="mem_id" name='mem_id'>
                        </div>
                        <button type="submit" class="btn btn-primary">저장</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>

<div class="container">
    <div class="row">
        <div class="col-lg-6 offset-lg-6 col-md-6 offset-md-6 col-sm-6 offset-sm-6 col-6 offset-6">
            <a href="/camping/list" class="btn btn-primary btn-block text-ellipsis">문의 게시판 돌아가기</a>
        </div>
    </div>
</div>

<style>
    /* 버튼 텍스트 길이에 따라 크기 조정 */
    .text-ellipsis {
        display: inline-block;
        width: 100%;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }
</style>

<%@ include file="../includes/footer.jsp" %>