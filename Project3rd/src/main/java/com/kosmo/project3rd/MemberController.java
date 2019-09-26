package com.kosmo.project3rd;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.inject.Inject;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonNode;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import mybatis.CoconutDTO;
import mybatis.GradeImpl;
import mybatis.MybatisMemberImpl;
import mybatis.MybatisMypageDAOImpl;
import oracle.net.aso.s;

@Controller
public class MemberController {

	private kakao_restapi kakao_restapi = new kakao_restapi();

	@Autowired
	private SqlSession sqlSession;

	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	@Autowired
	private JavaMailSender mailSender;

	SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");

	Calendar cal = Calendar.getInstance();
	
	String format = format1.format (cal.getTime());
	
	String[] temp = format.split("-");

	String year = temp[0];
	String month = temp[1];
	String day = temp[2];

	
//@RequestParam("code") String code
	@RequestMapping(value = "/login.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) {

		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);

		// https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		// redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2F
		// callback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);

		// 네이버
		model.addAttribute("url", naverAuthUrl);

		/* 생성한 인증 URL을 View로 전달 */

		return "member/login";
	}

	/*
	 * @RequestMapping(value="/good.do") public String login(@RequestParam("code")
	 * String code) {
	 * 
	 * String access_Token = kakao.getAccessToken(code);
	 * System.out.println("controller access_token : " + access_Token);
	 * 
	 * 
	 * return "member/main"; }
	 */

	@Autowired
	private KakaoAPI kakao;

	@RequestMapping(value = "/good.do", produces = "application/json")
	public String kakaoLogin(@RequestParam("code") String code, Model model, HttpSession session,
			HttpServletRequest req) {
		System.out.println("로그인 할때 임시 코드값");
		// 카카오 홈페이지에서 받은 결과 코드
		System.out.println(code);
		System.out.println("로그인 후 결과값");

		/*
		 * kakao_restapi kr = new kakao_restapi();
		 */

		String access_Token = kakao.getAccessToken(code);
		System.out.println("controller access_token : " + access_Token);

		/*
		 * HashMap<String, Object> userInfo2 = kakao.getUserInfonoemail(access_Token);
		 * System.out.println("login Controller : " + userInfo2);
		 * 
		 * 
		 * 
		 * 
		 * session.setAttribute("access_Token", access_Token);
		 * System.out.println("세션에 저장"+access_Token);
		 * session.setAttribute("siteUserInfo", userInfo2.get("nickname"));
		 * 
		 * 
		 * JsonNode node1 =
		 * kakao.Logout(session.getAttribute("access_Token").toString());
		 * 
		 * System.out.println("node1"+node1);
		 * 
		 * String abc = node1.get("id").toString();
		 * 
		 * System.out.println("아이디=" + abc);
		 * 
		 * 
		 * String NAME = userInfo2.get("nickname").toString();
		 * 
		 * 
		 * System.out.println("NAME"+NAME);
		 * 
		 * sqlSession.getMapper(MybatisMemberImpl.class).snsnoemail(NAME, abc);
		 * 
		 */

		HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
		System.out.println("login Controller : " + userInfo);
		System.out.println(userInfo.get("id"));

		String userid = userInfo.get("id").toString();

		if (userInfo.get("email") != null) {
			session.setAttribute("userId", userInfo.get("email"));
			session.setAttribute("access_Token", access_Token);
			System.out.println("세션에 저장" + access_Token);

			session.setAttribute("siteUserInfo", userInfo.get("id"));

			JsonNode node3 = kakao.Logout(session.getAttribute("access_Token").toString());

			String abc3 = node3.get("id").toString();

			System.out.println("아이디=" + abc3);

			String id3 = userInfo.get("id").toString();
			String EMAIL3 = userInfo.get("email").toString();
			String NAME3 = userInfo.get("nickname").toString();

			System.out.println("EMAIL" + EMAIL3);
			System.out.println("NAME" + NAME3);

			sqlSession.getMapper(MybatisMemberImpl.class).snslogin(NAME3, id3, EMAIL3);

		} else {

			session.setAttribute("access_Token", access_Token);
			System.out.println("세션에 저장" + access_Token);
			session.setAttribute("siteUserInfo", userInfo.get("id"));

			JsonNode node1 = kakao.Logout(session.getAttribute("access_Token").toString());

			System.out.println("node1" + node1);

			/*
			 * String abc = node1.get("id").toString();
			 * 
			 * System.out.println("아이디=" + abc);
			 */

			String NAME = userInfo.get("nickname").toString();
			String id = userInfo.get("id").toString();

			System.out.println("NAME" + NAME);

			sqlSession.getMapper(MybatisMemberImpl.class).snsnoemail(NAME, id);

		}

		// sqlSession.getMapper(MybatisMemberImpl.class).snslogin(NAME, ID, EMAIL);

		// 카카오 rest api 객체 선언

		/*
		 * // 결과값을 node에 담아줌 JsonNode node = kr.getAccessToken(code);
		 * 
		 * // 결과값 출력 System.out.println(node);
		 * 
		 * // 노드 안에 있는 access_token값을 꺼내 문자열로 변환 String token =
		 * node.get("access_token").toString();
		 * 
		 * System.out.println("token=" + token); // 세션에 담아준다.
		 * session.setAttribute("siteUserInfo", token);
		 * 
		 * JsonNode node1 = kr.Logout(session.getAttribute("siteUserInfo").toString());
		 * 
		 * System.out.println("node=" + node);
		 * 
		 * HashMap<String, Object> userInfo = kr.getUserInfo(node.toString());
		 * System.out.println("login Controller : " + userInfo);
		 * 
		 * 
		 * 
		 * // System.out.println("login Controller : " + userInfo);
		 * 
		 * // 클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록 if (userInfo.get("email") != null) {
		 * // session.setAttribute("userId", userInfo.get("email")); //
		 * session.setAttribute("access_Token", access_Token); }
		 * 
		 * String abc = node1.get("id").toString();
		 * 
		 * System.out.println("아이디=" + abc);
		 */

		String[] subject = { "국어", "수학", "영어", "사회", "과학" };

		// 내신 성적 초기화
		for (int i = 1; i <= 3; i++) {
			for (int j = 1; j <= 2; j++) {
				for (int k = 0; k < 5; k++) {
					sqlSession.getMapper(MybatisMypageDAOImpl.class).sugrade(subject[k], "과목", 0, 0, 0, 0, 0, 0,
							i + "학년", j + "학기", userid);
				}
			}
		}

		sqlSession.getMapper(GradeImpl.class).update_visit(year, month, day);

		return "main/main";
	}

	// 네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/callback.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session,
			HttpServletRequest req) throws IOException {
		System.out.println("여기는 callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		// 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken);

		JsonParser parser = new JsonParser();
		Object obj = null;

		obj = parser.parse(apiResult);
		JsonObject jsonobj = (JsonObject) obj;
		JsonObject response = (JsonObject) jsonobj.get("response");
		String ID = response.get("id").toString();
		String NAME = response.get("name").toString();
		String EMAIL = response.get("email").toString();

		NAME = NAME.replace("\"", "");
		EMAIL = EMAIL.replace("\"", "");
		ID = ID.replace("\"", "");

		session.setAttribute("siteUserInfo", ID);

		System.out.println("아이디" + ID);
		System.out.println(NAME);
		System.out.println(EMAIL);

		OAuth2AccessToken a = oauthToken;

		System.out.println("엑세스토큰=" + a.getAccessToken());
		// System.out.println("엑세스토큰="+a.);
		System.out.println("엑세스토큰=" + a.getAccessToken());

		String ID3 = a.getAccessToken().toString();

		System.out.println("navertoken" + ID3);

		sqlSession.getMapper(MybatisMemberImpl.class).snslogin(NAME, ID, EMAIL);

		// sqlSession.getMapper(MybatisMemberImpl.class).snsdb(navername, naveremail,
		// navertoken);
		// oauthToken.get

		/* 네이버 로그인 성공 페이지 View 호출 */

		String[] subject = { "국어", "수학", "영어", "사회", "과학" };

		// 내신 성적 초기화
		for (int i = 1; i <= 3; i++) {
			for (int j = 1; j <= 2; j++) {
				for (int k = 0; k < 5; k++) {
					sqlSession.getMapper(MybatisMypageDAOImpl.class).sugrade(subject[k], "과목", 0, 0, 0, 0, 0, 0,
							i + "학년", j + "학기", ID);
				}
			}
		}

		sqlSession.getMapper(GradeImpl.class).update_visit(year, month, day);

		return "main/main";
	}

	// 로그인 처리
	@RequestMapping("loginAction.do")
	public ModelAndView loginAction(HttpServletRequest req, HttpSession session, HttpServletResponse response)
			throws Exception {
		CoconutDTO vo = sqlSession.getMapper(MybatisMemberImpl.class).login(req.getParameter("ID"),
				req.getParameter("PASS1"));

		ModelAndView mv = new ModelAndView();
		if (vo == null) {
			// 로그인에 실패한 경우
			/*
			 * mv.addObject("LoginNG", "아이디/패스워드가 틀렸습니다."); //로그인 페이지로 다시 이동
			 * mv.setViewName("07Mybatis/login");
			 */
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 정보를 확인해주세요.'); </script>");
			out.flush();
			mv.setViewName("member/login");

			return mv;
		} else {
			// 로그인에 성공한 경우 Session영역에 속성 저장
			session.setAttribute("siteUserInfo", vo.getID());
		}

		// 로그인 후 페이지 이동
		String backUrl = req.getParameter("backUrl");
		if (backUrl == null || backUrl.equals("")) {
			mv.setViewName("main/main");
		} else {
			// 로그인후 글쓰기 페이지로 이동함.
			mv.setViewName(backUrl);
		}
		
		sqlSession.getMapper(GradeImpl.class).update_visit(year, month, day);

		return mv;
	}

	@RequestMapping("logout.do")
	public String logout(HttpSession session) {

		kakao_restapi kr = new kakao_restapi();

		JsonNode node = kr.Logout(session.getAttribute("siteUserInfo").toString());

		System.out.println("로그인 후 반환되는 아이디 : " + node.get("id"));

		// 세션영역을 비워준다.
		session.setAttribute("siteUserInfo", null);
		return "main/main";
	}

	@RequestMapping("join01.do")
	public String join01() {

		return "member/join01";
	}

	@RequestMapping("join02.do")
	public String join02() {

		return "member/join02";
	}

	@RequestMapping("join03.do")
	   public String join03(Model model, HttpServletRequest req) {

	      String ID = req.getParameter("ID");
	      String EMAIL = req.getParameter("EMAIL") + "@" + req.getParameter("email_domain");
	      String PHONE = req.getParameter("PHONE") + "-" + req.getParameter("mobile2") + "-"
	            + req.getParameter("mobile3");

	      sqlSession.getMapper(MybatisMemberImpl.class).register(req.getParameter("NAME"), req.getParameter("ID"),
	            req.getParameter("PASS1"), EMAIL, PHONE, req.getParameter("SMS_OK"), req.getParameter("EMAIL_OK"));
	      
	      String[] subject = { "국어", "수학", "영어", "사회", "과학" };

	      // 내신 성적 초기화
	      for (int i = 1; i <= 3; i++) {
	         for (int j = 1; j <= 2; j++) {
	            for (int k = 0; k < 5; k++) {
	               sqlSession.getMapper(MybatisMypageDAOImpl.class).sugrade(subject[k], "과목", 0, 0, 0, 0, 0, 0,
	                     i + "학년", j + "학기", ID);
	            }
	         }
	      }

	      return "member/join03";
	   }


	@RequestMapping("find_id.do")
	public String find_id() {

		return "member/find_id";
	}

	/*
	 * @RequestMapping(value = "/findingId" , method = RequestMethod.POST, produces
	 * = "application/json; charset=utf-8") public @ResponseBody String
	 * findingId(@ModelAttribute CoconutDTO vo, Model model , HttpServletResponse
	 * response)throws Exception {
	 * 
	 * System.out.println(vo.toString());
	 * 
	 * 
	 * ArrayList <String> emailList = MybatisMemberImpl.findId(vo);
	 * System.out.println(emailList.toString());
	 * System.out.println(emailList.get(0)); String findEmail =
	 * "{\"user_email\":\""+emailList+"\"}";
	 * 
	 * System.out.println(findEmail);
	 * 
	 * return findEmail; }
	 */
	/*
	 * @RequestMapping(value="/login.do",method = { RequestMethod.GET,
	 * RequestMethod.POST })
	 * 
	 * 
	 * public String login(Model model, HttpSession session) {
	 * 
	 * 
	 * String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
	 * 
	 * //https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***
	 * ************&
	 * //redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2F
	 * callback&state=e68c269c-5ba9-4c31-85da-54c16c658125 System.out.println("네이버:"
	 * + naverAuthUrl);
	 * 
	 * //네이버 model.addAttribute("url", naverAuthUrl);
	 * 
	 * 생성한 인증 URL을 View로 전달
	 * 
	 * return "member/login"; }
	 */

	@RequestMapping("find_pw.do")
	public String find_pw() {

		return "member/find_pw";
	}

	@RequestMapping("map.do")
	public String map() {

		return "member/map";
	}

	@ResponseBody
	@RequestMapping("getDupIdChk.do")
	public int getDupIdChk(@RequestParam("ID") String ID, HttpServletRequest request) {
		// ID 중복 체크 로직
		int dupCnt = sqlSession.getMapper(MybatisMemberImpl.class).selectDupIdChk(ID);
		return dupCnt;
	}

	@ResponseBody
	@RequestMapping("findid.do")
	public ArrayList<String> findid(@RequestParam("NAME") String NAME, @RequestParam("EMAIL") String EMAIL1,
			@RequestParam("email2") String email2, @RequestParam("PHONE") String PHONE1,
			@RequestParam("mp_no2") String mp_no2, @RequestParam("mp_no3") String mp_no3, HttpServletRequest request,
			HttpServletResponse response, Model model) {

		String EMAIL = request.getParameter("EMAIL") + "@" + request.getParameter("email2");
		String PHONE = request.getParameter("PHONE") + "-" + request.getParameter("mp_no2") + "-"
				+ request.getParameter("mp_no3");

		List<CoconutDTO> lists = new ArrayList<CoconutDTO>();

		lists = sqlSession.getMapper(MybatisMemberImpl.class).findId(NAME, EMAIL, PHONE);

		ArrayList<String> goodid = new ArrayList<String>();

		for (CoconutDTO id : lists) {
			System.out.println(id.getID());
			String ids = id.getID();

			goodid.add(ids);
		}

		return goodid;
	}

	@ResponseBody
	@RequestMapping("searchid.do")
	public int searchid(@RequestParam("ID") String ID, @RequestParam("NAME") String NAME,
			@RequestParam("EMAIL") String EMAIL1, @RequestParam("email2") String email2,
			@RequestParam("PHONE") String PHONE1, @RequestParam("mp_no2") String mp_no2,
			@RequestParam("mp_no3") String mp_no3, HttpServletRequest request, HttpSession session,
			HttpServletResponse response) throws Exception {

		String EMAIL = request.getParameter("EMAIL") + "@" + request.getParameter("email2");
		String PHONE = request.getParameter("PHONE") + "-" + request.getParameter("mp_no2") + "-"
				+ request.getParameter("mp_no3");

		int vo = sqlSession.getMapper(MybatisMemberImpl.class).searchid(ID, NAME, EMAIL, PHONE);

		return vo;
	}

	@ResponseBody
	@RequestMapping("findpw.do")
	public int update_pw(@RequestParam("ID") String ID, @RequestParam("NAME") String NAME,
			@RequestParam("EMAIL") String EMAIL1, @RequestParam("email2") String email2,
			@RequestParam("PHONE") String PHONE1, @RequestParam("mp_no2") String mp_no2,
			@RequestParam("mp_no3") String mp_no3, HttpServletRequest request, HttpServletResponse response,
			Model model) throws Exception {

		// CoconutDTO coconutDTO = new CoconutDTO();
		String EMAIL = request.getParameter("EMAIL") + "@" + request.getParameter("email2");
		String PHONE = request.getParameter("PHONE") + "-" + request.getParameter("mp_no2") + "-"
				+ request.getParameter("mp_no3");

		System.out.println(EMAIL);
		System.out.println(PHONE);

		String PASS1 = "";
		for (int i = 0; i < 12; i++) {
			PASS1 += (char) ((Math.random() * 26) + 97);
		}

		int retVal = sqlSession.getMapper(MybatisMemberImpl.class).update_pw(ID, NAME, EMAIL, PHONE, PASS1);

		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "dlwhdals118";

		// 보내는 사람 EMail, 패스워드, 제목, 내용
		final String fromEmail = "dlwhdals118@naver.com";
		final String hostSMTPpwd = "zhdl9187";
		String fromName = "Spring Homepage";
		String subject = "";
		String msg = "";

		subject = "Spring Homepage 임시 비밀번호 입니다.";
		msg += ID + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.";
		msg += "임시 비밀번호 : " + PASS1;

		Properties props = new Properties();
		props.put("mail.smtp.host", hostSMTP);
		props.put("mail.smtp.port", 587);
		props.put("mail.smtp.auth", "true");

		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(fromEmail, hostSMTPpwd);
			}
		});

		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(fromEmail));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(EMAIL));

			// 메일 제목
			message.setSubject(subject);

			// 메일 내용
			message.setText(msg);

			// send the message
			Transport.send(message);
			System.out.println("Success Message Send");
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		return retVal;
	}

}