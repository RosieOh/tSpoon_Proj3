package kr.co.teaspoon.service;

import kr.co.teaspoon.dto.Survey;

import java.util.List;

public interface SurveyService {
    public List<Survey> surveyList() throws Exception;
    public Survey surveyDetail(int sno) throws Exception;
    public Survey lastSurvey() throws Exception;
    public void surveyInsert(Survey dto) throws Exception;
    public void sanswerInsert(Survey dto) throws Exception;
    public void surveyDelete(int sno) throws Exception;
    public void surveyEdit(Survey dto) throws Exception;
    public Survey ckAuthor(Survey dto) throws Exception;
}
