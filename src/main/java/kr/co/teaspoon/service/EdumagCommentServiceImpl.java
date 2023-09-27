package kr.co.teaspoon.service;

import kr.co.teaspoon.dao.EdumagCommentDAO;
import kr.co.teaspoon.dto.Edumag;
import kr.co.teaspoon.dto.EdumagComment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EdumagCommentServiceImpl implements EdumagCommentService{

    @Autowired
    private EdumagCommentDAO edumagCommentDAO;

    @Override
    public List<EdumagComment> edumagCommentList(int par) throws Exception {
        return edumagCommentDAO.edumagCommentList(par);
    }

    @Override
    public void edumagCommentInsert(EdumagComment dto) throws Exception {
        edumagCommentDAO.edumagCommentInsert(dto);
    }

    @Override
    public void edumagCommentDelete(int dno) throws Exception {
        edumagCommentDAO.edumagCommentDelete(dno);
    }

    @Override
    public void edumagCommentEdit(EdumagComment dto) throws Exception {
        edumagCommentDAO.edumagCommentEdit(dto);
    }
}
