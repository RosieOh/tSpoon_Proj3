package kr.co.teaspoon.service;

import kr.co.teaspoon.dto.EdumagComment;

import java.util.List;

public interface EdumagCommentService {
    public List<EdumagComment> edumagCommentList(int par) throws Exception;
    public void edumagCommentInsert(EdumagComment dto) throws Exception;
    public void edumagCommentDelete(int dno) throws Exception;
    public void edumagCommentEdit(EdumagComment dto) throws Exception;
}
