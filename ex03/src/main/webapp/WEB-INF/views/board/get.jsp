5<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>SB Admin 2 - Bootstrap Admin Theme</title>

<!-- Bootstrap Core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="/resources/vendor/metisMenu/metisMenu.min.css"
	rel="stylesheet">

<!-- DataTables CSS -->
<link
	href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css"
	rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link
	href="/resources/vendor/datatables-responsive/dataTables.responsive.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="/resources/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Board Read</h1>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">


				<div class="panel-heading">Board Read Page</div>

				<div class="panel-body">
					<div class="form-group">
						<label>Bno</label> <input class="form-control" name="bno"
							value='<c:out value="${board.bno }"/>' readonly="readonly">
					</div>

					<div class="form-group">
						<label>Title</label> <input class="form-control" name="title"
							value='<c:out value="${board.title }"/>' readonly="readonly">
					</div>

					<div class="form-group">
						<label>Text area</label>
						<textarea class="form-control" rows="3" name="content"
							readonly="readonly">
						<c:out value="${board.content }" /> </textarea>
					</div>

					<div class="form-group">
						<label>Writer</label> <input class="form-control" name="writer"
							value='<c:out value="${board.writer }"/>' readonly="readonly">
					</div>

					<button data-oper='modify' class="btn btn-default"
						onclick="location.href='/board/modify?bno=<c:out value="${board.bno }"/>'">Modify</button>
					<button data-oper='list' class="btn btn-info"
						onclick="location.href='/board/list'">List</button>

					<form id="operForm" action="/board/modify" method="get">
						<input type="hidden" id="bno" name="bno"
							value='<c:out value="${board.bno }"/>'> <input
							type="hidden" name="pageNum"
							value='<c:out value="${cri.pageNum }"/>'> <input
							type="hidden" name="amount"
							value='<c:out value="${cri.amount }"/>'> <input
							type="hidden" name="type" value='<c:out value="${cri.type }"/>'>
						<input type="hidden" name="keyword"
							value='<c:out value="${cri.keyword }"/>'>
					</form>
				</div>

			</div>
		</div>
	</div>

	<div class="row">

		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<i class="fa fa-comments fa-fw"></i> Reply
				</div>

				<div class="panel-body">
					<ul class="chat">
						<li class="left clearfix" data-rno='12'>
							<div>
								<div class="header">
									<strong class="primary-font">user00</strong> <small
										class="pull-right text-muted">2021-11-28 12:20</small>
								</div>
								<p>Good job!</p>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>


	<%@include file="../includes/footer.jsp"%>

	<script type="text/javascript" src="/resources/js/reply.js"></script>
	
	<script type="text/javascript">
	
		$(document).ready(function () {
			
			var bnoValue = '<c:out value="${board.bno}"/>';
			var replyUL = $(".chat");
			
			showList(1)
			
			function showList(page) {
				replyService.getList({bno : bnoValue, page : page || 1}, function (list) {
					var str = "";
					if(list == null || list.length ==0 ){
						replyUL.html("");
						return;
					}
					for(var i=0, len = list.length || 0; i<len; i++){
						str +="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
						str +="<div><div class='header'><strong class='primary-font'>"+list[i].replyer+"</strong>";
						str +="<small class='pull-right text-muted'>"+list[i].replyDate+"</small></div>";
						str += "<p>"+list[i].reply+"</p></div></li>";
					}
					
					replyUL.html(str);
				});
			}
		});
	
	</script>

	<!-- <script type="text/javascript">
		console.log("-----");
		console.log("Js Test");

		var bnoValue = '<c:out value="${board.bno}"/>';
		replyService.add({
			reply : "Js Test",
			replyer : "tester",
			bno : bnoValue
		}, function(result) {
			alert("Result : " + result);
		});

		replyService.getList({
			bno : bnoValue,
			page : 1
		}, function(list) {
			for (var i = 0, len = list.length || 0; i < len; i++) {
				console.log(list[i]);
			}
		});

		//5767247 댓글 삭제 테스트

		replyService.remove(6, function(count) {
			console.log(count);

			if (count === "success") {
				alert("REMOVED");
			}
		}, function(err) {
			alert("ERROR...");
		});

		// 2번 댓글 수정
		replyService.update({
			rno : 22,
			bno : bnoValue,
			reply : "Modified Reply..."
		}, function(result) {
			alert("수정 완료");
		});

		replyService.get(10, function(data) {
			console.log(data);
		});
	</script>
 -->
	<script type="text/javascript">
		$(document).ready(function() {
			var operForm = $("#operForm");

			$("button[data-oper='modify']").on("click", function(e) {

				operForm.attr("action", "/board/modify").submit();
			});

			$("button[data-oper='list']").on("click", function(e) {
				operForm.find("#bno").remove();
				operForm.attr("action", "/board/list")
				operFrom.submit();

			});
		});
	</script>
</body>
</html>