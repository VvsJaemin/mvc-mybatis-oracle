package org.jaemin.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.jaemin.domain.Criteria;
import org.jaemin.domain.ReplyVO;

public interface ReplyService {
	
	public int register(ReplyVO vo);
	
	public ReplyVO get(Long rno);
	
	public Long remove(Long rno);
	
	public int update(ReplyVO reply);
	
	public List<ReplyVO> getList(Criteria cri, Long bno);

}
