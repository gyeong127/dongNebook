package com.dongnebook.book.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dongnebook.book.model.vo.Book;


/**
 * @author 김종모
 *
 */

@Repository

public class BookDao {
	@Autowired
	private SqlSessionTemplate session;

	public int insertBook(Book b) {
		return session.insert("book.insertBook", b);
	}

	public ArrayList<Book> selectBookByKeyword(String inputStr, String searchKeyword) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("inputStr", inputStr);
		map.put("searchKeyword", searchKeyword);
		List<Book> list = session.selectList("book.selectBookByKeyword", map);
		return (ArrayList<Book>)list;
	}

	public ArrayList<Book> selectBookByKeyword(String inputStr, String searchKeyword, int reqPage) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("inputStr", inputStr);
		map.put("searchKeyword", searchKeyword);
		map.put("reqPage", reqPage);
		List<Book> list = session.selectList("book.selectBookByKeyword", map);
		return (ArrayList<Book>)list;
	}
}
