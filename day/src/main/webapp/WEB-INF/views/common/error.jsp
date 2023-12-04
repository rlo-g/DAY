<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

		@font-face {
			font-family: 'NanumGothic';
			font-style: normal;
			font-weight: 400;
			src: url(https://ssl.pstatic.net/static/blog/font/NanumGothic-Regular.eot);
			src: local("Nanum Gothic Regular"),local("NanumGothicR"),url(https://ssl.pstatic.net/static/blog/font/NanumGothic-Regular.eot?#iefix) format("embedded-opentype"),url(https://ssl.pstatic.net/static/blog/font/NanumGothic-Regular.woff2) format("woff2"),url(https://ssl.pstatic.net/static/blog/font/NanumGothic-Regular.woff) format("woff"),url(https://ssl.pstatic.net/static/blog/font/NanumGothic-Regular.ttf) format("truetype")
		}

		@font-face {
			font-family: 'NanumGothic';
			font-style: normal;
			font-weight: 700;
			src: url(https://ssl.pstatic.net/static/blog/font/NanumGothic-Bold.eot);
			src: local("Nanum Gothic Bold"),local("NanumGothicB"),url(https://ssl.pstatic.net/static/blog/font/NanumGothic-Bold.eot?#iefix) format("embedded-opentype"),url(https://ssl.pstatic.net/static/blog/font/NanumGothic-Bold.woff2) format("woff2"),url(https://ssl.pstatic.net/static/blog/font/NanumGothic-Bold.woff) format("woff"),url(https://ssl.pstatic.net/static/blog/font/NanumGothic-Bold.ttf) format("truetype")
		}
		html { height: 100%; }
		body { overflow: hidden; margin: 0; display: table; width: 100%; height: 100%; }
		.error_wrap { display: table-cell; font-family: NanumGothic, sans-serif; text-align: center; vertical-align: middle; }
		.error_svg { line-height: 0; }
		.error_h1 { margin: 28px 0 0; font-size: 24px; line-height: 32px; font-weight: 700; color: #000; }
		.error_p { margin: 8px 0 0; font-size: 15px; line-height: 21px; color: #000; }
		.area_btn{margin-top:44px;font-size:0;line-height:0;}
		.area_btn .link{display:inline-block;width:280px;height:48px;border-radius:6px;background-color:#323232;font-size:15px;line-height:48px;color:#fff;font-weight:700;text-align:center;text-decoration:none}
	
</style>
</head>
<body>
<div class="error_wrap">
	<div class="error_svg">
		<svg xmlns="http://www.w3.org/2000/svg" width="52" height="52" viewBox="0 0 52 52">
			<g fill="none" fill-rule="evenodd" stroke-linecap="round" stroke-linejoin="round">
				<g stroke="#03C75A">
					<g transform="translate(-486 -223) translate(372 223) translate(114) translate(3 3) translate(.25 .25)">
						<path stroke-width="2.5" d="M22.75 9.208L22.75 27.865M22.75 33.763L22.75 36.292"></path>
						<circle cx="22.75" cy="22.75" r="22.75" stroke-width="2"></circle>
					</g>
				</g>
			</g>
		</svg>

	</div>
	<h1 class="error_h1">죄송합니다. 유효하지 않은 요청입니다.</h1>
	<p class="error_p">해당 다이어리가 없습니다.<br>다이어리 아이디를 확인해 주세요.</p>
	<div class="area_btn">
		<a href="javascript:history.back(-1)" class="link">이전 화면으로</a>
	</div>
</div>
</body>
</html>