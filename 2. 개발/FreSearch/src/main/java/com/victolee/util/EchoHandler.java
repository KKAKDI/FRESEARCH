package com.victolee.util;
 
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.fs.service.StatsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.Setter;
 
public class EchoHandler extends TextWebSocketHandler {
	@Setter(onMethod_ = {@Autowired} )
	private StatsService service; 
	
	
    private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
    @Autowired
    SqlSession sqlsession;
     
      // 클라이언트와 연결 이후에 실행되는 메서드
      @Override
      public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        sessionList.add(session);
        for (WebSocketSession sess : sessionList) {
            sess.sendMessage(new TextMessage((CharSequence) service.header().toString()));
            System.out.println("#sendMessage : "+sess);
        }
        System.out.println("{} 연결됨"+ session.getId());
      }
     
      // 클라이언트가 서버로 메시지를 전송했을 때 실행되는 메서드
      @Override
      protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        System.out.println(("{}로 부터 {} 받음"+ session.getId()+ message.getPayload()));
        
        
        
//			이건 채팅
//        for (WebSocketSession sess : sessionList) {
//          sess.sendMessage(new TextMessage(session.getId() + " : " + message.getPayload()));
//        }
        
        
//         이건 알림
//        NoteDao dao = sqlsession.getMapper(NoteDao.class);
//
//		this.logger.info(message.getPayload());
//
//		session.sendMessage(new TextMessage(dao.count_receive_note(message.getPayload())));
        
        Thread.sleep(2000);
        
//		이건 내꺼        
        for (WebSocketSession sess : sessionList) {
        sess.sendMessage(new TextMessage((CharSequence) service.header().toString()));
        }
      }
//현재 수신자에게 몇개의 메세지가 와있는지 디비에서 검색함.

		

	

      // 클라이언트와 연결을 끊었을 때 실행되는 메소드
      @Override
      public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        sessionList.remove(session);
        System.out.println(("{} 연결 끊김"+ session.getId()));
      }
}