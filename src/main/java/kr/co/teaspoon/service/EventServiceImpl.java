package kr.co.teaspoon.service;

import kr.co.teaspoon.dao.EventDAO;
import kr.co.teaspoon.dto.Event;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EventServiceImpl implements EventService {

    @Autowired
    private EventDAO eventDAO;

    @Override
    public List<Event> eventList() throws Exception {
        return eventDAO.eventList();
    }

    @Override
    public Event eventDetail(int bno) throws Exception {
        return eventDAO.eventDetail(bno);
    }

    @Override
    public void eventInsert(Event dto) throws Exception {
        eventDAO.eventInsert(dto);
    }

    @Override
    public void eventDelete(int bno) throws Exception {
        eventDAO.eventDelete(bno);
    }

    @Override
    public void eventEdit(Event dto) throws Exception {
        eventDAO.eventEdit(dto);
    }
}
