package org.jaemin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.jaemin.domain.BoardVO;

public interface BoardMapper {
	
	public List<BoardVO> getList();
	
	public void insert(BoardVO boardVO);
	
	public void insertSelectKey(BoardVO board);
	
	public BoardVO read(Long bno);
	
	public int delete(Long bno);
	
	public int update(BoardVO board);
}
