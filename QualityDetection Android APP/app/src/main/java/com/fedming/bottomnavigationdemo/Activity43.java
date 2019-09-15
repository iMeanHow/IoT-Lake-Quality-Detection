package com.fedming.bottomnavigationdemo;

import android.app.Activity;
import android.os.Bundle;

/**
 * Created by lzr on 2018/4/15.
 */

public class Activity43 extends Activity {
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        // The activity is being created.
        super.onCreate(savedInstanceState);
        //在使用SDK各组件之前初始化context信息，传入ApplicationContext
        //注意该方法要再setContentView方法之前实现
       // SDKInitializer.initialize(getApplicationContext());
        setContentView(R.layout.setpoint);
        //获取地图控件引用

    }
}
