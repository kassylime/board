package com.raspberry.board.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.sql.Timestamp;

@Data
public class ReplyDto {
    private int r_num;
    private int r_bnum;
    private String r_contents;
    private String r_id;
    @JsonFormat(pattern = "yy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
    private Timestamp r_date;
}
