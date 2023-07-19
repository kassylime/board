package com.raspberry.board.service;

import com.raspberry.board.Util.PaginUtil;
import com.raspberry.board.dao.BoardDao;
import com.raspberry.board.dao.MemberDao;
import com.raspberry.board.dto.*;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

@Service
@Slf4j
public class BoardService {
    // DAO 들어갈 자리
    @Autowired
    private BoardDao bDao;
    @Autowired
    private MemberDao mDao;

    private ModelAndView mv;

    public ModelAndView getBoradList(SearchDto search, HttpSession session) {

        log.info("getBoardList()");
        mv = new ModelAndView();

        int lcnt = 10; // 보여질 게시글 목록의 수
        // SQL 쿼리문의 limit 부분 설정
        int num = search.getPageNum();
        // limit 0, 5 - 1페이지
        // limit 5, 5 - 2페이지
        // limit 10, 5 - 3페이지
        // (pageNum - 1) * lcnt

        if (search.getListCnt() == 0) {
            search.setListCnt(lcnt);
        }

        search.setPageNum((num - 1) * search.getListCnt()); // 보여질 게시글 목록의 수

        List<BoardDto> bList = bDao.selectBoardList(search); //Dao로 게시글 목록 가져오기
        mv.addObject("bList", bList);

        //  페이징 처리
        search.setPageNum(num);
        String pageHtml = getPaging(search);
        mv.addObject("paging", pageHtml);

        session.setAttribute("pageNum", num);
        if (search.getColname() != null) {
            session.setAttribute("search", search);
        } else {
            session.removeAttribute("search");
        }
        mv.setViewName("boardList");
        return mv;
    }

    private String getPaging(SearchDto search) {
        String pageHtml = null;

        int maxNum = bDao.selectBoardCnt(search);
        int pageCnt = 5;
        String listName = null;
        if (search.getColname() != null) {
            listName = "list?colname=" + search.getColname() + "&keyword=" + search.getKeyword() + "&";
        } else {
            listName = "list?";
        }
        PaginUtil paging = new PaginUtil(maxNum, search.getPageNum(), search.getListCnt(), pageCnt, listName);
        pageHtml = paging.makePaging();
        return pageHtml;
    }

    public String boardWrite(List<MultipartFile> files, BoardDto board, HttpSession session, RedirectAttributes rttr) {
        log.info("boardWrite()");
        String view = null;
        String msg = null;

        try {
            // 글 내용 저장
            bDao.insertBoard(board);
            log.info("게시글 번호 : " + board.getB_num());
            // 파일 업로드 처리
            fileUpload(files, session, board);

            // 포인트 증가처리
            MemberDto member = (MemberDto) session.getAttribute("mb");
            int point = member.getM_point() + 1;
            if (point > 100) {
                point = 100;
            }
            member.setM_point(point);
            mDao.updateMemberpoint(member);
            session.setAttribute("mb", member);
            view = "redirect:list?pageNum=1";
            msg = "글 작성 성공";

        } catch (Exception e) {
            e.printStackTrace();
            view = "redirect:writeForm";
            msg = "글 작성 실패";
        }
        rttr.addFlashAttribute("msg", msg);
        return view;
    }

    // 파일 업로드
    private void fileUpload(List<MultipartFile> files, HttpSession session, BoardDto borad) throws Exception {
        log.info("fileUpload()");

        String realPath = session.getServletContext().getRealPath("/");
        realPath += "upload/";

        File folder = new File(realPath);
        if (!folder.isDirectory()) {
            folder.mkdir();
        }
        for (MultipartFile mf : files) {
            String oriname = mf.getOriginalFilename();
            if (oriname.equals("")) {
                return;
            }

            BfileDto bf = new BfileDto();
            bf.setBf_bnum(borad.getB_num());
            bf.setBf_oriname(oriname);
            String sysname = System.currentTimeMillis() + oriname.substring(oriname.lastIndexOf("."));
            bf.setBf_sysname(sysname);

            File file = new File(realPath + sysname);
            mf.transferTo(file);

            bDao.insertFile(bf);
        }
    }


    public ModelAndView getBoard(Integer b_num) {
        log.info("getBoard()");
        mv = new ModelAndView();

        // 글 내용
        BoardDto board = bDao.selectBoard(b_num);
        // 파일 목록
        List<BfileDto> fList = bDao.selectFiles(b_num);
        // 댓글 목록
        List<ReplyDto> rList = bDao.selectReply(b_num);

        mv.addObject("board", board);
        mv.addObject("fList", fList);
        mv.addObject("rList", rList);
        mv.setViewName("boardContents");
        return mv;
    }

    // 파일 다운로드
    public ResponseEntity<Resource> fileDownload(BfileDto bfile, HttpSession session) throws IOException {
        log.info("fileDownload()");
        String realpath = session.getServletContext().getRealPath("/");
        realpath +="upload/" + bfile.getBf_sysname();
        InputStreamResource fRes = new InputStreamResource(new FileInputStream(realpath));
        String fileName = URLEncoder.encode(bfile.getBf_oriname(), "UTF-8");
        return ResponseEntity.ok().contentType(MediaType.APPLICATION_OCTET_STREAM)
                .cacheControl(CacheControl.noCache()).header(HttpHeaders.CONTENT_DISPOSITION,
                        "attachment; filename=" + fileName).body(fRes);
    }

    public ReplyDto replyInsert(ReplyDto reply){
        log.info("replyInsert()");
        try{
            bDao.insertReply(reply); // 댓글 저장
            // DB에 저장된 댓글 가져오기
            reply = bDao.selectLastReply(reply.getR_num());
        } catch (Exception e){
            e.printStackTrace();
            reply = null;
        }
        return reply;
    }

    public String boardDelete(Integer b_num, HttpSession session, RedirectAttributes rttr) {
        log.info("boardDelete()");
        String view = null;
        String msg = null;

        try {
            // 댓글
            bDao.deleteReply(b_num);
            // 파일 삭제
            deleteFile(b_num, session);
            // 파일 정보 삭제
            bDao.deleteFile(b_num);
            // 게시글 삭제
            bDao.deleteBoard(b_num);

            view = "redirect:list?pageNum=1";
            msg = "삭제 성공";
        } catch (Exception e) {
            e.printStackTrace();
            view = "redirect:contents?b_num=" + b_num;
            msg = "삭제 실패";
        }
        rttr.addFlashAttribute("msg", msg);
        return view;
    }

    private void deleteFile(Integer b_num, HttpSession session) throws Exception{
        log.info("deleteFile()");
        List<String> sList = bDao.selectSysname(b_num);

        String realpath = session.getServletContext().getRealPath("/");
        realpath +="upload/";

        for(String sn : sList){
            File file = new File(realpath + sn);
            if(file.exists()){
                file.delete();
            }
        }
    }

    // 수정
    public ModelAndView updateForm(Integer b_num) {
        log.info("updateForm()");
        BoardDto board = bDao.selectBoard(b_num);
        List<BfileDto> fList = bDao.selectFiles(b_num);

        mv = new ModelAndView();
        mv.addObject("board", board);
        mv.addObject("fList", fList);

        mv.setViewName("updateForm");
        return mv;
    }

    public String updateBoard(List<MultipartFile> files, BoardDto board, HttpSession session, RedirectAttributes rttr) {
        log.info("updateBoard()");
        String view = null;
        String msg = null;

        try {
            bDao.updateBoard(board);
            fileUpload(files, session, board);
            view = "redirect:contents?b_num=" + board.getB_num();
            msg = "수정 성공";
        } catch (Exception e) {
            e.printStackTrace();
            view = "redirect:updateForm?b_num=" + board.getB_num();
            msg = "수정 실패";
        }
        rttr.addFlashAttribute("msg", msg);
        return view;
    }

    // 개별 파일 삭제
    public List<BfileDto> fileDelete(String sysname, Integer bnum, HttpSession session){
        log.info("fileDelete()");
        List<BfileDto> fList = null;

        // 파일 삭제를 위한 실제 경로 구하기
        String realpath = session.getServletContext().getRealPath("/");
        realpath = "upload/" + sysname;

        try {
            // 파일 삭제
            File file = new File(realpath);
            if(file.exists()){
                if(file.delete()){
                    // 파일 정보 삭제(파일 삭제 성공 시)
                    bDao.deleteSingleFile(sysname);
                    // 나머지 파일 목록 다시 가져오기
                    fList = bDao.selectFiles(bnum);
                }
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return fList;
    }
}
