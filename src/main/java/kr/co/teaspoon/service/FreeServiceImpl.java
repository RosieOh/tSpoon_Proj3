package kr.co.teaspoon.service;

import kr.co.teaspoon.dao.FreeDAO;
import kr.co.teaspoon.dto.Free;
import kr.co.teaspoon.dto.FreeComment;
import kr.co.teaspoon.dto.Reco;
import kr.co.teaspoon.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FreeServiceImpl implements FreeService {

    @Autowired
    private FreeDAO freeDAO;

    @Override
    public List<Free> freeList(Page page) throws Exception {
        return freeDAO.freeList(page);
    }

    @Override
    public Free freeDetail(int bno) throws Exception {
        return freeDAO.freeDetail(bno);
    }

    @Override
    public void freeInsert(Free dto) throws Exception {
        freeDAO.freeInsert(dto);
    }

    @Override
    public void freeDelete(int bno) throws Exception {
        freeDAO.freeDelete(bno);
    }

    @Override
    public void freeEdit(Free dto) throws Exception {
        freeDAO.freeEdit(dto);
    }

    @Override
    public int totalCount(Page page) throws Exception {
        return freeDAO.totalCount(page);
    }

    @Override
    public List<Free> freeBestRecList() throws Exception {
        return freeDAO.freeBestRecList();
    }

    @Override
    public List<Free> freeBestCmtList() throws Exception {
        return freeDAO.freeBestCmtList();
    }

    @Override
    public List<FreeComment> freeCommentList(int bno) throws Exception {
        return freeDAO.freeCommentList(bno);
    }

    @Override
    public void commentInsert(FreeComment dto) throws Exception {
        freeDAO.commentInsert(dto);
    }

    @Override
    public void commentDelete(int cno) throws Exception {
        freeDAO.commentDelete(cno);
    }

    @Override
    public List<Free> commentCount() throws Exception {
        return freeDAO.commentCount();
    }

    @Override
    public Reco findReco(int bno, String id) throws Exception {
        return freeDAO.findReco(bno, id);
    }

    @Override
    public int insertReco(Reco reco) throws Exception {
        int result = 0;
        // 추천이 이미 있는지 확인하는 코드
        Reco find = freeDAO.memberFindReco(reco);

        // find가 null이면 추천이 없는 상태이므로 정보 저장
        // find가 null이 아니면 추천이 있는 상태이므로 정보 삭제
        System.out.println("find:" + find);

        if (find == null) {
            result = freeDAO.insertReco(reco);
            freeDAO.increaseRec(reco);
        } /*else {
            freeDAO.deleteReco(reco);
            freeDAO.decreaseRec(reco);
        }*/
        return result;
    }
}
