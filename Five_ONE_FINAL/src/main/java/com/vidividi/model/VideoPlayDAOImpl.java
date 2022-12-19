package com.vidividi.model;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.vidividi.variable.VideoPlayDTO;


@Controller
public class VideoPlayDAOImpl implements VideoPlayDAO {
	
	@Autowired
	private SqlSession session;
	
	@Override
	public VideoPlayDTO getVideoOne(String code) {
		return this.session.selectOne("one_video", code);
	}
}
