package kr.co.teaspoon.service;

import kr.co.teaspoon.dto.GuestBook;

public interface GuestBookService {
    public void writeArticle(GuestBook guestBookDto) throws Exception;
}
