package com.vidividi.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;

import com.vidividi.variable.BundleDTO;
import com.vidividi.variable.VideoPlayDTO;


@Controller
public class BundleDAOImpl implements BundleDAO {
	
	@Inject
	private SqlSession session;
	
	@Override
	public List<BundleDTO> getBundleList(String ownerCode) {
		return this.session.selectList("bundleList", ownerCode);
	} // 재생목록 리스트
	
	@Override
	public int bundleAdd(BundleDTO bundledto) {
		return this.session.insert("bundleAdd", bundledto);
	} // 재생목록 추가
	
	@Override
	public int bundleDel(String bundleCode) {
		int check = this.session.delete("bundleDel", bundleCode);
		this.session.update("bundleVideoDel", bundleCode);
		
		return check;
	} // 재생목록 삭제
}
