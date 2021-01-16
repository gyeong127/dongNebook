package com.dongnebook.review.model.dao;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dongnebook.review.model.vo.Review;
import com.dongnebook.review_co_comment.model.vo.ReviewCoComment;
import com.dongnebook.review_comment.model.vo.ReviewComment;
import com.dongnebook.user.model.service.UserService;
import com.dongnebook.user.model.vo.User;

/**
 * @author 김종모
 *
 */
@Repository
public class ReviewDao {
	@Autowired
	private SqlSessionTemplate session;
	@Autowired
	private UserService userService;
	
	public ArrayList<Review> selectAllReview() {
		List<Review> list= session.selectList("review.selectAllReview");
		List<HashMap<String, Object>> FKList = session.selectList("review.selectAllReviewFK");
		ArrayList<Review> returnList = combineList(list,FKList);
		return returnList;
	}

	private ArrayList<Review> combineList(List<Review> list, List<HashMap<String, Object>> FKList) {
		int idx = 0 ;
		for(Review r : list) {
			System.out.println(r);
			int userNo = ((BigDecimal)FKList.get(idx++).get("USER_NO")).intValue();
			User u = new User();
			u.setUserNo(userNo);
			r.setUser(userService.selectOneUser(u));
			System.out.println(r);
		}
		return (ArrayList<Review>)list;
	}
	
}
