package org.fs.domain;

import java.util.List;

import org.springframework.web.util.UriComponentsBuilder;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@Data
public class StatsPagingSearchDTO {


	private List<StatsVO> getTableTest;
	private int getTableCount;
	

	
}
