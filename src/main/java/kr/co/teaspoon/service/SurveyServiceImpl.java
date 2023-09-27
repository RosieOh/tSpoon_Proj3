package kr.co.teaspoon.service;

import kr.co.teaspoon.dao.SurveyDAO;
import kr.co.teaspoon.dto.Reco;
import kr.co.teaspoon.dto.Survey;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SurveyServiceImpl implements SurveyService{
    @Autowired
    private SurveyDAO surveyDAO;

    @Override
    public List<Survey> surveyList() throws Exception {
        return surveyDAO.surveyList();
    }

    @Override
    public Survey surveyDetail(int sno) throws Exception {
        return surveyDAO.surveyDetail(sno);
    }

    @Override
    public Survey lastSurvey() throws Exception {
        return surveyDAO.lastSurvey();
    }

    @Override
    public void surveyInsert(Survey dto) throws Exception {
        surveyDAO.surveyInsert(dto);
    }

    @Override
    public void sanswerInsert(Survey dto) throws Exception {

//        int result = 0;
//        // 추천이 이미 있는지 확인하는 코드
//        Reco find = freeDAO.memberFindReco(reco);
//
//        // find가 null이면 추천이 없는 상태이므로 정보 저장
//        // find가 null이 아니면 추천이 있는 상태이므로 정보 삭제
//        System.out.println("find:" + find);
//
//        if (find == null) {
//            result = freeDAO.insertReco(reco);
//            freeDAO.increaseRec(reco);
//        } /*else {
//            freeDAO.deleteReco(reco);
//            freeDAO.decreaseRec(reco);
//        }*/
//        return result;

        surveyDAO.sanswerInsert(dto);
    }

    @Override
    public void surveyDelete(int sno) throws Exception {
        surveyDAO.surveyDelete(sno);
    }

    @Override
    public void surveyEdit(Survey dto) throws Exception {
        surveyDAO.surveyEdit(dto);
    }

    @Override
    public Survey ckAuthor(Survey dto) throws Exception {
        return surveyDAO.ckAuthor(dto);
    }
}
