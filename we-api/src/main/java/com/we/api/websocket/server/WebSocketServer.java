package com.we.api.websocket.server;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.concurrent.CopyOnWriteArraySet;

//https://blog.csdn.net/u012977315/article/details/84944708
@ServerEndpoint(value = "/websocket/{userId}",encoders = ObjectMessageEncoder.class)
@Component
public class WebSocketServer {
    private static final Logger log = LoggerFactory.getLogger(WebScoketHelper.class);
    //静态变量，用来记录当前在线连接数。应该把它设计成线程安全的。
    public static int onlineCount = 0;

    //与某个客户端的连接会话，需要通过它来给客户端发送数据
    public Session session;
    //接收参数中的用户ID
    public String userId;


    /**
     * 连接建立成功调用的方法
     */
    @OnOpen
    public void onOpen(Session session, @PathParam("userId") String userId) {
        this.session = session;
        this.userId = userId;
        WebScoketHelper.getInstance().add(this);
        log.info("有一个新的客户端 : " + userId + " , 当前客户端连接总数: " + WebScoketHelper.getInstance().getSize());
        try {
            WebScoketHelper.getInstance().sendMessage(session, "你好，新客户端！userId = " + userId);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 连接关闭调用的方法
     */
    @OnClose
    public void onClose(@PathParam("userId") String userId) {
        WebScoketHelper.getInstance().remove(this);
        log.info("有一个客户端断开，当前客户端连接总数: " + WebScoketHelper.getInstance().getSize());
    }

    /**
     * 收到客户端消息
     * @param message 客户端发送过来的消息
     */
    @OnMessage
    public void onMessage(String message, @PathParam("userId") String userId) {
        log.info("接收到客户端消息, " + userId +" , message: " + message);
        try {
            WebScoketHelper.getInstance().sendMessage(session,message);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     *
     * @param session
     * @param error
     */
    @OnError
    public void onError(Session session, Throwable error) {
        log.error("出错了！"+(error!=null?error.getMessage():null));
        error.printStackTrace();
    }

    public Session getSession() {
        return session;
    }

    public String getUserId() {
        return userId;
    }
}
