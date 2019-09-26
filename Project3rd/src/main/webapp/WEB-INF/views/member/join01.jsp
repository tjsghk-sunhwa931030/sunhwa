<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
li { list-style: none }
.login_box_new{

}

    /*
     * 필수설정 스타일. 자동완성 폭과 최소높이.
    */
    .keywordSuggest-dropdown, .keywordSuggest-keywords, .keywordSuggest-comment, .keywordSuggest-footer {
        width: 443px;
    }

    .keywordSuggest-keywords {
        min-height: 230px;
    }
    
	.skipContent a{
	    position: absolute;
	    background: rgba(0,0,0,0.7); /** 반투명한 배경 */
	    filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#90000000,endColorstr=#90000000);  /** IE8에서 반투명한 배경 적용 */
	    width: 100%;
	    height: 30px;
	    text-align: center; /** text 가로 중앙 정렬 */
	    color: #fff;
	    z-index: 100;
	    line-height: 30px; /** text 세로 중앙 정렬*/
	    top: -30px; /** 우선 안보이게 감추기*/
	    opacity: 0; /** 우선 안보이게 감추기*/
	}
	

</style>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="style/default.css" />
<link rel="stylesheet" href="style/main_style.css" />

<link rel="stylesheet" href="style/style_re.css" />
<!--[if IE 8]><link rel="stylesheet" href="/css/style_8.css" /><![endif]-->
<!--[if lt IE 9]><script src="/js/selectivizr.js"></script><![endif]-->
<!-- 2015-12-28 패스트캣 전제현 : 자동완성용 스타일 중 부가 설정 -->
<link rel="stylesheet" type="text/css" href="style/keywordSuggestSub.css" />
<link rel="stylesheet" type="text/css" href="style/rMateChartH5.css">
<link rel="stylesheet" type="text/css" href="style/jquery.toast.min.css">
<link rel="stylesheet" href="style/interuniv.css" />
<link rel="stylesheet" href="style/style.css" />
<link rel="stylesheet" href="style/leftmenustyle.css" />
<link rel="stylesheet" href="style/basic.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">


<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
	<%@include file="../main/head.jsp" %> 
	<div class="topcontents">
		<div class="lefttop">
			<div class="lefttoptext">회원서비스</div>
		</div>
		<div class="righttop">
			<div class="righttoptext">회원가입</div>
		</div>
	</div>
	<div class="contents" style="height:890px;">
		<div class="leftmenu">
			<nav class="left1" >
				<ul class="navbar-nav1  bg-light">
					<li class="nav-item1"><a class="nav-link" href="login.do">로그인<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
					<li class="nav-item1"><a class="nav-link" href="join01.do">회원가입<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
					<li class="nav-item1"><a class="nav-link" href="find_id.do">아이디찾기<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
					<li class="nav-item1"><a class="nav-link" href="find_pw.do">비밀번호찾기<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
					<li class="nav-item1"><a class="nav-link" href="map.do">사이트맵<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
				</ul>
			</nav>
		</div>
		<div class="rightcontents">
		
		
		
		<div class="con_box">
		<ul class="tab_member">
			<li class="on">1.약관동의</li>
			<li>2.회원정보입력</li>
			<li>3.회원가입완료</li>
		</ul>
		<!-- 이용약관 -->
		<div class="table_box2 mgt35">
			<h4>이용약관</h4>
			<div class="area10">
				<div id="area10" class="tab_area" style="height: 170px; overflow-y: scroll; border:1px solid #ddd;font-size:12px;color:#888;padding:20px;letter-spacing: 0.5px;line-height: 16px;">
				-제 1장 총칙 -
	<br />			
<br />
제 1 조 (목적)
<br />
본 약관은 한국대학교육협의회 사이트 대학입학정보포털  (이하 "대입정보포털")가 제공하는 모든 서비스(이하 "서비스")의 이용조건 및 절차, 이용자와 대입정보포털의 권리, 의무, 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.
<br />
<br />
제 2 조 (약관의 효력과 변경)
<br />
1. 대입정보포털은 귀하가 본 약관 내용에 동의하는 것을 조건으로 귀하에게 서비스를 제공할 것이며, 귀하가 본 약관의 내용에 동의하는 경우, 대입정보포털의 서비스 제공 행위 및 귀하의 서비스 사용 행위에는 본 약관이 우선적으로 적용될 것입니다.
<br />
2. 대입정보포털은 본 약관을 사전 고지 없이 변경할 수 있으며, 변경된 약관은 대입정보포털 내에 공지함으로써 이용자가 직접 확인하도록 할 것입니다. 이용자가 변경된 약관에 동의하지 아니하는 경우, 이용자는 본인의 회원등록을 취소(회원탈퇴)할 수 있으며, 계속 사용의 경우는 약관 변경에 대한 동의로 간주됩니다. 변경된 약관은 공지와 동시에 그 효력이 발생됩니다.
<br />
<br />

제 3 조 (약관 외 준칙)
<br />
1. 본 약관은 대입정보포털이 제공하는 서비스에 관한 이용규정 및 별도 약관과 함께 적용됩니다.
<br />
2. 본 약관에 명시되지 않은 사항은 전기통신기본법, 전기통신사업법, 정보통신윤리위원회심의규정, 정보통신 윤리강령, 저작권법 및 기타 관련 법령의 규정에 의합니다.
<br />
<br />
제 4 조 (용어의 정의)
<br />
본 약관에서 사용하는 용어의 정의는 다음과 같습니다.
<br />
1. 이용자: 본 약관에 따라 대입정보포털이 제공하는 서비스를 받는 자.
<br />
2. 가입: 대입정보포털이 제공하는 신청서 양식에 해당 정보를 기입하고, 본 약관에 동의하여 서비스 이용계약을 완료시키는 행위
<br />
3. 회원: 대입정보포털에 개인 정보를 제공하여 회원 등록을 한 자로서, 대입정보포털의 정보를 제공받으며, 대입정보포털이 제공하는 서비스를 이용할 수 있는 자.
<br />
4. 회원ID: 첫 글자가 영문자로 시작하고 영숫자가 조합된 최소 6자에서 최대10자 사이의 고유한 문자의 조합
<br />
5. 비밀번호: 이용자와 회원ID가 일치하는지를 확인하고 통신상의 자신의 비밀보호를 위하여 이용자 자신이 선정한 문자와 숫자의 조합.
<br />
6. 탈퇴: 회원이 이용계약을 종료 시키는 행위
<br />
7. 본 약관에서 정의하지 않은 용어는 개별서비스에 대한 별도 약관 및 이용규정에서 정의합니다.
<br />
<br />
-제 2 장 서비스 제공 및 이용-
<br />
<br />
제 5 조 (이용 계약의 성립)
<br />
1. 이용계약은 신청자가 온라인으로 대입정보포털에서 제공하는 소정의 가입신청 양식에서 요구하는 사항을 기록하고 회원가입 버튼을 누르는 것으로 성립됩니다.
<br />
2. 대입정보포털은 다음 각 호에 해당하는 이용계약에 대하여는 가입을 취소할 수 있습니다.
<br />
1) 다른 사람의 명의를 사용하여 신청하였을 때
<br />
2) 이용 계약 신청서의 내용을 허위로 기재하였거나 신청하였을 때
<br />
3) 사회의 안녕 질서 혹은 미풍양속을 저해할 목적으로 신청하였을 때
<br />
4) 다른 사람의 대입정보포털 서비스 이용을 방해하거나 그 정보를 도용하는 등의 행위를 하였을 때
<br />
5) 대입정보포털을 이용하여 법령과 본 약관이 금지하는 행위를 하는 경우
<br />
6) 기타 대입정보포털이 정한 이용신청요건이 미비 되었을 때
<br />
3. 대입정보포털은 다음 각 항에 해당하는 경우 그 사유가 해소될 때까지 이용계약 성립을 유보할 수 있습니다.
<br />
1) 서비스 관련 제반 용량이 부족한 경우
<br />
2) 기술상 장애 사유가 있는 경우
<br />
4. 대입정보포털이 제공하는 서비스는 아래와 같으며, 그 변경될 서비스의 내용을 이용자에게 공지하고 아래에서 정한 서비스를 변경하여 제공할 수 있습니다.
<br />
1) 대입정보포털이 자체 개발하거나 다른 기관과의 협의 등을 통해 제공하는 일체의 서비스
<br />
<br />

제 6 조 (회원정보 사용에 대한 동의)
<br />
1. 회원의 개인정보에 대해서는 대입정보포털의 개인정보 처리방침이 적용되며 대입정보포털의 책임제한에 준합니다.
<br />
2. 대입정보포털의 회원 정보는 다음과 같이 수집, 사용, 관리, 보호됩니다.
<br />
1) 개인정보의 수집: 대입정보포털은 법령의 규정과 정보주체의 동의에 의해서만 대입정보포털 서비스 가입 시 귀하가 제공하는 정보를 통하여 귀하에 관한 정보를 수집합니다.
<br />
※ 만14세 미만의 아동이 서비스를 이용하기 위해서는 협의회가 요구하는 소정의 법정대리인의 동의절차를 거쳐야 합니다.
<br />
2) 개인정보의 사용: 대입정보포털은 대입정보포털 서비스 제공과 관련해서 수집된 회원의 신상정보를 본인의 승낙 없이 제3자에게 누설, 배포하지 않습니다. 단, 개인정보보호법 등 법률의 규정에 의해 다른 법률에 특별한 규정이 있는 경우, 정보주체 또는 그 법정대리인이 의사표시를 할 수 없는 상태에 있거나 주소불명 등으로 사전 동의를 받을 수 없는 경우로서 명백히 정보주체 또는 제3자의 급박한 생명, 신체, 재산의 이익을 위하여 필요하다고 인정되는 경우, 통계작성 및 학술연구 등의 목적을 위하여 필요한 경우로서 특정 개인을 알아볼 수 없는 형태로 개인정보를 제공하는 경우, 개인정보를 목적 외의 용도로 이용하거나 이를 제3자에게 제공하지 아니하면 다른 법률에서 정하는 소관 업무를 수행할 수 없는 경우로서 보호위원회의 심의·의결을 거친 경우, 조약, 그 밖의 국제협정의 이행을 위하여 외국정부 또는 국제기구에 제공하기 위하여 필요한 경우, 범죄의 수사와 공소의 제기 및 유지를 위하여 필요한 경우, 형 및 감호, 보호처분의 집행을 위하여 필요한 경우 또는 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우, 귀하가 대입정보포털에 제공한 개인정보를 스스로 공개한 경우에는 그러하지 않습니다.
<br />
3) 개인정보의 관리: 귀하는 개인정보의 보호 및 관리를 위하여 서비스의 개인정보관리에서 수시로 귀하의 개인정보를 수정/삭제할 수 있습니다. 수신되는 정보 중 불필요하다고 생각되는 부분도 변경/조정할 수 있습니다.
<br />
4) 개인정보의 보호: 귀하의 개인정보는 오직 귀하만이 열람/수정/삭제 할 수 있으며, 이는 전적으로 귀하의 ID와 비밀번호에 의해 관리되고 있습니다. 따라서 타인에게 본인의 ID와 비밀번호를 알려주어서는 아니 되며, 작업 종료 시에는 반드시 로그아웃 해주시고, 웹 브라우저의 창을 닫아주시기 바랍니다.(이는 타인과 컴퓨터를 공유하는 인터넷 카페나 도서관 같은 공공장소에서 컴퓨터를 사용하는 경우에 귀하의 정보의 보호를 위하여 필요한 사항입니다.)
<br />
3. 회원이 대입정보포털에 본 약관에 따라 이용신청을 하는 것은 대입정보포털이 본 약관에 따라 신청서에 기재된 회원정보를 수집, 이용하는 것에 동의하는 것으로 간주됩니다.
<br />
<br />
제 7 조 (사용자의 정보 보안)
<br />
1. 가입 신청자가 대입정보포털 서비스 가입 절차를 완료하는 순간부터 귀하는 입력한 정보의 비밀을 유지할 책임이 있으며, 회원의 ID와 비밀번호를 사용하여 발생하는 모든 결과에 대한 책임은 회원본인에게 있습니다.
<br />
2. ID와 비밀번호에 관한 모든 관리의 책임은 회원에게 있으며, 회원의 ID나 비밀번호가 부정하게 사용되었다는 사실을 발견한 경우에는 즉시 대입정보포털에 신고하여야 합니다. 신고를 하지 않음으로 인한 모든 책임은 회원 본인에게 있습니다.
<br />
3. 이용자는 대입정보포털 서비스의 사용 종료 시 마다 정확히 접속을 종료하도록 해야 하며, 정확히 종료하지 아니함으로써 제3자가 귀하에 관한 정보를 이용하게 되는 등의 결과로 인해 발생하는 손해 및 손실에 대하여 대입정보포털은 책임을 부담하지 아니합니다.
<br />
<br />
제 8 조 (서비스 이용시간)
<br />
1. 서비스 이용시간은 대입정보포털의 업무상 또는 기술상 특별한 지장이 없는 한 연중무휴, 1일 24시간을 원칙으로 합니다.
<br />
2. 제1항의 이용시간은 정기점검 등의 필요로 인하여 대입정보포털이 정한 날 또는 시간은 예외로 합니다. 
<br />
<br />
제 9 조 (서비스의 중지 및 정보의 저장과 사용)
<br />
1. 귀하는 대입정보포털 서비스에 보관되거나 전송된 메시지 및 기타 통신 메시지 등의 내용이 국가의 비상사태, 정전, 대입정보포털의 관리 범위 외의 서비스 설비 장애 및 기타 불가항력에 의하여 보관되지 못하였거나 삭제된 경우, 전송되지 못한 경우 및 기타 통신 데이터의 손실이 있을 경우에 대입정보포털은 관련 책임을 부담하지 아니합니다.
<br />
2. 대입정보포털이 정상적인 서비스 제공의 어려움으로 인하여 일시적으로 서비스를 중지하여야 할 경우에는 서비스 중지 1주일 전의 고지 후 서비스를 중지할 수 있으며, 이 기간 동안 귀하가 고지내용을 인지하지 못한 데 대하여 대입정보포털은 책임을 부담하지 아니합니다. 부득이한 사정이 있을 경우 위 사전 고지기간은 감축되거나 생략될 수 있습니다. 또한 위 서비스 중지에 의하여 본 서비스에 보관되거나 전송된 메시지 및 기타 통신 메시지 등의 내용이 보관되지 못하였거나 삭제된 경우, 전송되지 못한 경우 및 기타 통신 데이터의 손실이 있을 경우에 대하여도 대입정보포털은 책임을 부담하지 아니합니다.
<br />
3. 대입정보포털의 사정으로 서비스를 영구적으로 중단하여야 할 경우 제2항에 의거합니다. 다만, 이 경우 사전 고지기간은 1개월로 합니다.
<br />
4. 대입정보포털은 사전 고지 후 서비스를 일시적으로 수정, 변경 및 중단할 수 있으며, 이에 대하여 귀하 또는 제3자에게 어떠한 책임도 부담하지 아니합니다.
<br />
5. 대입정보포털은 이용자가 본 약관의 내용에 위배되는 행동을 한 경우, 임의로 서비스 사용을 제한 및 중지할 수 있습니다. 이 경우 대입정보포털은 위 이용자의 접속을 금지할 수 있습니다.
<br />
<br />
제 10 조 (서비스의 변경 및 해지)
1. 대입정보포털은 귀하가 서비스를 이용하여 기대하는 손익이나 서비스를 통하여 얻은 자료로 인한 손해에 관하여 책임을 지지 않으며, 회원이 본 서비스에 게재한 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 관하여는 책임을 지지 않습니다.
<br />
2. 대입정보포털은 서비스 이용과 관련하여 가입자에게 발생한 손해 중 가입자의 고의, 과실에 의한 손해에 대하여 책임을 부담하지 아니합니다.
<br />
<br /> 
제 11 조 (정보 제공 및 홍보물 게재)
<br />
1. 대입정보포털은 서비스를 운영함에 있어서 각종 정보를 서비스에 게재하는 방법 등으로 회원에게 제공할 수 있습니다.
<br />
2. 대입정보포털은 서비스에 적절하다고 판단되거나 활용 가능성 있는 홍보물을 게재할 수 있습니다.
			</div>

			</div>
		</div>
		<!-- // 이용약관 -->
		
		<!-- 개인정보 수집 및 이용에 대한 안내 -->
		<div class="table_box2 mgt15">
			<h4>개인정보 수집 및 이용에 대한 안내</h4>
			<div class="area20">
				
				<div id="area20" class="tab_area" style="height: 170px; overflow-y: scroll; border:1px solid #ddd;font-size:12px;color:#888;padding:20px;letter-spacing: 0.5px;line-height: 16px;">
■ 개인정보의 수집 및 이용에 대한 안내
<br />
<br />
1. 개인정보의 수집·이용 목적 : 홈페이지 회원가입 및 관리
<br />
<br />
2. 수집하는 개인정보의 항목
<br />
 - 필수항목
<br />
  ○ 회원정보 : 로그인ID, 성명, 비밀번호, 핸드폰, 이메일, 접속IP주소, 서비스 이용 기록
<br />
 - 선택항목
<br />
 ○ 추가정보(학생회원) : 고등학교 명, 학년, 성적
<br />
<br />
① 대입정보포털에서 처리하는 개인정보는 소관업무 및 법령에서 정한 최소한의 개인정보만을 처리하며, 정보주체의 동의를 받아 개인정보를 수집하는 경우 필요한 최소한의 정보 외의 개인정보 수집에는 동의하지 아니할 수 있다는 사실을 구체적으로 알리고 개인정보를 수집합니다.
<br />
② 대입정보포털에서 처리하는 개인정보의 항목은 한국대학교육협의회 개인정보 처리방침 제1조 ②항의 ‘개인정보파일 현황’에서 조회하실 수 있습니다.
<br />
<br />
3. 개인정보의 보유·이용 기간 : 회원 가입일로부터 회원 탈퇴 시까지
<br />
<br />
① 대입정보포털에서 처리하는 개인정보는 수집·이용 목적으로 명시한 범위 내에서 처리하며, 개인정보보호법 및 관련법령에서 정하는 보유기간을 준용하여 이행하고 있습니다.
<br />
② 대입정보포털에서『개인정보보호법』제32조에 따라 등록·공개하는 개인정보의 처리 및 보유기간은 한국대학교육협의회 개인정보 처리방침 제1조 ②항의 ‘개인정보파일 현황’에서 조회하실 수 있습니다.
<br />
③ 행정자치부 개인정보보호 종합지원포털(www.privacy.go.kr) ▷ 개인 ▷ 개인정보 민원 ▷ 개인정보 열람등 요구 ▷ 개인정보파일 목록검색 ▷ 기관명에 “한국대학교육협의회”를 입력 후 조회하실 수 있습니다.
<br />
<br />
■ 개인정보의 취급위탁에 대한 안내
<br />
<br />
① 대입정보포털에서는 개인정보의 처리 업무를 위탁하는 경우에는 『개인정보보호법』제26조(업무위탁에 따른 개인정보의 처리 제한)에 따라 위탁하고 있습니다.
<br />
② 대입정보포털에서는 위탁계약 체결 시 『개인정보보호법』제25조에 따라 위탁업무 수행목적 외 개인정보 처리금지, 기술적·관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리·감독, 손해배상 등 책임에 관한 사항을 계약서 등 다음 각 호의 내용이 포함된 문서에 명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다.
<br />
<br />
 1. 위탁업무 수행 목적 외 개인정보의 처리 금지에 관한 사항
 <br />
 <br />
 2. 개인정보의 기술적·관리적 보호조치에 관한 사항
 <br />
 <br />
 3. 그 밖에 개인정보의 안전한 관리를 위하여 다음과 같이 대통령령으로 정한 사항
 <br />
 <br />
   가. 위탁업무의 목적 및 범위
   <br />
   나. 재위탁 제한에 관한 사항
   <br />
   다. 개인정보에 대한 접근 제한 등 안전성 확보 조치에 관한 사항
   <br />
   라. 위탁업무와 관련하여 보유하고 있는 개인정보의 관리 현황 점검 등 감독에 관한사항
   <br />
   마. 수탁자가 준수하여야 할 의무를 위반한 경우의 손해배상 등 책임에 관한 사항
   <br />
   <br />
 4. 위탁하는 업무의 내용과 개인정보 처리업무를 위탁받아 처리하는 자(“수탁자”)에 대하여 해당 홈페이지에 공개하고 있습니다.
<br />
<br />
③ 대입정보포털에서는 개인정보 처리를 위탁하는 경우 관련사항은 각 분야에서 운영하는 소관 홈페이지에 게재하여 정보주체가 확인할 수 있도록 안내를 하고 있습니다.
<br />
④ 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체 없이 한국대학교육협의회 개인정보 처리방침을 통하여 공개하도록 하겠습니다.
<br />
⑤ 대입정보포털에서 원활한 개인정보 업무처리를 위하여 개인정보 처리업무를 위탁하고 있는 현황은 한국대학교육협의회 개인정보처리방침에서 확인하실 수 있습니다.
<br />
<br />
■ 개인정보의 제3자 제공에 대한 안내
<br />
<br />
① 대입정보포털에서는 원칙적으로 정보주체의 개인정보를 수집·이용 목적으로 명시한 범위 내에서 처리하며, 정보주체의 동의, 법률의 특별한 규정 등 개인정보 보호법 제17조 및 제18조에 해당하는 다음의 경우를 제외하고는 정보주체의 사전 동의 없이는 본래의 목적 범위를 초과하여 처리하거나 제3자에게 제공하지 않습니다.
<br />
<br />
1. 정보주체로부터 별도의 동의를 받는 경우
<br />
2. 법률에 특별한 규정이 있는 경우
<br />
3. 정보주체 또는 법정대리인이 의사표시를 할 수 없는 상태에 있거나 주소불명 등으로 사전 동의를 받을 수 없는 경우로서 명백히 정보주체 또는 제3자의 급박한 생명, 신체, 재산의 이익을 위하여 필요하다고 인정되는 경우
<br />
4. 통계작성 및 학술연구 등의 목적을 위하여 필요한 경우로서 특정 개인을 알아 볼 수 없는 형태로 개인정보를 제공하는 경우
<br />
5. 개인정보를 목적 외의 용도로 이용하거나 이를 제3자에게 제공하지 아니하면 다른 법률에서 정하는 소관 업무를 수행할 수 없는 경우로서 보호위원회의 심의·의결을 거친 경우
<br />
6. 조약, 그 밖의 국제협정의 이행을 위하여 외국정보 또는 국제기구에 제공하기 위하여 필요한 경우
<br />
7. 범죄의 수사와 공소의 제기 및 유지를 위하여 필요한 경우
<br />
8. 법원의 재판업무 수행을 위하여 필요한 경우
<br />
9. 형 및 감호, 보호처분의 집행을 위하여 필요한 경우
<br />
<br />
② 대입정보포털에서는 제공하는 개인정보의 제3자 정보 제공 현황은 한국대학교육협의회 개인정보처리방침에서 확인하실 수 있습니다.

				</div>
			</div>
		</div>
		<!-- // 개인정보 수집 및 이용에 대한 안내 -->
<script>
function registFrmCheck(){
	var fn = document.registFrm.agreement1.checked;
	if(!fn){
		alert("이용약관에 대하여 동의하셔야 합니다");
		return false;
	}
	
	
	}


function go_login()
{
	location.href="login.do";
}
</script>		
		<form action="join02.do" name="registFrm" method="post" onsubmit="return registFrmCheck();">
		<div class="s_member_hr">
			<label for="chkbox3" class="tts">선택</label><input type="checkbox"  class="che2" name="agreement1" title="전체약관동의"/><label for="chkbox3"> 이용약관과 개인정보 수집 및 이용에 대한 안내에 동의합니다</label>
			<p class="t_cr02">※ 위 개인정보 수집 및 이용에 관한 동의는 거부하실 수 있으며, 동의하지 않으시는 경우 회원가입이 불가합니다.</p>
		</div>
		<div class="align_c">
			<button type="submit" class="btnc_member1">동의</button>

			<button type="button" class="btnc_member2" onclick="go_login()">취소</button>
		</div>
		</form>
	</div>

		
		
		
		
		
			
		
		</div>
	</div>
	
	<%@include file="../main/bottom.jsp" %>
</body>
</html>