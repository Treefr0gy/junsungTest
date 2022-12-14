<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style>
body{
	width: 1100px;
	margin: 0px auto;
}
img{
	width: 180px;
	height: 230px;
}
#image{
	float: left;
	width: 250px;
}
#menu ul{
	display: table;
 	margin-left: auto;
 	margin-right: auto;
}
#menu li{
	list-style-type: none;
	float: left;
	margin-left: 20px;
}
dl{
	
	font-weight: bold;
}
dt{
	float: left;
}
a:visited, a{
	color: black;
}
#chart li{
	list-style-type: none;
	float: left;
}
</style>
<script src="js/httpRequest.js"></script>
<script>
function show(num){
	const urlParams = new URL(location.href).searchParams;
	const mov_idx = urlParams.get('mov_idx');
	if(num==0){
		location.href='detailView.do?mov_idx='+mov_idx+'&show=0';
	}else if(num==1){
		location.href='detailView.do?mov_idx='+mov_idx+'&show=1';
	}else{
		location.href='detailView.do?mov_idx='+mov_idx+'&show=2';
	}
}
</script>
</head>
<body onload="document.querySelector(`.star2 span`).style.width = document.getElementById('range').value * 10+'%';document.getElementById('score2').value=document.getElementById('range').value;">
<c:import url="../header.jsp"/>
<br>
<div class="sect-base-movie">
	<c:forEach var="list" items="${list }">
    <div id="image">
        <a href="/movieJoa/imgmovie/${list.mov_poster }" title="포스터 크게 보기 새창" target="_blank">
            <span class="thumb-image"> 
                <img src="/movieJoa/imgmovie/${list.mov_poster }">
            </span> 
        </a> 
    </div>
    <div class="box-contents">
        <div class="title"> 
            <strong>${list.mov_title }</strong>
        </div>
        <div class="score"> 
            <strong class="percent">예매율&nbsp;<span>${list.mov_booking_percent }</span></strong>
            <div class='egg-gage small'>
	            <strong><span class='percent'>관람평&nbsp;
		            <c:if test="${list.mov_score!=0.0 }">
						${list.mov_score }
		            </c:if>
		            <c:if test="${list.mov_score==0.0 }">
						?
		            </c:if>
	            </span></strong>
            </div>
        </div>
        <div class="spec">
            <dl>
            	<dt>감독 :&nbsp;</dt>
            	<dd>${list.mov_director }</dd>
            	<dt>출연 :&nbsp;</dt>
            	<dd>${list.mov_cast }</dd>
                <dt>장르 :&nbsp;</dt> 
                <dd>${list.mov_genre }</dd>
                <dt>기본 :&nbsp;</dt>
                <dd class="on">${list.mov_rate },&nbsp;${list.mov_running_time }분,&nbsp;${list.mov_country }</dd>
                <dt>개봉 :&nbsp;</dt>
                <dd class="on">
				<c:set var="mov_start_date" value="${list.mov_start_date }"/>
		       	${fn:substring(mov_start_date,0,10) }</dd>
            </dl>
        </div>
        <div>
	        <span class="like">
	            <a class="link-reservation" href="/ticket/?MOVIE_CD=20030711&MOVIE_CD_GROUP=20030711">예매하기</a> 
	        </span>
        </div>
    </div>
    </c:forEach>
</div>
<div id="menu">
	<ul id="tabMenu">
		<li class="on"><a onclick="show(0)">주요정보</a></li>
		<li><a onclick="show(1)">평점/리뷰</a></li>               
		<li class="last"><a onclick="show(2)">상영시간표</a></li>
	</ul>
</div>
<div id="show" style="clear:both;">
	<c:choose>
		<c:when test="${param.show eq 0 }">
			<c:import url="joaMovie_info.jsp"/>
		</c:when>
		<c:when test="${param.show eq 1 }">
			<c:import url="/commentReg.do"/>
		</c:when>
		<c:when test="${param.show eq 2 }">
			<c:import url="joaMovie_showTime.jsp"/>
		</c:when>
	</c:choose>
</div>
<c:import url="../footer.jsp"/>
</body>
</html>