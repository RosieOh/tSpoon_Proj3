package kr.co.teaspoon.dao;

import kr.co.teaspoon.dto.Edumag;
import kr.co.teaspoon.util.Page;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class EdumagDAOImpl implements EdumagDAO {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<Edumag> edumagList(Page page) throws Exception {
        return sqlSession.selectList("edumag.edumagList", page);
    }

    @Override
    public int totalCount(Page page) throws Exception {
        return sqlSession.selectOne("edumag.totalCount", page);
    }

    @Override
    public Edumag edumagDetail(int no) throws Exception {
        sqlSession.update("edumag.visitCount", no);
        return sqlSession.selectOne("edumag.edumagDetail", no);
    }

    @Override
    public void edumagInsert(Edumag dto) throws Exception {
        sqlSession.insert("edumag.edumagInsert", dto);
    }

    @Override
    public void edumagDelete(int no) throws Exception {
        sqlSession.delete("edumag.edumagDelete", no);
    }

    @Override
    public void edumagEdit(Edumag dto) throws Exception {
        sqlSession.update("edumag.edumagEdit", dto);
    }

    @Override
    public Edumag newEdumag() throws Exception {
        return sqlSession.selectOne("edumag.newEdumag");
    }
}
