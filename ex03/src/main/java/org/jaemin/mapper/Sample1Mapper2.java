package org.jaemin.mapper;

import org.apache.ibatis.annotations.Insert;

public interface Sample1Mapper2 {
	
	@Insert("INSERT INTO tbl_sample2 (col2) VALUES (#{data})")
	public int insertInt2(String data);

}
