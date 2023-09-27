package kr.co.teaspoon.dao;

import kr.co.teaspoon.dto.Notice;
import kr.co.teaspoon.dto.NoticeComment;
import kr.co.teaspoon.util.Page;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class NoticeDAOImpl implements NoticeDAO{
    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<Notice> noticeList(Page page) throws Exception {
        return sqlSession.selectList("notice.noticeList",page);
    }

    @Override
    public Notice noticeDetail(int nno) throws Exception {
        sqlSession.update("notice.countUp", nno);
        return sqlSession.selectOne("notice.noticeDetail", nno);
    }

    @Override
    public void noticeInsert(Notice dto) throws Exception {
        sqlSession.insert("notice.noticeInsert",dto );
    }

    @Override
    public void noticeDelete(int nno) throws Exception {
        sqlSession.delete("notice.noticeDelete",nno);
    }

    @Override
    public void noticeEdit(Notice dto) throws Exception {
        sqlSession.update("notice.noticeEdit", dto);
    }
    @Override
    public int totalCount(Page page) throws Exception {
        return sqlSession.selectOne("notice.totalCount", page);
    }

    @Override
    public List<NoticeComment> noticeCommentList(int nno) throws Exception {
        return sqlSession.selectList("notice.noticeCommentList",nno);
    }

    @Override
    public void commentInsert(NoticeComment dto) throws Exception {
        sqlSession.insert("notice.commentInsert",dto );
    }

    @Override
    public void commentDelete(int cno) throws Exception {
        sqlSession.delete("notice.commentDelete", cno);
    }

    @Override
    public List<Notice> selectComment() throws Exception {
        return sqlSession.selectList("notice.selectComment");
    }

    @Override
    public List<Notice> commentCount() throws Exception {
        return sqlSession.selectList("notice.commentCount");
    }

    @Override
    public List<Notice> newNotice() throws Exception {
        return sqlSession.selectList("notice.newNotice");
    }
}