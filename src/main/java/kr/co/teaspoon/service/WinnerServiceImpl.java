package kr.co.teaspoon.service;

import kr.co.teaspoon.dao.WinnerDAO;
import kr.co.teaspoon.dto.Winner;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WinnerServiceImpl implements WinnerService {

    @Autowired
    private WinnerDAO winnerDAO;

    @Override
    public List<Winner> winnerList() throws Exception {
        return winnerDAO.winnerList();
    }

    @Override
    public Winner winnerDetail(int bno) throws Exception {
        return winnerDAO.winnerDetail(bno);
    }

    @Override
    public void winnerInsert(Winner dto) throws Exception {
        winnerDAO.winnerInsert(dto);
    }

    @Override
    public void winnerDelete(int bno) throws Exception {
        winnerDAO.winnerDelete(bno);
    }

    @Override
    public void winnerEdit(Winner dto) throws Exception {
        winnerDAO.winnerEdit(dto);
    }
}
