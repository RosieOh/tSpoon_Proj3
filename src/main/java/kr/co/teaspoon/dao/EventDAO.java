package kr.co.teaspoon.dao;

import kr.co.teaspoon.dto.Event;

import java.util.List;

public interface EventDAO {
    public List<Event> eventList() throws Exception;
    public Event eventDetail(int bno) throws Exception;
    public void eventInsert(Event dto) throws Exception;
    public void eventDelete(int bno) throws Exception;
    public void eventEdit(Event dto) throws Exception;
}
