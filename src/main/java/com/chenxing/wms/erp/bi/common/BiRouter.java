package com.chenxing.wms.erp.bi.common;

import com.chenxing.wms.erp.bi.controller.*;
import com.jfinal.config.Routes;

public class BiRouter extends Routes {
    @Override
    public void config() {
        addInterceptor(new BiInterceptor());
        add("/bi", BiController.class);
        add("/biCustomer", BiCustomerController.class);
        add("/biRanking", BiRankingController.class);
        add("/biFunnel", BiFunnelController.class);
        add("/biEmployee", BiEmployeeController.class);
        add("/biWork", BiWorkController.class);
    }
}
