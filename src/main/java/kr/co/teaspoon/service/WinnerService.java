package kr.co.teaspoon.service;

import kr.co.teaspoon.dto.Winner;

import java.util.List;

public interface WinnerService {
    public List<Winner> winnerList() throws Exception;
    public Winner winnerDetail(int bno) throws Exception;
    public void winnerInsert(Winner dto) throws Exception;
    public void winnerDelete(int bno) throws Exception;
    public void winnerEdit(Winner dto) throws Exception;
}