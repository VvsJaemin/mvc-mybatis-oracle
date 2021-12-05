package org.jaemin.service;

import java.util.List;

import org.jaemin.domain.Criteria;
import org.jaemin.domain.ReplyPageDTO;
import org.jaemin.domain.ReplyVO;
import org.jaemin.mapper.BoardMapper;
import org.jaemin.mapper.ReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
@Log4j
@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Setter(onMethod_ = @Autowired )
	private ReplyMapper mapper;
	@Setter(onMethod_ = @Autowired )
	private BoardMapper boardMapper;
	
	@Transactional
	@Override
	public int register(ReplyVO vo) {

		boardMapper.updateReplyCnt(vo.getBno(), 1);
		
		return mapper.insert(vo);

	}

	@Override
	public ReplyVO get(Long rno) {
		
		return mapper.read(rno);
		
	}
	
	@Transactional
	@Override
	public Long remove(Long rno) {
		
		ReplyVO vo = mapper.read(rno);
		
		boardMapper.updateReplyCnt(vo.getBno(), -1);
		
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

	@Override
	public ReplyPageDTO getListPage(Criteria cri, Long bno) {
		
		return new ReplyPageDTO(mapper.getCountByBno(bno), mapper.getListWithPaging(cri, bno));
	}

}
