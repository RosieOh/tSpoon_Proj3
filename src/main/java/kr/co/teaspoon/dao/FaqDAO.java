package kr.co.teaspoon.dao;
import java.util.List;
import kr.co.teaspoon.dto.Faq;

public interface FaqDAO {
    public List<Faq> faqList() throws Exception;
}
