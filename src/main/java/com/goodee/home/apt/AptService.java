package com.goodee.home.apt;

import java.util.List;
import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.redis.core.ListOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Service;

import com.goodee.home.realEstate.RealEstateDAO;
import com.goodee.home.realEstate.RealEstateDTO;
import com.goodee.home.util.MaemulPager;


@Service
public class AptService {
	@Autowired
	private AptDAO aptDAO;
	@Autowired
	private RedisTemplate<String, Object> redisTemplate;
	
	public List<RealEstateDTO> getAptRoadName(AptDTO aptDTO) throws Exception{
		ValueOperations<String, Object> list = redisTemplate.opsForValue();
		
		
		String key = aptDTO.getSigungu();
		
		if(redisTemplate.hasKey(aptDTO.getSigungu())) {
			System.out.println(aptDTO.getSigungu() + " 키가 이미 있음");
			return (List<RealEstateDTO>) list.get(key);
		}else {
			System.out.println(aptDTO.getSigungu() + " 키가 없음");
			List<RealEstateDTO> value = aptDAO.getAptRoadName(aptDTO);
			list.set(key, value, 300, TimeUnit.SECONDS);
			System.out.println("Redis에" + aptDTO.getSigungu() + " 키 저장");
			return aptDAO.getAptRoadName(aptDTO); 
		}
		
	}
	
	public List<AptDTO> getList(MaemulPager maemulPager)throws Exception{
		maemulPager.getRowNum();

		Long totalCount = aptDAO.getTotalCount(maemulPager);
		maemulPager.makePage(totalCount);
		
		return aptDAO.getList(maemulPager);
	}
	
	public List<AptDTO> getSearchAddressList(String search)throws Exception{
		return aptDAO.getSearchAddressList(search);
	}
	
	public List<AptDTO> getSearchAptList(String search)throws Exception{
		return aptDAO.getSearchAptList(search);
	}
}
