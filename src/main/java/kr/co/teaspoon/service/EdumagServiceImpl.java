package kr.co.teaspoon.service;

import kr.co.teaspoon.dao.EdumagDAO;
import kr.co.teaspoon.dto.Edumag;
import kr.co.teaspoon.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EdumagServiceImpl implements  EdumagService{

    @Autowired
    private EdumagDAO edumagDAO;

    @Override
    public List<Edumag> edumagList(Page page) throws Exception {
        return edumagDAO.edumagList(page);
    }

    @Override
    public int totalCount(Page page) throws Exception {
        return edumagDAO.totalCount(page);
    }

    @Override
    public Edumag edumagDetail(int no) throws Exception {
        return edumagDAO.edumagDetail(no);
    }

    @Override
    public void edumagInsert(Edumag dto) throws Exception {
        edumagDAO.edumagInsert(dto);
    }

    @Override
    public void edumagDelete(int no) throws Exception {
        edumagDAO.edumagDelete(no);
    }

    @Override
    public void edumagEdit(Edumag dto) throws Exception {
        edumagDAO.edumagEdit(dto);
    }

    @Override
    public Edumag newEdumag() throws Exception {
        return edumagDAO.newEdumag();
    }
}
