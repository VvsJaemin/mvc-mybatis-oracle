package org.jaemin.mapper;

import org.jaemin.domain.ReplyVO;

public interface ReplyMapper {
	
	public int insert(ReplyVO vo);
	
	public ReplyVO read(Long rno);
	
	public Long delete(Long rno);
	
	public int update(ReplyVO reply);
	
}
