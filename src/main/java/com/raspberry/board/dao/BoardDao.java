package com.raspberry.board.dao;

import com.raspberry.board.dto.BfileDto;
import com.raspberry.board.dto.BoardDto;
import com.raspberry.board.dto.ReplyDto;
import com.raspberry.board.dto.SearchDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardDao {
    // 게시글 목록 가져오는 메소드 선언
    List<BoardDto> selectBoardList(SearchDto search);
    // 게시글 개수 가져오는 메소드 선언
    int selectBoardCnt(SearchDto search);
    // 게시글 저장 메소드 선언
    void insertBoard(BoardDto board);
    // 게시글 파일 저장 메소드 선언
    void insertFile(BfileDto bf);
    // 게시글 1개 가져오는 메소드 선언
    BoardDto selectBoard(Integer b_num);
    // 파일 목록 가져오는 메소드 선언
    List<BfileDto> selectFiles(Integer b_num);
    // 댓글 목록 가져오는 메소드 선언
    List<ReplyDto> selectReply(Integer b_num);
    // 댓글 저장 메소드 선언
    void insertReply(ReplyDto reply);
    // 추가한 댓글 가져오는 메소드 선언
    ReplyDto selectLastReply(Integer r_num);
    // 댓글 목록 삭제 메소드 선언
    void deleteReply(Integer b_num);
    // 파일의 sysname 목록 가져오는 메소드 선언
    List<String> selectSysname(Integer b_num);
    // 파일 목록 삭제 메소드 선언
    void deleteFile(Integer b_num);
    // 게시글 삭제 메소드 선언
    void deleteBoard(Integer b_num);
    // 게시글 수정 메소드 선언
    void updateBoard(BoardDto board);

    void deleteSingleFile(String sysname);
}
