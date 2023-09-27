package kr.co.teaspoon.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class GuestBook {
    private int articleno;
    private String userid;
    private String subject;
    private String content;
    private String regtime;
    private List<FileInfo> fileInfos;
}
