package com.green.gamezone;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import criTest.GamePageMaker;
import criTest.GameSearchCriteria;
import service.MobileGameService;
import vo.GameVO;
import vo.RankingVO;

@Controller
public class MobileGameController {

	@Autowired
	MobileGameService service;
	
//----------------------------------------------------------------------------------------------------------------------
	
	// ** Ajax mobileGameList
	@RequestMapping(value = "/axMobileGame")
	public ModelAndView axMobileGame(ModelAndView mv, GameSearchCriteria gameCriteria, GamePageMaker gamePageMaker) {
	
		// ** 순위 출력
		List<GameVO> list = new ArrayList<GameVO>();
	
		list = service.showList();
	
		if (list != null) {
			mv.addObject("rank", list);
	
		} else {
			mv.addObject("message", "출력 자료가 없습니다.");
		}
	
		gameCriteria.setSnoEno();
	
		// 1) Criteria 처리
		gameCriteria.setCheck(null);
	
		// 2) 서비스 처리
		mv.addObject("list", service.mobileGameList(gameCriteria));
	
		// 3) View 처리 => gamePageMaker
		gamePageMaker.setCri(gameCriteria);
		gamePageMaker.setTotalRowsCount(service.viewCount(gameCriteria));
	
		mv.addObject("gamePageMaker", gamePageMaker);
	
		mv.setViewName("/mobileGame/axMobileGame");
	
		return mv;
	
	} // Ajax mobileGameList
	
	
	// ** mobileGameList
	@RequestMapping(value = "/mobileGameList")
	public ModelAndView mobileGameList(HttpServletRequest request, HttpServletResponse response, ModelAndView mv,
										GameSearchCriteria gameCriteria, GamePageMaker gamePageMaker) {
	
		// ** 순위 출력
		List<GameVO> list = new ArrayList<GameVO>();
	
		list = service.showList();
	
		if (list != null) {
			mv.addObject("rank", list);
	
		} else {
			mv.addObject("message", "출력 자료가 없습니다.");
		}
	
		gameCriteria.setSnoEno();
	
		// 1) Criteria 처리
		if (gameCriteria.getCheck() != null && gameCriteria.getCheck().length < 1) {
			gameCriteria.setCheck(null);
		}
	
		// 2) 서비스 처리
		mv.addObject("list", service.mobileGameList(gameCriteria));
	
		// 3) View 처리 => gamePageMaker
		gamePageMaker.setCri(gameCriteria);
		gamePageMaker.setTotalRowsCount(service.viewCount(gameCriteria));
	
		mv.addObject("gamePageMaker", gamePageMaker);
	
		mv.setViewName("/mobileGame/mobileGameList");
		return mv;
	
	} // mobileGameList
	
//----------------------------------------------------------------------------------------------------------------------------------------

    // Insert Game
 	@RequestMapping(value = "/insertMobileForm")
 	public ModelAndView insertMobileForm(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {

 		mv.setViewName("/mobileGame/insertMobileGame");
 		return mv;

 	} // insertMobileForm
    
 	
	@RequestMapping(value = "/insertMobileGame")
	public ModelAndView insertMobileGame(HttpServletRequest request, HttpServletResponse response, ModelAndView mv, GameVO vo, RedirectAttributes rttr) throws IOException {
		
		// 1. 요청분석
		String uri = "redirect:axMobileGame";

		String realPath = request.getRealPath("/"); // deprecated Method
		System.out.println("** realPath = " + realPath);

		// 2) 위의 값을 이용해서 실제 저장위치 확인
		if (realPath.contains(".eclipse."))
			realPath = "C:\\MTest\\myWork\\GameZone\\src\\main\\webapp\\resources\\mobileGameImg\\";

		else
			realPath += "resources\\mobileGameImg\\";

		// ** 폴더 만들기 (File 클래스활용)
		File f1 = new File(realPath);
		if (!f1.exists())
			f1.mkdir();

		// ** 기본 이미지 지정하기
		String file1, file2 = "resources/mobileGameImg/gamelogo.png";

		MultipartFile uploadimgfile = vo.getUploadimgfile();
		if (uploadimgfile != null && !uploadimgfile.isEmpty()) {

			// ** Image를 선택 함 -> Image 저장 (경로_realPath + 파일명)
			// 1) 물리적 저장경로에 Image 저장
			file1 = realPath + uploadimgfile.getOriginalFilename();
			uploadimgfile.transferTo(new File(file1));

			// 2) Table 저장 준비
			file2 = "resources/mobileGameImg/" + uploadimgfile.getOriginalFilename();
		}

		// ** 완성된 경로 vo에 set
		vo.setGame_img(file2);

		// 2. Service 처리
		if (service.insertMobileGame(vo) > 0) {
			mv.addObject("message", "게임이 등록되었습니다.");

		} else {
			mv.addObject("message", "게임 등록 실패, 다시 시도해주세요.");
			uri = "/mobileGame/insertMobileGame";
		}

		// 3. 결과(View -> Forward) 처리
		mv.setViewName(uri);
		return mv;

	} // insertMobileGame
	
//----------------------------------------------------------------------------------------------------------------------------------------
	
	// ** Detail
	@RequestMapping(value = "/detailMobileGame")
	public ModelAndView detailMobileGame(HttpServletRequest request, HttpServletResponse response, GameVO vo, ModelAndView mv, RankingVO rvo) {
	   
		// 1. 요청분석
	    String uri = "/mobileGame/detailMobileGame";
	    String loginID = (String)request.getSession().getAttribute("loginID");
	      
	    // 2. Service 처리
	    vo = service.detailMobileGame(vo);

		if (vo != null ) {
			// 조회수 증가 부분
		    rvo.setId(loginID);
		    rvo.setGame_number(vo.getGame_number());
		    if (service.selectOne(rvo) == null) {
		    	
		    	// CountUp 필요, insertInfo
			    if ( service.insertInfo(rvo) > 0) {
			    	service.countUp(vo);
			    	vo.setCount(vo.getCount() + 1); 
			    	
			    } else {
			    	System.out.println("** service.insertInfo(rvo) 실패로 조회수 증가 실패 **");
			    }
		    } // service.selectOne(rvo)
			
			// ** 수정요청인지 확인
			if ("U".equals(request.getParameter("jCode"))) {
				uri = "/mobileGame/updateMobileGame"; 
			}	
			
			// 2-3) 결과전달
			request.setAttribute("one", vo);
			
		} else {
				mv.addObject("message", "게임 이름에 해당하는 자료가 없습니다.");
		} // vo != null
		
		// 3. View
		mv.setViewName(uri);
		
		return mv;
	
	 } // detailMobileGame
	
//----------------------------------------------------------------------------------------------------------------------------------------
	
	// ** Update : Game 정보 수정하기
	@RequestMapping(value = "/updateMobileGame", method = RequestMethod.POST)
	public ModelAndView updateMobileGame(HttpServletRequest request, HttpServletResponse response, ModelAndView mv, GameVO vo) throws IOException {

		// 1. 요청분석
		String uri = "/mobileGame/detailMobileGame";

		mv.addObject("one", vo);

		String realPath = request.getRealPath("/"); // deprecated Method

		// 2) 위의 값을 이용해서 실제 저장위치 확인
		if (realPath.contains(".eclipse."))
			realPath = "C:\\MTest\\myWork\\GameZone\\src\\main\\webapp\\resources\\mobileGameImg\\";

		else
			realPath += "resources\\mobileGameImg\\";

		// ** 폴더 만들기 (File 클래스활용)
		File f1 = new File(realPath);
		if (!f1.exists())
			f1.mkdir();

		// ** 기본 이미지 지정하기
		String file1, file2 = "resources/mobileGameImg/gamelogo.png";

		MultipartFile uploadimgfile = vo.getUploadimgfile();
		if (uploadimgfile != null && !uploadimgfile.isEmpty()) {

			// ** Image를 선택 함 -> Image 저장 (경로_realPath + 파일명)
			// 1) 물리적 저장경로에 Image 저장
			file1 = realPath + uploadimgfile.getOriginalFilename();
			uploadimgfile.transferTo(new File(file1));

			// 2) Table 저장 준비
			file2 = "resources/mobileGameImg/" + uploadimgfile.getOriginalFilename();
			vo.setGame_img(file2);
		}
		// ** 완성된 경로 vo에 set

		// 2. Service 처리
		if (service.updateMobileGame(vo) > 0) {
			mv.addObject("message", "게임이 수정되었습니다.");
			mv.addObject("one", vo); // 수정된 vo를 보관

		} else {
			mv.addObject("message", "게임 수정 실패, 다시 수정 해주세요.");
			uri = "/mobileGame/updateMobileGame";
		}

		// 3. 결과(ModelAndView) 전달
		mv.setViewName(uri);
		return mv;

	} // updateMobileGame

//----------------------------------------------------------------------------------------------------------------------------------------
	
	// ** Delete : Game 삭제
	@RequestMapping(value = "/deleteMobileGame")
	public ModelAndView deleteMobileGame(HttpServletRequest request, HttpServletResponse response, ModelAndView mv, GameVO vo, RedirectAttributes rttr) {
		
		// 1. 요청분석
		String uri = "redirect:axMobileGame";

		// 2. Service 처리
		if (service.deleteMobileGame(vo) > 0) {
			rttr.addFlashAttribute("message", "게임이 삭제되었습니다.");

		} else {
			rttr.addFlashAttribute("message", "게임 삭제 실패, 다시 시도해주세요.");
			uri = "redirect:detailMobileGame?game_name=" + vo.getGame_name();
		} // Service

		// 3. 결과(ModelAndView) 전달
		mv.setViewName(uri);
		return mv;
	
	} // deleteMobileGame

}
