package kr.co.teaspoon.dto;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class EdumagComment {
    private int dno;
    private String author;
    private String content;
    private String regdate;
    private int par;
}