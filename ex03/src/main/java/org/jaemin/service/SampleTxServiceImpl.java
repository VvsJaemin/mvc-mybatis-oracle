package org.jaemin.service;

import org.jaemin.mapper.Sample1Mapper;
import org.jaemin.mapper.Sample1Mapper2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class SampleTxServiceImpl implements SampleTxService {

	@Setter(onMethod_ = { @Autowired })
	private Sample1Mapper mapper1;
	
	@Setter(onMethod_ = { @Autowired })
	private Sample1Mapper2 mapper2;
	
	@Transactional
	@Override
	public void addData(String value) {
		log.info("mapper1");
		mapper1.insertCol1(value);
		
		log.info("mapper2");
		mapper2.insertInt2(value);
		
		log.info("end...");
	}

}
