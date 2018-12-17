<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="paging" type="com.company.dts.common.Paging" %>
<%@ attribute name="jsFunc" required="false" type="java.lang.String" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
	.pagination {
	  display: inline-block;
	}
	
	.pagination a {
	  color: black;
	  float: left;
	  padding: 8px 16px;
	  text-decoration: none;
	}
	
	.pagination a.active {
	  background-color: #4CAF50;
	  color: white;
	  border-radius: 5px;
	}
	
	.pagination a:hover:not(.active) {
	  background-color: #ddd;
	  border-radius: 5px;
	}
</style>

<div class="pagination">
<c:if test="${empty jsFunc}"> 
	<c:set var="jsFunc" value="go_page"></c:set>
</c:if>


<a href="#" >&laquo;</a>
<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i">
	
	<c:if test="${i != paging.page}">
		<a href="#" onclick="${jsFunc}(${i})">${i}</a>
	</c:if>
	<c:if test="${i == paging.page}">
		<a href="#" class="active">${i}</a>
	</c:if>
</c:forEach>

<a href="#">&raquo;</a>

</div>