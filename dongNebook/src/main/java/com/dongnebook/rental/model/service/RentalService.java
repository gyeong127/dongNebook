package com.dongnebook.rental.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dongnebook.book.model.vo.Book;
import com.dongnebook.rental.model.dao.RentalDao;
import com.dongnebook.rental.model.vo.BookRentalReserve;
import com.dongnebook.rental.model.vo.RentalLoc;

@Service
public class RentalService {
	
	@Autowired
	private RentalDao dao;

	public int insertLoc(RentalLoc loc) {
		
		return dao.insertLoc(loc);
	}

	public RentalLoc lastLoc() {
		return dao.lastLoc();
	}

	public int insertReserve(BookRentalReserve reserve) {
		return dao.insertReserve(reserve);
	}

	public ArrayList<Book> selectBooks(int[] bookNo) {
		return dao.selectBooks(bookNo);
	}
	
}
