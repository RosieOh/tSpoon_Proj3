package kr.co.teaspoon.dao;

import kr.co.teaspoon.dto.GuestBook;

public interface GuestBookDAO {
    public void writeArticle(GuestBook guestBookDto) throws Exception;
    public void fileRegister(GuestBook guestBookDto) throws Exception;
}