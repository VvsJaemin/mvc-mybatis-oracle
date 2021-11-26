package org.jaemin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.jaemin.domain.Criteria;
import org.jaemin.domain.ReplyVO;

public interface ReplyMapper {
	
	public int insert(ReplyVO vo);
	
	public ReplyVO read(Long rno);
	
	public Long delete(Long rno);
	
	public int update(ReplyVO reply);
	
	public List<ReplyVO> getListWithPaging(@Param("cri") Criteria cri, @Param("bno") Long bno);
	
}
