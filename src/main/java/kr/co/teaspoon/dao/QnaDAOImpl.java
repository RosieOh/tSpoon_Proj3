package kr.co.teaspoon.dao;

import kr.co.teaspoon.dto.Qna;
import kr.co.teaspoon.dto.QnaComment;
import kr.co.teaspoon.util.Page;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class QnaDAOImpl implements QnaDAO {
    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<Qna> qnaList(Page page) throws Exception {
        return sqlSession.selectList("qna.qnaList",page);
    }

    @Override
    public Qna qnaDetail(int qno) throws Exception {
        sqlSession.update("qna.countUp", qno);
        return sqlSession.selectOne("qna.qnaDetail", qno);
    }

    @Transactional
    @Override
    public void qnaInsert(Qna dto) throws Exception {
        sqlSession.insert("qna.qnaInsert",dto );
        sqlSession.update("qna.qnaInsertUpdate");
    }

    @Override
    public void qnaDelete(Qna dto) throws Exception {
        sqlSession.delete("qna.qnaDelete",dto);
    }

    @Override
    public void qnaEdit(Qna dto) throws Exception {
        sqlSession.update("qna.qnaEdit", dto);
    }
    @Override
    public int totalCount(Page page) throws Exception {
        return sqlSession.selectOne("qna.totalCount", page);
    }

    @Override
    public List<Qna> selectBest() throws Exception {
        return sqlSession.selectList("qna.selectBest");
    }

    @Override
    public List<Qna> selectVisit() throws Exception {
        return sqlSession.selectList("qna.selectVisit");
    }

    @Override
    public List<QnaComment> qnaCommentList(int qno) throws Exception {
        return sqlSession.selectList("qna.qnaCommentList",qno);
    }

    @Override
    public void commentInsert(QnaComment dto) throws Exception {
        sqlSession.insert("qna.commentInsert",dto );
    }

    @Override
    public void commentDelete(int cno) throws Exception {
        sqlSession.delete("qna.commentDelete", cno);
    }

    @Override
    public List<Qna> commentCount() throws Exception {
        return sqlSession.selectList("qna.commentCount");
    }


}
