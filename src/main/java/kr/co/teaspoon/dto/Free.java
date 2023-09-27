package kr.co.teaspoon.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Free {
    private int bno;
    private String title;
    private String content;
    private String regdate;
    private int visited;
    private String id;
    private int rec;
    private int count;
}
