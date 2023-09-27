package kr.co.teaspoon.dao;

import kr.co.teaspoon.dto.QnaComment;
import kr.co.teaspoon.dto.Qna;
import kr.co.teaspoon.util.Page;

import java.util.List;

public interface QnaDAO {
    public List<Qna> qnaList(Page page) throws Exception;
    public Qna qnaDetail(int qno) throws Exception;
    public void qnaInsert(Qna dto) throws Exception;
    public void qnaDelete(Qna dto) throws Exception;
    public void qnaEdit(Qna dto) throws Exception;
    public int totalCount(Page page) throws Exception;
    public List<Qna> selectBest() throws Exception;
    public List<Qna> selectVisit() throws Exception;
    public List<QnaComment> qnaCommentList(int qno) throws Exception;
    public void commentInsert(QnaComment dto) throws Exception;
    public void commentDelete(int cno) throws Exception;
    public List<Qna> commentCount() throws Exception;
}
