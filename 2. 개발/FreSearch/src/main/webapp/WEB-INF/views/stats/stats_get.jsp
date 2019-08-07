<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/stats/css/chart.css">









</head>
<body>


<div class="Content">
	<div class="Box">
		<div class="Content">
			<div id="ChampionStatsTable">
				<table class="GetTable table" role="grid">
					<colgroup>
						<col width="50">
						<col width="32">
						<col width="143">
						<col width="173">
						<col width="133">
						<col width="133">
						<col width="133">
						<col width="133">
					</colgroup>
					<thead class="Header">
						<tr class="Row table" role="row">
							<th class="HeaderCell Rank tablesorter-header tablesorter-headerUnSorted" data-column="0" 
							tabindex="0" scope="col" role="columnheader" 
							aria-disabled="false" unselectable="on" aria-sort="none" 
							aria-label="#: No sort applied, activate to apply an ascending sort" style="user-select: none;">
								<div class="tablesorter-header-inner">#
								</div>
							</th>
							
							<th class="HeaderCell tablesorter-header tablesorter-headerUnSorted" colspan="2" 
							data-column="1" tabindex="0" scope="col" role="columnheader" aria-disabled="false" 
							unselectable="on" aria-sort="none" aria-label="챔피언: No sort applied, activate to apply a descending sort" 
							style="user-select: none;">
								<div class="tablesorter-header-inner">아이템
								</div>
							</th>
							
							<th class="HeaderCell tablesorter-header tablesorter-headerUnSorted" data-column="3" tabindex="0" 
							scope="col" role="columnheader" aria-disabled="false" unselectable="on" aria-sort="none" 
							aria-label="승률: No sort applied, activate to apply a descending sort" style="user-select: none;">
								<div class="tablesorter-header-inner">승률
								</div>
							</th>
							
							<th class="HeaderCell tablesorter-header tablesorter-headerUnSorted" data-column="4" 
							tabindex="0" scope="col" role="columnheader" aria-disabled="false" unselectable="on" aria-sort="none" 
							aria-label="플레이수: No sort applied, activate to apply a descending sort" style="user-select: none;">
								<div class="tablesorter-header-inner">플레이수
								</div>
							</th>
							
							<th class="HeaderCell tablesorter-header tablesorter-headerUnSorted" data-column="5" tabindex="0" 
							scope="col" role="columnheader" aria-disabled="false" unselectable="on" aria-sort="none" 
							aria-label="평점: No sort applied, activate to apply a descending sort" style="user-select: none;">
								<div class="tablesorter-header-inner">평점
								</div>
							</th>
							
							<th class="HeaderCell tablesorter-header tablesorter-headerUnSorted" data-column="6" tabindex="0" 
							scope="col" role="columnheader" aria-disabled="false" unselectable="on" aria-sort="none" 
							aria-label="CS: No sort applied, activate to apply a descending sort" style="user-select: none;">
								<div class="tablesorter-header-inner">CS
								</div>
							</th>
				</table>
			</div>
		</div>
	</div>
</div>

</body>
</html>