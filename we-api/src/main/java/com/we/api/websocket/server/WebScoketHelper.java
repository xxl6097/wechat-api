package com.we.api.websocket.server;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.websocket.EncodeException;
import javax.websocket.Session;
import java.io.IOException;
import java.util.concurrent.CopyOnWriteArraySet;
import java.util.function.Consumer;

public class WebScoketHelper {
    private final Logger logger = LoggerFactory.getLogger(WebScoketHelper.class);
    //concurrent包的线程安全Set，用来存放每个客户端对应的MyWebSocket对象。
    private CopyOnWriteArraySet<WebSocketServer> clientMap = new CopyOnWriteArraySet<WebSocketServer>();
    private static WebScoketHelper instance = null;

    public static WebScoketHelper getInstance() {
        if (instance == null) {
            synchronized (WebScoketHelper.class) {
                if (null == instance) {
                    instance = new WebScoketHelper();
                }
            }
        }
        return instance;
    }

    public int getSize() {
        return clientMap.size();
    }

    public void add(WebSocketServer server) {
        clientMap.add(server);
    }

    public void remove(WebSocketServer server) {
        clientMap.remove(server);
    }

    /**
     * 推送文本消息给指定的客户端
     */
    public void sendMessage(Session sess, String message) throws IOException {
        sess.getBasicRemote().sendText(message);
    }

    /**
     * 推送对象给指定的客户端
     *
     * @param sess:
     * @param object:
     */
    public void sendObject(Session sess, Object object) throws IOException, EncodeException {
        sess.getBasicRemote().sendObject(object);
    }

    /**
     * 私发
     */
    public void sendTextToOne(WebSocketServer target,String message) {
        clientMap.forEach(new Consumer<WebSocketServer>() {
            @Override
            public void accept(WebSocketServer server) {
                if (server == null || target ==null)
                    return;
                if (server.getUserId() == null || target.getUserId() == null)
                    return;
                if (server.userId.equals(target.getUserId())) {
                    try {
                        sendMessage(target.getSession(),message);
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
        });
    }

    /**
     * 推送文本给所有的客户端
     */
    public void sendTextToAll(String message) {
        clientMap.forEach(new Consumer<WebSocketServer>() {
            @Override
            public void accept(WebSocketServer e) {
                try {
                    sendMessage(e.getSession(), message);
                } catch (IOException e1) {
                    throw new RuntimeException("推送失败，session.id=" + e.getSession().getId(), e1);
                }
            }
        });
    }

    /**
     * 推送文本给所有的客户端
     */
    public void sendObjectToAll(String message) {
        clientMap.forEach(new Consumer<WebSocketServer>() {
            @Override
            public void accept(WebSocketServer e) {
                try {
                    sendObject(e.getSession(), message);
                } catch (IOException | EncodeException e1) {
                    throw new RuntimeException("推送失败，session.id=" + e.getSession().getId(), e1);
                }
            }
        });
    }
}
