package com.raspberry.board.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class BoardDto {
    private int b_num;
    private String b_title;
    private String b_contents;
    private String b_id;
    private String m_name;
    // DB의 datatime 타입과 연동이 잘됨
    private Timestamp b_date;
    private int b_views;
}
