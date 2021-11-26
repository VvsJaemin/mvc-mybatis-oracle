package org.jaemin.service;

import java.util.List;

import org.jaemin.domain.Criteria;
import org.jaemin.domain.ReplyVO;
import org.jaemin.mapper.ReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class ReplyServiceImpl implements ReplyService {

	private ReplyMapper mapper;

	@Override
	public int register(ReplyVO vo) {

		return mapper.insert(vo);

	}

	@Override
	public ReplyVO get(Long rno) {
		
		return mapper.read(rno);
		
	}

	@Override
	public Long remove(Long rno) {
		
		return mapper.delete(rno);
	}

	@Override
	public int update(ReplyVO reply) {
		
		return mapper.update(reply);
	}

	@Override
	public List<ReplyVO> getList(Criteria cri, Long bno) {
		
		return mapper.getListWithPaging(cri, bno);
		
	}

}
