package kr.co.teaspoon.service;

import kr.co.teaspoon.dao.GuestBookDAO;
import kr.co.teaspoon.dto.GuestBook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class GuestBookServiceImpl implements GuestBookService {

    @Autowired
    private GuestBookDAO guestBookDAO;

    @Override
    @Transactional
    public void writeArticle(GuestBook guestBookDto) throws Exception {
        if(guestBookDto.getSubject() == null || guestBookDto.getContent() == null) {
            throw new Exception();
        }
        guestBookDAO.writeArticle(guestBookDto);
        guestBookDAO.fileRegister(guestBookDto);
    }
}
