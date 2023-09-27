package kr.co.teaspoon.dao;

import kr.co.teaspoon.dto.BookTalk;
import kr.co.teaspoon.dto.BookTalkComment;
import kr.co.teaspoon.dto.BookReco;
import kr.co.teaspoon.util.Page;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class BookTalkDAOImpl implements BookTalkDAO {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<BookTalk> bookTalkList(Page page) throws Exception {
        return sqlSession.selectList("booktalk.booktalkList", page);
    }

    @Transactional
    @Override
    public BookTalk bookTalkDetail(int bno) throws Exception {
        sqlSession.update("booktalk.visitCount", bno);
        return sqlSession.selectOne("booktalk.booktalkDetail", bno);
    }

    @Override
    public void bookTalkInsert(BookTalk dto) throws Exception {
        sqlSession.insert("booktalk.booktalkInsert", dto);
    }

    @Override
    public void bookTalkDelete(int bno) throws Exception {
        sqlSession.delete("booktalk.booktalkDelete", bno);
    }

    @Override
    public void bookTalkEdit(BookTalk dto) throws Exception {
        sqlSession.update("booktalk.booktalkEdit", dto);
    }

    @Override
    public int totalCount(Page page) throws Exception {
        return sqlSession.selectOne("booktalk.totalCount", page);
    }

    @Override
    public List<BookTalk> bookTalkBestRecList() throws Exception {
        return sqlSession.selectList("booktalk.booktalkBestRecList");
    }

    @Override
    public List<BookTalk> bookTalkBestCmtList() throws Exception {
        return sqlSession.selectList("booktalk.booktalkBestCmtList");
    }

    @Override
    public List<BookTalkComment> bookTalkCommentList(int bno) throws Exception {
        return sqlSession.selectList("booktalk.booktalkCommentList", bno);
    }

    @Override
    public void commentInsert(BookTalkComment dto) throws Exception {
        sqlSession.insert("booktalk.commentInsert", dto);
    }

    @Override
    public void commentDelete(int cno) throws Exception {
        sqlSession.delete("booktalk.commentDelete", cno);
    }

    @Override
    public List<BookTalk> commentCount() throws Exception {
        return sqlSession.selectList("booktalk.commentCount");
    }

    @Override
    public BookReco findBookReco(int bno, String id) throws Exception {
        Map<String, Object> map = new HashMap<>();
        map.put("bno", bno);
        map.put("id", id);
        return sqlSession.selectOne("booktalk.findBookReco",map);
    }

    @Override
    public BookReco memberFindBookReco(BookReco reco) throws Exception {
        return sqlSession.selectOne("booktalk.memberFindBookReco", reco);
    }

    @Override
    public int insertBookReco(BookReco reco) throws Exception {
        return sqlSession.insert("booktalk.insertBookReco", reco);
    }

    @Override
    public void deleteBookReco(BookReco reco) throws Exception {
        sqlSession.delete("booktalk.deleteBookReco", reco);
    }

    @Override
    public void increaseRec(BookReco reco) throws Exception {
        sqlSession.update("booktalk.increaseRec", reco);
    }

    @Override
    public void decreaseRec(BookReco reco) throws Exception {
        sqlSession.update("booktalk.decreaseRec", reco);
    }
}
