<%@page import="kr.or.ddit.member.model.MemberVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/api/ibsheet8.jsp"%>
			
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->


<%
    	List<MemberVo> memberList = (List<MemberVo>) session.getAttribute("memberList");
%>    


<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="x-ua-compatible" content="ie=edge">

<title>회원 리스트</title>

<!-- Font Awesome Icons -->
<link rel="stylesheet" href="/sources/bootstrap/plugins/fontawesome-free/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="/sources/bootstrap/dist/css/adminlte.min.css">

<script>

function init(){
    //시트의 초기화 속성 설정
    var OPT = {
            Cols:[
                {Header: "부서", Name: "dept", Type: "Enum", Enum:setEnum('dept'), EnumKeys:setEnumKeys('dept') },
                {Header: "직급", Name: "pos", Type: "Enum", Enum:setEnum('position'), EnumKeys:setEnumKeys('position') }
            ]
        };	
    //초기 데이터 설정
    var DATA = [
        {'dept':'02','pos':'B0'},
        {'dept':'03','pos':'B1'},
    ];
	
    IBSheet.create({
        id: "sheet",        // 시트 객체 ID
        el: "sheetDiv",     // 시트를 생성할 DIV객체 ID
        options: OPT,       // 초기화 구문 변수
        data: DATA          // 초기 로딩 데이터
    });
}

$(document).ready(function(){
	init();
});

</script>

</head>
<body class="hold-transition sidebar-mini">
	<div class="wrapper">

		<!-- Navbar -->
		<nav class="main-header navbar navbar-expand navbar-white navbar-light">
			<!-- Left navbar links -->
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" data-widget="pushmenu" href="#"><i class="fas fa-bars"></i></a></li>
				<li class="nav-item d-none d-sm-inline-block"><a href="#" class="nav-link">HOME</a></li>
				<li class="nav-item d-none d-sm-inline-block"><a href="#;" class="nav-link">회원관리</a></li>
			</ul>
			
			<!-- SEARCH FORM -->
			<form class="form-inline ml-3">
				<div class="input-group input-group-sm">
					<input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
					<div class="input-group-append">
						<button class="btn btn-navbar" type="submit">
							<i class="fas fa-search"></i>
						</button>
					</div>
				</div>
			</form>
			
			<!-- Right navbar links -->
			<ul class="navbar-nav ml-auto">
				<!-- Messages Dropdown Menu -->
				<li class="nav-item dropdown"><a class="nav-link" data-toggle="dropdown" href="#"> <i class="far fa-comments"></i> <span class="badge badge-danger navbar-badge">3</span>
				</a>
					<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
						<a href="#" class="dropdown-item"> <!-- Message Start -->
							<div class="media">
								<img src="/sources/bootstrap/dist/img/user1-128x128.jpg" alt="User Avatar" class="img-size-50 mr-3 img-circle">
								<div class="media-body">
									<h3 class="dropdown-item-title">
										Brad Diesel <span class="float-right text-sm text-danger"><i class="fas fa-star"></i></span>
									</h3>
									<p class="text-sm">Call me whenever you can...</p>
									<p class="text-sm text-muted">
										<i class="far fa-clock mr-1"></i> 4 Hours Ago
									</p>
								</div>
							</div> <!-- Message End -->
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item"> <!-- Message Start -->
							<div class="media">
								<img src="/sources/bootstrap/dist/img/user8-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
								<div class="media-body">
									<h3 class="dropdown-item-title">
										John Pierce <span class="float-right text-sm text-muted"><i class="fas fa-star"></i></span>
									</h3>
									<p class="text-sm">I got your message bro</p>
									<p class="text-sm text-muted">
										<i class="far fa-clock mr-1"></i> 4 Hours Ago
									</p>
								</div>
							</div> <!-- Message End -->
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item"> <!-- Message Start -->
							<div class="media">
								<img src="/sources/bootstrap/dist/img/user3-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
								<div class="media-body">
									<h3 class="dropdown-item-title">
										Nora Silvester <span class="float-right text-sm text-warning"><i class="fas fa-star"></i></span>
									</h3>
									<p class="text-sm">The subject goes here</p>
									<p class="text-sm text-muted">
										<i class="far fa-clock mr-1"></i> 4 Hours Ago
									</p>
								</div>
							</div> <!-- Message End -->
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item dropdown-footer">See All Messages</a>
					</div></li>
				<!-- Notifications Dropdown Menu -->
				<li class="nav-item dropdown"><a class="nav-link" data-toggle="dropdown" href="#"> <i class="far fa-bell"></i> <span class="badge badge-warning navbar-badge">15</span>
				</a>
					<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
						<span class="dropdown-header">15 Notifications</span>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item"> <i class="fas fa-envelope mr-2"></i> 4 new messages <span class="float-right text-muted text-sm">3 mins</span>
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item"> <i class="fas fa-users mr-2"></i> 8 friend requests <span class="float-right text-muted text-sm">12 hours</span>
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item"> <i class="fas fa-file mr-2"></i> 3 new reports <span class="float-right text-muted text-sm">2 days</span>
						</a>
						<div class="dropdown-divider"></div>
						<a href="#" class="dropdown-item dropdown-footer">See All Notifications</a>
					</div></li>
				<li class="nav-item"><a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#"><i class="fas fa-th-large"></i></a></li>
			</ul>
		</nav>
		<!-- /.navbar -->


		<!-- Main Sidebar Container -->
		<aside class="main-sidebar sidebar-dark-primary elevation-4">
			<!-- Brand Logo -->
			<a href="/" class="brand-link"> <img src="/sources/images/line.png" class="brand-image img-circle elevation-3" style="opacity: .8"> <span
				class="brand-text font-weight-light">사용자관리</span>
			</a>

			<!-- Sidebar -->
			<div class="sidebar">
				<!-- Sidebar user panel (optional) -->
				<div class="user-panel mt-3 pb-3 mb-3 d-flex">
					<div class="image">
						<img src="/sources/profile/sally.png" class="img-circle elevation-2" alt="User Image">
					</div>
					<div class="info">
						<div class="row">
							<a class="col-md-8" href="#" class="d-block">[${S_MEMBER.userid},  ${sessionScope.alias}]</a>
						</div>
					</div>
				</div>

				<!-- Sidebar Menu -->
				<nav class="mt-2">
					<ul class="nav nav-pills nav-sidebar flex-column subMenuList" data-widget="treeview" data-accordion="false">

					</ul>
				</nav>
				<!-- /.sidebar-menu -->
			</div>

			<!-- /.sidebar -->
		</aside>


		<div id="if_list_div" style="position: relative; padding: 0; overflow: hidden; height: 750px;">
			<div class="content-wrapper" style="min-height: 584px;">
				<!-- Content Header (Page header) -->
				<section class="content-header">
					<div class="container-fluid">
						<div class="row md-2">
							<div class="col-sm-6">
								<h1>회원리스트</h1>
							</div>
							<div class="col-sm-6">
								<ol class="breadcrumb float-sm-right">
									<li class="breadcrumb-item">회원리스트</li>
									<li class="breadcrumb-item">목록</li>
								</ol>
							</div>
						</div>
					</div>
				</section>
				<!-- Main content -->
				<section class="content">													<!--    버 	튼 	등 	록   	 하 	는	 곳  -->
					<div class="card">
						<div class="card-header with-border">
							<a href="/memberRegist/view"><button type="button" class="btn btn-primary">회원등록</button></a>
							<a href="/APIview/googlemapview"><button type="button" class="btn btn-primary">구글지도</button></a>
							<a href="/APIview/navermapview"><button type="button" class="btn btn-primary">네이버지도</button></a>
							<a href="/APIview/chatbotview"><button type="button" class="btn btn-primary">챗봇</button></a>
							<div id="keyword" class="card-tools" style="width: 550px;">
								<div class="input-group row">
									<!-- sort num -->
									<select class="form-control col-md-3" name="perPageNum" id="perPageNum" onchange="if(this.value) location.href=(this.value);">
										<option value="">정렬개수</option>
										<option value="/memberList/process?ctgr_seq1=${ctgr_seq1}&pageSize=${3}">3</option>
										<option value="/memberList/process?ctgr_seq1=${ctgr_seq1}&pageSize=${5}">5</option>
										<option value="/memberList/process?ctgr_seq1=${ctgr_seq1}&pageSize=${7}">7</option>
											
									</select>
									<!-- search bar -->
									<select class="form-control col-md-3" name="searchType" id="searchType">
										<option value="">검색구분</option>
										<option value="i">아이디</option>
										<option value="n">이름</option>
										<option value="a">별명</option>
									</select> <input class="form-control" type="text" name="keyword" placeholder="검색어를 입력하세요." value=""> <span class="input-group-append">
										<button class="btn btn-primary" type="button" id="searchBtn" data-card-widget="search" onclick="searchList_go(1);">
											<i class="fa fa-fw fa-search"></i>
										</button>
									</span>
									<!-- end : search bar -->
								</div>
							</div>
						</div>
						<div class="card-body" style="text-align: center;">
							<div class="row">
								<div class="col-sm-12">
									<table class="table table-bordered">
										<tbody id="memberList">
										
											<c:forEach items="${memberList }" var="member">
												<tr data-userid="${member.userid }">
													<td>${member.userid }</td>
													<td>${member.usernm }</td>
													<td>${member.alias }</td>
													<td><fmt:formatDate value="${member.reg_dt }" pattern="yyyy-MM-dd" /></td>
												</tr>
											</c:forEach>
											
										</tbody>
									</table>
								</div>
								<!-- col-sm-12 -->
							</div>
							<!-- row -->
						</div>
						
						<!-- ibsheet -->
						<div id="sheetDiv" style="width:100%; height:200px;"></div>
							
						<!-- card-body -->
						<div class="card-footer">
							<nav aria-label="member list Navigation">
								<div class="text-center">
									<ul class="pagination justify-content-center m-0">
										<c:choose>
											<c:when test="${1 < page}">
												<li class="page-item"><a href="/memberList/process?page=1&ctgr_seq1=${ctgr_seq1}&pageSize=${pageSize}"><i class="fas fa-angle-double-left"></i></a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a href="/memberList/process?page=${page}&ctgr_seq1=${ctgr_seq1}&pageSize=${pageSize}"><i class="fas fa-angle-double-left"></i></a></li>
											</c:otherwise>
										</c:choose>	
										&nbsp;&nbsp;&nbsp;&nbsp;
										<c:choose>
											<c:when test="${1 < page}">
												<li class="page-item"><a href="/memberList/process?page=${page-1}&ctgr_seq1=${ctgr_seq1}&pageSize=${pageSize}"><i class="fas fa-angle-left"></i></a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a href="/memberList/process?page=${page}&ctgr_seq1=${ctgr_seq1}&pageSize=${pageSize}"><i class="fas fa-angle-left"></i></a></li>
											</c:otherwise>
										</c:choose>	
										&nbsp;&nbsp;&nbsp;&nbsp;
											<c:forEach var="i" begin="1" end="${pages }">
												<c:choose>
													<c:when test="${i == page}">
														<li class="page-item active"><a class="page-link" href="#">${i}</a></li>
													</c:when>
													<c:otherwise>
														<li class="page-item active"><a class="page-link" href="/memberList/process?page=${i}&ctgr_seq1=${ctgr_seq1}&pageSize=${pageSize}">${i}</a></li>
													</c:otherwise>
														  
												</c:choose>				
											</c:forEach>
										&nbsp;&nbsp;&nbsp;&nbsp;
										<c:choose>
											<c:when test="${page < pages}">
												<li class="page-item"><a href="/memberList/process?page=${page+1}&ctgr_seq1=${ctgr_seq1}&pageSize=${pageSize}"><i class="fas fa-angle-right"></i></a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a href="/memberList/process?page=${page}&ctgr_seq1=${ctgr_seq1}&pageSize=${pageSize}"><i class="fas fa-angle-right"></i></a></li>
											</c:otherwise>
										</c:choose>	
										&nbsp;&nbsp;&nbsp;&nbsp;
										<c:choose>
											<c:when test="${page < pages}">
												<li class="page-item"><a href="/memberList/process?page=${pages}&ctgr_seq1=${ctgr_seq1}&pageSize=${pageSize}"><i class="fas fa-angle-double-right"></i></a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a href="/memberList/process?page=${page}&ctgr_seq1=${ctgr_seq1}&pageSize=${pageSize}"><i class="fas fa-angle-double-right"></i></a></li>
											</c:otherwise>
										</c:choose>	
										
										
									</ul>
								</div>
							</nav>
							
						</div>
						<!-- card-footer -->
					</div>
					<!-- card  -->
				</section>
			</div>
		</div>
	</div>

	<!-- Main Footer -->
	<footer class="main-footer">
		<!-- To the right -->
		<div class="float-right d-none d-sm-inline">Anything you want</div>
		<!-- Default to the left -->
		<strong>Copyright &copy; 2014-2019 <a href="https://adminlte.io">AdminLTE.io</a>.
		</strong> All rights reserved.
	</footer>
	</div>
	<!-- ./wrapper -->

	<!-- REQUIRED SCRIPTS -->

	<!-- jQuery -->
	<script src="/sources/bootstrap/plugins/jquery/jquery.min.js"></script>

	<!-- Bootstrap 4 -->
	<script src="/sources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="/sources/bootstrap/dist/js/adminlte.min.js"></script>
	<script>
	$(document).ready(function(){
		$("#memberList tr").on("click", function(){
			// data-userid
			var userid = $(this).data("userid");
			console.log("userid : " + userid);
			
			document.location="/member/process?userid=" + userid;
		})
	})
	  
	</script>

</body>
</html>







