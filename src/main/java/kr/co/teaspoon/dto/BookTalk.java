package kr.co.teaspoon.dto;

import lombok.Data;

@Data
public class BookTalk {
    private int bno;
    private String title;
    private String content;
    private String regdate;
    private int visited;
    private String id;
    private int rec;
    private int count;
}
