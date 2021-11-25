package org.jaemin.mapper;

import java.util.stream.IntStream;

import org.jaemin.domain.ReplyVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ReplyMapperTests {
	
	// 해당 bno가 있는지 확인
	private Long [] bnoArr = { 5767249L, 5767247L, 5767245L, 5767243L, 5767233L};
		
	
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	@Test
	public void testMapper() {
		log.info(mapper);
	}
	
	/*
	 * @Test public void testCreate() { IntStream.range(1, 10).forEach(i->{ ReplyVO
	 * vo = new ReplyVO();
	 * 
	 * vo.setBno(bnoArr[i % 5]); vo.setReply("댓글 테스트 : " + i);
	 * vo.setReplyer("replyer" + i);
	 * 
	 * mapper.insert(vo); }); }
	 */
	
	@Test
	public void testRead() {
		Long targetRno = 5L;
		
		ReplyVO vo = mapper.read(targetRno);
		
		log.info(vo);
	}
	
	@Test
	public void testDelete() {
		Long targerRno = 1L;
		
		mapper.delete(targerRno);
	}
	
	@Test 
	public void testUpdate() {
		Long targetRno = 10L;
		
		ReplyVO vo = mapper.read(targetRno);
		
		vo.setReply("Update Reply");
		
		int count  = mapper.update(vo);
		log.info(count);
	}
}
