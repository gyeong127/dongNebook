<%@page import="com.dongnebook.book.model.vo.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 a hh");
	
	Calendar cal = Calendar.getInstance();
	
	Date date = new Date();
	cal.setTime(date);
	cal.add(Calendar.DATE, +3);
	   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 대출</title>
<jsp:include page="/views/common/linkHead.jsp"/>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
<link rel="stylesheet" href="/css/rental/rentalLoc.css?v=<%=System.currentTimeMillis()%>">
</head>
<body>
	<jsp:include page="/views/common/header.jsp" />
	
	<h1 style="font-size:30px;">책 대출</h1>
	<hr>
	<form action="/insertBookRental.do" method="post">
		<table border=1>
			<tr>
				<th>책 번호</th><th>이미지</th><th>책이름</th><th>저자</th><th>수량</th><th>대출일자</th><th>반납일자</th>
			</tr>
			<c:forEach items="${rentalList }" var ="b"> 
			<tr>
				<td><input type="text" name="bookNo" value="${b.bookNo}" readonly></td><td><img src=${b.imageurl}></td><td>${b.bookName }</td><td>${b.bookWriter }</td><td>${b.bookCount}</td><td><%= sf.format(nowTime) %>시</td><td><%= sf.format(cal.getTime())%></td>	
			</tr>
			</c:forEach>
			
				<tr>
					<td colspan="6">상호대차 장소 검색</td>
					<td>
						<input type="button" class="goRentalLoc" value="검색">
					</td>
				</tr>
				<tr>
					<input type="text" name="placeName" value="${rentalLoc.placeName }">
					<input type="hidden" name="addr" value="${rentalLoc.addr }">
					<input type="hidden" name="phone" value="${rentalLoc.phone }">
				</tr>
			<tr>
				<td colspan="7"><input type="submit" value="대출하기"><input type="reset" value="취소하기"></td> 
			</tr>
		</table>
	</form>
	

		<input type="submit" id="goRentalLoc" value="검색" data-toggle="modal" data-target="#myModal" style="display:none">
	<!-- The Modal -->
               <div class="modal" id="myModal">
                 <div class="modal-dialog">
                   <div class="modal-content">
               
                     <!-- Modal Header -->
                     <div class="modal-header">
                       <h4 class="modal-title">Modal Heading</h4>
                       <button type="button" class="close" data-dismiss="modal">&times;</button>
                     </div>
               
                     <!-- Modal body -->
                     
                        <div class="modal-body">
                          <div class="loc-contents-frame">
       
					        <div class="loc-contents">
					        	<h3>상호대차 위치검색</h3>
					        	<hr>
					           <br>
					            <div class="loc-map">
					            	<div class="map_wrap">
									    <div id="map" style="width:100%;height:555px;position:relative;overflow:hidden;"></div>
									
									    <div id="menu_wrap" class="bg_white">
									        <div class="option">
									            <div>
					                <form onsubmit="searchPlaces(); return false;">
								                    키워드 : <input type="text"id="keyword" size="15"> 
								                    <button type="submit" class="search">검색하기</button> 
					                </form>
					            </div>
					        </div>
					        <hr>
					        <ul id="placesList"></ul>
					        <div id="pagination"></div>
					    </div>
					</div>
            </div>
            <div class="admin-explain">
            <form action="/mergeLoc.do">
            
	            <input type="text" class="loc-inform" name="placeName" id="loc-inform" readonly>
            	<input type="hidden" value="${rentalList }">
				<input type="hidden" id="loc-addr" name="addr">
				<input type="hidden" id="loc-phone" name="phone">
	            <button class="loc-inform-submit">확인</button>
            </form>
            </div>
        </div>
    </div>
                        </div>
                     <!-- Modal footer -->
                     <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">Submit</button>
                       <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                     </div>
                      </div>
                 </div>
               </div>
</body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d94e3fab43df95c64983cf272918d89e&libraries=services"></script>

<script type="text/javascript" src="/js/rental/rentalLoc.js?v=<%=System.currentTimeMillis()%>"></script>
<script>
$('.goRentalLoc').on('click', function() {
	  $('#goRentalLoc').trigger('click');
	});
</script>
</html>