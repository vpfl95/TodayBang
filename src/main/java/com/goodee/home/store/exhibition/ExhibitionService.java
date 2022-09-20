package com.goodee.home.store.exhibition;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ExhibitionService {
	
	@Autowired
	private ExhibitionDAO exhibitionDAO;
	
	public List<ExhibitionDTO> getExhibition() throws Exception {
		return exhibitionDAO.getExhibition();
	}
}