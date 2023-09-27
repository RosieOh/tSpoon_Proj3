package kr.co.teaspoon.dto;

import lombok.Data;

@Data
public class QnaComment {
    private int cno;
    private int qno;
    private String content;
    private String resdate;
    private String author;
    private String name;
}
