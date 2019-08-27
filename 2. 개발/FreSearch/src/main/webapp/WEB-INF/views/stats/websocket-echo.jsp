<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>웹 소켓 통신</title>
</head>
<body>
    <div>
        <input type="text" id="messageinput">
    </div>
    
    <div>
        <button onclick="openSocket();">Open</button>
        <button onclick="send();">Send</button>
        <button onclick="closeSocket();">close</button>
    </div>
    
    <div id="message"></div>
    <script>
        var ws;
        var messages = document.getElementById("message");
        
        function openSocket(){
            if(ws!==undefined && ws.readyState!==WebSocket.CLOSED)
            {
                writeResponse("WebSocket is already opend.");
                return;
            } 
            
            //웹소켓 객체 만드는 코드
            ws = new WebSocket('ws://192.168.0.60:8080/echo');
            
            ws.onopen=function(event){
                if(event.data===undefined) return;
                writeResponse(event.data);
            };
            ws.onmessage=function(event){
                writeResponse(event.data);
            };
            ws.onclose=function(event){
                writeResponse("Connection closed");
            }
        }
        function send(){
            var text = document.getElementById("messageinput").value;
            ws.send(text);
            text="";
        }
        function closeSocket(){
            ws.close();
        }
        function writeResponse(text){
            message.innerHTML+="<br/>"+text;
        }
    </script>
</body>
</html>



<!-- 내 작업대 시작!!!!!!!!!///////////////// -->
<c:forEach items="${list}" var="result" varStatus="status">
<c:if test="${result.qst_code ne qst_code}">
<div class="shadow">
	<div class="google-1">
		<div class="sumerry">

			<div class="sumerry-google">
				<div class="first-text">
					<div class="first-text-children">
						<div class="hoho">
							<span>${result.qst_content}</span>
							<!-- <span class="what">응답 5개</span> -->
						</div>
					</div>
					<div class="opacity"></div>
				</div>
				<c:forEach items="${list}" var="result1" varStatus="status">

					<c:if test="${qst_code == '0'}">
						<c:set var="qst_code" value="${list[0].qst_code}" />
					</c:if>
					<c:if test="${result1.qst_code ne qst_code1}">
						<c:if test="${result1.qst_code eq result.qst_code}">
							<div class="first-text-text">
								<div class="security">
									<div class="ContentWrap">
										<div class="Content">
											<div class="Box">

												<div class="Content">
													<div id="ChampionStatsTable">
														<table class="GetTable-Mp table" role="grid">
															<colgroup>
																<col width="30%">
																<col width="20%">
																<col width="10%">
															</colgroup>
															<thead class="Header">
																<tr class="Row table" role="row">
																</tr>
															</thead>
															<tbody class="Content" aria-live="plite" aria-relevant="all">
																<tr class="Row Top" role="row">
																	<td class="Cell-Top ChampionName"><span>${result1.item_content}</span></td>
																	<td class="Cell-Top" data-value="53.988620395752">
																		<div class="Progress Blue" style="width: ${result1.percent}"></div> <span
																		class="Value">${result1.percent}</span>
																	</td>
																	<td class="Cell-Top">${result1.asw_content}</td>
																</tr>
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:if>
					</c:if>




				</c:forEach>
				<c:set var="qst_code1" value="${result1.qst_code}" />


			</div>
		</div>
	</div>
</div>
</c:if>
<c:set var="qst_code" value="${result.qst_code}" />
</c:forEach>

<!-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////
//-->































