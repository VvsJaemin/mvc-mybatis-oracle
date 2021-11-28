package org.jaemin.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class ReplyPageDTO {
	
	private int replyCnt;
	private List<ReplyVO> list;
	
}
