package com.chenxing.wms;

import com.jfinal.server.undertow.UndertowServer;
import com.chenxing.wms.common.config.JfinalConfig;
import com.chenxing.wms.common.constant.BaseConstant;

public class Application {
    public static void main(String[] args) {
        UndertowServer
                .create(JfinalConfig.class,"config/undertow.txt")
                .setResourcePath("src/main/webapp,"+ BaseConstant.UPLOAD_PATH)
                .start();
    }
}
