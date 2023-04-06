package com.vidividi.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.vidividi.variable.CategoryDTO;
import com.vidividi.variable.PlaylistDTO;
import com.vidividi.variable.VideoPlayDTO;


@Controller
public class VideoPlayDAOImpl implements VideoPlayDAO {
	
	@Autowired
	private SqlSession session;
	
	@Override
	public VideoPlayDTO getVideoOne(String code) {
		return this.session.selectOne("one_video", code);
	}
	
	@Override
	public List<CategoryDTO> getCategoryList() {
		return this.session.selectList("category_list");
	}
	
	@Override
	public int updateUploadVideo(VideoPlayDTO videodto, PlaylistDTO playdto) {
		int check = 0;
		if(this.session.update("updateUpload", videodto) > 0) {
			check = this.session.update("updatePlaylist", playdto);
		}
		return check;
	}
	
	@Override
	public int updateVideo(VideoPlayDTO videoDTO) {
		return this.session.update("updateVideo", videoDTO);
	}
	
	@Override
	public int contModify(VideoPlayDTO videoDTO) {
		return this.session.update("contModify", videoDTO);
	}
	
}
