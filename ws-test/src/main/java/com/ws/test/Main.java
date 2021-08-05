package com.ws.test;

import org.java_websocket.WebSocket;

import java.net.URISyntaxException;

public class Main {
    public static void main(String[] args) {
        try {
            String ws_url = "ws://wechat-app-1144047-1259649570.ap-shanghai.run.tcloudbase.com/websocket/test/z_"+System.currentTimeMillis();
//            ws_url = "ws://127.0.0.1:8080/websocket/test/z_"+System.currentTimeMillis();
            System.out.println(ws_url);
            WeWebSocketClient client = new WeWebSocketClient(ws_url);
            client.connect();
            while (!client.getReadyState().equals(WebSocket.READYSTATE.OPEN)) {
                System.out.println("还没有打开");
                try {
                    Thread.sleep(5000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
            System.out.println("建立websocket连接");
            client.send("asd");
        } catch (URISyntaxException e) {
            e.printStackTrace();
        }
    }
}
