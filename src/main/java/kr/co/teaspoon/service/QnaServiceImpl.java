package kr.co.teaspoon.service;

import kr.co.teaspoon.dao.QnaDAO;
import kr.co.teaspoon.dto.Qna;
import kr.co.teaspoon.dto.QnaComment;
import kr.co.teaspoon.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QnaServiceImpl implements QnaService {
    @Autowired
    private QnaDAO qnaDAO;

    @Override
    public List<Qna> qnaList(Page page) throws Exception {
        return qnaDAO.qnaList(page);
    }

    @Override
    public Qna qnaDetail(int qno) throws Exception {
        return qnaDAO.qnaDetail(qno);
    }

    @Override
    public void qnaInsert(Qna dto) throws Exception {
        qnaDAO.qnaInsert(dto);
    }


    @Override
    public void qnaDelete(Qna dto) throws Exception {
        qnaDAO.qnaDelete(dto);
    }

    @Override
    public void qnaEdit(Qna dto) throws Exception {
        qnaDAO.qnaEdit(dto);
    }
    @Override
    public int totalCount(Page page) throws Exception {
        return qnaDAO.totalCount(page);
    }

    @Override
    public List<Qna> selectBest() throws Exception {
        return qnaDAO.selectBest();
    }

    @Override
    public List<Qna> selectVisit() throws Exception {
        return qnaDAO.selectVisit();
    }

    @Override
    public List<QnaComment> qnaCommentList(int qno) throws Exception {
        return qnaDAO.qnaCommentList(qno);
    }

    @Override
    public void commentInsert(QnaComment dto) throws Exception {
        qnaDAO.commentInsert(dto);
    }

    @Override
    public void commentDelete(int cno) throws Exception {
        qnaDAO.commentDelete(cno);
    }

    @Override
    public List<Qna> commentCount() throws Exception {
        return qnaDAO.commentCount();
    }
}
