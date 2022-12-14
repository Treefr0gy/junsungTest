<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 목록</title>
<link rel="stylesheet" type="text/css" href="css/main_admin.css">
<link rel="stylesheet" type="text/css" href="css/adminMovie.css">
<link rel="stylesheet" type="text/css" href="css/adminMovie_list.css">
<script>
function deleteEvent(didx){
	   var delQue = window.confirm('삭제한 이벤트 정보는 복구할 수 없습니다. 정말 삭제하시겠습니까?');
	   	if(!delQue){ return; } 
	   window.location.href = 'deleteEvent.do?eve_idx='+didx;
	}
</script>
</head>
<body>
<c:import url="../../header_admin.jsp"></c:import>
<div class="mainBox">
<div class="div_title"><h2 class="title">| 이벤트 관리 / 이벤트 목록</h2></div>
<div class="table_wrap_list">
<fieldset class="search_wrap">
	<form>
		<select name="sc_t">
			<option value="제목" selected>제목</option>
			<option value="유형">유형</option>
		</select>
		<input type="text" name="sc_k" class="input_text_search" placeholder="검색어를 입력해주세요.">
		<button type="submit" class="button_main">검색</button>
	</form>
</fieldset>
<table class="main_table_list">
<colgroup>
	<col style="width:10%">
	<col style="wldth:16%">
	<col style="width:24%">
	<col style="width:20%">
	<col style="width:15%">
	<col style="width:15%">
</colgroup>
<thead>
<tr>
	<th scope="col" class="text_c">코드</th>
	<th scope="col" class="text_c">유형</th>
	<th scope="col" class="text_c">제목</th>
	<th scope="col" class="text_c">이벤트 기간</th>
	<th scope="col" class="text_c">상태</th>
	<th scope="col" class="text_c">관리 메뉴</th>
</tr>
</thead>

	<c:if test="${empty eventList}">
		<tr>
			<td colspan="7">등록되어있는 이벤트가 존재하지 않습니다.</td>
		</tr>
	</c:if>

<tbody>
	<c:forEach var="dto" items="${eventList }">
	<c:url var="detail" value="detailEvent.do">
			<c:param name="eve_idx">${dto.eve_idx }</c:param>
	</c:url>
	<tr>
		<td class="text_c">${dto.eve_idx }</td>
		<td class="text_c">${dto.eve_category }</td>
		<td class="text_c"><a href="${detail}">${dto.eve_subject }</a></td>
		<td class="text_c">${dto.eve_start_date }<br>- ${dto.eve_end_date }</td>
		<td class="text_c">${dto.eve_status }</td>
		
		<c:url var="uLink" value="updateEventForm.do">
			<c:param name="eve_idx">${dto.eve_idx }</c:param>
		</c:url>
		<td class="text_c"><input type="button" value="수정" onclick="location.href='${uLink}'" class="list_s_btn up"><br>
						   <input type="button" value="삭제" onclick="javascript:deleteEvent(${dto.eve_idx });" class="list_s_btn"></td>
	</tr>
	</c:forEach>
</tbody>

<tfoot>
	<tr>
	<td colspan="5" align="center">
	${pageStr }
	</td>
	<td colspan="2"><a href="addEventForm.do">새 이벤트 등록</a></td>
	</tr>
</tfoot>
</table>
</div>
</div>
<c:import url="../../footer.jsp"></c:import>
</body>
</html>