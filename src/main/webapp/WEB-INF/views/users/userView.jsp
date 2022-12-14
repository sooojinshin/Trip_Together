<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="${url}/css/users/userView.css" type="text/css">
<link rel="stylesheet" href="${url}/css/main/main.css" type="text/css">
<script src="${url}/js/users/userView.js"></script>
<script src="${url}/js/underBar.js"></script>
<script src="${url}/js/main/main.js"></script>
<script>
//var postCtn = ${pList}.length;

//console.log(postCnt);
/* 220420 지연님 추가 */
//팔로우 기능
function follow(obj, fid){
	console.log("aaaa");
	var btText=$(obj).text().trim();
	console.log(btText);
	if(btText=='팔로우');
		$.ajax({
			type:'post',
			url:'/follow/'+fid,
			success:function(res){
				$(obj).text('언팔로우');
			}
		})
	}else if(btText=="언팔로우"){
		$.ajax({
			type:'post',
			url:'/unfollow/'+fid,
			success:function(res){
				$(obj).text('팔로우');
			}
		});
	}
}
</script>

<div class="opadiv" style="background-color: #EBEBEB; width: 100%; height: 100px"></div>
<div class="wrap">
	<div class="userView_wrap">
		<div class="user_profile_wrap">
			<div class="user_profile_img">
				<img src="${vo.user_img}">
			</div>
			<div class="user_profile_info">
				<div class="id_btn_wrap">
					<span style="font-weight: bold;">${vo.id}</span>
					<c:if test="${logId != vo.id}">
						<button class="followbtn" onclick="follow(this,'${vo.id}')">
							<c:if test="${isFollow==''||isFollow=='U'}">팔로우</c:if>
							<c:if test="${isFollow!='' && isFollow=='F'}">언팔로우</c:if>
						</button>
					</c:if>
					<c:if test="${logId == vo.id}">
						<a href="${url}/users/userEdit"><span class="material-icons" style="color: gray;">settings</span></a>
					</c:if>
				</div>
				<div class="post_follower_wrap">
					<ul>
						<li>게시물 <span style="font-weight: bold;" id="postCnt">${pSize}</span></li>
						<li>팔로워 <span style="font-weight: bold;" id="followerCnt">${fSize}</span></li>
					</ul>
				</div>
				<div class="info_wrap">
					${vo.info}
				</div>
			</div>
		</div>

		<hr>
		
		<h3 style="padding-left: 20px; margin-top: 60px; font-size: 24px;">인기 게시물</h3>
		<div class="hot_post_wrap">
			<c:if test="${empty hList}">
				<div>
					아직 인기 게시물이 없어요..!
				</div>
			</c:if>
			<c:forEach var="hVO" items="${hList}">					
				<div class="hot_post_card_wrap">	
				<input type="hidden" value="${hVO.board_no}">
					<ul class="place_list">
						<li class="hot_post_title"><a href="${url}/community/communityView?no=${hVO.board_no}&id=${hVO.id}">${hVO.title}</a></li>
						<li><a href="${url}/community/communityView?no=${hVO.board_no}&id=${hVO.id}">${hVO.location1}</a></li>
						<li><a href="${url}/community/communityView?no=${hVO.board_no}&id=${hVO.id}">${hVO.location2}</a></li>
						<li><a href="${url}/community/communityView?no=${hVO.board_no}&id=${hVO.id}">${hVO.location3}</a></li>
						<li><a href="${url}/community/communityView?no=${hVO.board_no}&id=${hVO.id}">${hVO.location4}</a></li>
					</ul>
				</div>
			</c:forEach>
		</div>
		
		<h3 style="padding-left: 20px; margin-top: 60px; font-size: 24px;">게시물</h3>
		<div class="all_post_wrap">
			<c:forEach var="pVO" items="${pList}">
				<input type="hidden" value="${pVO.board_no}">
				<div class="post_card">
					<a href="${url}/community/communityView?no=${pVO.board_no}&id=${pVO.id}">
						<img src="${pVO.photo1}">
					</a>
					<div class="post_card_hover">
						<span class="material-icons" style="vertical-align: bottom;">favorite</span> ${pVO.likes} &nbsp; &nbsp; <span class="material-icons" style="vertical-align: bottom;">textsms</span> ${pVO.comment}
					</div>
				</div>
			</c:forEach>


		</div>




	</div>
</div>