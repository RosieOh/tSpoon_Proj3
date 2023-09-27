package kr.co.teaspoon.dao;

import kr.co.teaspoon.dto.EdumagComment;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class EdumagCommentDAOImpl implements EdumagCommentDAO {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<EdumagComment> edumagCommentList(int par) throws Exception {
        return sqlSession.selectList("edumagComment.edumagCommentList", par);
    }

    @Override
    public void edumagCommentInsert(EdumagComment dto) throws Exception {
        sqlSession.insert("edumagComment.edumagCommentInsert", dto);
    }

    @Override
    public void edumagCommentDelete(int dno) throws Exception {
        sqlSession.delete("edumagComment.edumagCommentDelete", dno);
    }

    @Override
    public void edumagCommentEdit(EdumagComment dto) throws Exception {
        sqlSession.update("edumagComment.edumagCommentEdit", dto);
    }
}

