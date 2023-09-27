package kr.co.teaspoon.dto;

import lombok.Data;

@Data
public class Notice {
    private int nno;
    private String title;
    private String content;
    private String resdate;
    private int visit;
    private int count;
}
