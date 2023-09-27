package kr.co.teaspoon.dao;

import kr.co.teaspoon.dto.Event;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class EventDAOImpl implements EventDAO {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<Event> eventList() throws Exception {
        return sqlSession.selectList("event.eventList");
    }

    @Transactional
    @Override
    public Event eventDetail(int bno) throws Exception {
        sqlSession.update("event.visitCount", bno);
        return sqlSession.selectOne("event.eventDetail", bno);
    }

    @Override
    public void eventInsert(Event dto) throws Exception {
        sqlSession.insert("event.eventInsert", dto);
    }

    @Override
    public void eventDelete(int bno) throws Exception {
        sqlSession.delete("event.eventDelete", bno);
    }

    @Override
    public void eventEdit(Event dto) throws Exception {
        sqlSession.update("event.eventEdit", dto);
    }
}
