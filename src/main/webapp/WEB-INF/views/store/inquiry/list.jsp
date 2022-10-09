<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.subTitle1 {
		font-size: 13px;
	}

	.idWrap {
		font-size: 12px;
		color: #bdbdbd;
	}

	.question {
		color: #35c5f0;
		font-weight: bold;
	}

	.reply {
		color: #35c5f0;
		transition: opacity .1s;
		font: inherit;
		margin: 0;
		padding: 0;
		background: none;
		border: none;
		font-size: 13px;
		margin-right: 5px;
	}

	.production-question-feed__item__content__secret-icon {
		margin-left: 3px;
		width: 4%;
	}
</style>
</head>
<body>
	<c:forEach items="${list}" var="dto" varStatus="i">
		<c:if test="${dto.replyStatus eq 0}">
			<hr>
			<div class="d-flex justify-content-between">
			<c:choose>
				<c:when test="${dto.buyStatus eq 0 and reStatus[i.index] eq 0}">
					<div>
						<span class="subTitle1">비구매 |</span>
						<span class="subTitle1">답변대기</span>
					</div>
				</c:when>
				<c:when test="${dto.buyStatus eq 0 and reStatus[i.index] eq 1}">
					<div>
						<span class="subTitle1">비구매 |</span>
						<span class="subTitle1" style="color: #35c5f0;">답변완료</span>
					</div>
				</c:when>
				<c:when test="${dto.buyStatus eq 1 and reStatus[i.index] eq 0}">
					<div>
						<span class="subTitle1">구매 |</span>
						<span class="subTitle1">답변대기</span>
					</div>
				</c:when>
				<c:otherwise>
					<div>
						<span class="subTitle1">구매 |</span>
						<span class="subTitle1" style="color: #35c5f0;">답변완료</span>
					</div>
				</c:otherwise>
			</c:choose>
			<div class="delete" data-delete-inqnum="${dto.inqNum}">❌</div>
			</div>
			<div class="d-flex idWrap">
				<div style="margin-right: 5px;">${dto.userId}</div>
				<div>${dto.regDate}</div>
			</div>
			<div class="d-flex justify-content-between">
				<div>
					<span class="question">Q</span>
					<c:choose>
						<c:when test="${dto.priStatus eq 0 or dto.userId eq member.userId or ManagerRole ne null}">
							<span>${dto.contents}</span>
						</c:when>
						<c:otherwise>
							<span>
								<svg class="production-question-feed__item__content__secret-icon" viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet">
									<path fill="#AFAFAF" d="M10 5.33h-.67V4a3.33 3.33 0 00-6.66 0v1.33H2c-.73 0-1.33.6-1.33 1.34v6.66c0 
										.74.6 1.34 1.33 1.34h8c.73 0 1.33-.6 1.33-1.34V6.67c0-.74-.6-1.34-1.33-1.34zm-4 6c-.73 0-1.33-.6-1.33-1.33S5.27 8.67 
										6 8.67s1.33.6 1.33 1.33-.6 1.33-1.33 1.33zm2.07-6H3.93V4a2.07 2.07 0 014.14 0v1.33z">
									</path>
								</svg>
								비밀글입니다.
							</span>
						</c:otherwise>
					</c:choose>
				</div>
				<button class="reply" data-bs-toggle="modal" data-bs-target="#inquiryReplyModal" data-reply-inqnum="${dto.inqNum}">답글</button>
			</div>
		</c:if>
		<c:if test="${not empty reply[i.index]}">
			<c:if test="${dto.priStatus eq 0 or dto.userId eq member.userId or ManagerRole ne null}">
				<div style="margin-top: 5px;">
					<div>
						<span class="question">A</span>
						<span>${reply[i.index].userId}</span>
						<span>${reply[i.index].regDate}</span>
					</div>
					<div>${reply[i.index].contents}</div>
				</div>
			</c:if>
		</c:if>
	</c:forEach>
</body>
</html>