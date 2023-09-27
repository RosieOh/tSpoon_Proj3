package kr.co.teaspoon.dao;

import kr.co.teaspoon.dto.Winner;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class WinnerDAOImpl implements WinnerDAO {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<Winner> winnerList() throws Exception {
        return sqlSession.selectList("winner.winnerList");
    }

    @Transactional
    @Override
    public Winner winnerDetail(int bno) throws Exception {
        sqlSession.update("winner.visitCount", bno);
        return sqlSession.selectOne("winner.winnerDetail", bno);
    }

    @Override
    public void winnerInsert(Winner dto) throws Exception {
        sqlSession.insert("winner.winnerInsert", dto);
    }

    @Override
    public void winnerDelete(int bno) throws Exception {
        sqlSession.delete("winner.winnerDelete", bno);
    }

    @Override
    public void winnerEdit(Winner dto) throws Exception {
        sqlSession.update("winner.winnerEdit", dto);
    }
}
