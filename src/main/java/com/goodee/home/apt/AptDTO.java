package com.goodee.home.apt;

import com.goodee.home.houseImage.HouseImageDTO;
import com.goodee.home.realEstate.RealEstateDTO;

public class AptDTO extends RealEstateDTO {
	private HouseImageDTO houseImageDTO;

	public HouseImageDTO getHouseImageDTO() {
		return houseImageDTO;
	}

	public void setHouseImageDTO(HouseImageDTO houseImageDTO) {
		this.houseImageDTO = houseImageDTO;
	}
	
	
}
