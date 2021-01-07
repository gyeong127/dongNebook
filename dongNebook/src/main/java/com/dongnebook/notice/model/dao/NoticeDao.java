package com.dongnebook.notice.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.dongnebook.common.FileVO;
import com.dongnebook.notice.model.vo.Notice;

/**
 * @author 진수경
 *
 */

@Repository
public class NoticeDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<Notice> noticeList(){
		List<Notice> list = sqlSession.selectList("notice.noticeList");
		return (ArrayList<Notice>)list;
	}

	public ArrayList<Notice> selectNoticeList(int start, int end) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		List<Notice> list = sqlSession.selectList("notice.selectNoticeList", map);
		return (ArrayList<Notice>)list;
	}

	public int totalCount() {
		return sqlSession.selectOne("notice.selectTotalCount", int.class);
	}

	@Transactional
	public int deleteNotice(int[] noticeNo) {
		int result = 0;
		for(int i=0; i<noticeNo.length; i++) {
			result = sqlSession.delete("notice.deleteNotice", noticeNo[i]);
			if(result<0) {
				return 0;
			}
		}
		return result;
	}

	public Notice selectNotice(int noticeNo) {
		return sqlSession.selectOne("notice.selectNotice", noticeNo);
	}

	public int insertNotice(Notice n) {
		return sqlSession.insert("notice.insertNotice", n);
	}

	public int selectNoticeNo() {
		return sqlSession.selectOne("notice.selectNoticeNo", int.class);
	}

	public int insertFile(FileVO fv) {
		return sqlSession.insert("notice.insertFile", fv);
	}

	public ArrayList<FileVO> selectFile(int noticeNo) {
		List<FileVO> list = sqlSession.selectList("notice.selectFile", noticeNo);
		return (ArrayList<FileVO>) list;
	}

	public int updateNotice(Notice n) {
		return sqlSession.update("notice.updateNotice", n);
	}

	public int deleteFile(FileVO fv) {
		return sqlSession.delete("notice.deleteFile", fv);
	}
}
