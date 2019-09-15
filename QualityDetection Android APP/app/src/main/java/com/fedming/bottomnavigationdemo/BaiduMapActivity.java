package com.fedming.bottomnavigationdemo;

import android.app.Activity;
import android.os.Bundle;

import com.baidu.mapapi.SDKInitializer;
import com.baidu.mapapi.map.MapStatus;
import com.baidu.mapapi.map.TextureMapView;
import android.content.Context;
import android.os.Bundle;
import android.support.v7.app.ActionBarActivity;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.inputmethod.InputMethodManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.Toast;

import com.baidu.location.BDLocation;
import com.baidu.location.BDLocationListener;
import com.baidu.location.LocationClient;
import com.baidu.location.LocationClientOption;
import com.baidu.mapapi.SDKInitializer;
import com.baidu.mapapi.map.BaiduMap;
import com.baidu.mapapi.map.BitmapDescriptor;
import com.baidu.mapapi.map.BitmapDescriptorFactory;
import com.baidu.mapapi.map.MapStatusUpdate;
import com.baidu.mapapi.map.MapStatusUpdateFactory;
import com.baidu.mapapi.map.MapView;
import com.baidu.mapapi.map.MyLocationConfiguration;
import com.baidu.mapapi.map.MyLocationData;
import com.baidu.mapapi.model.LatLng;
import com.baidu.mapapi.map.MarkerOptions;
import com.baidu.mapapi.map.OverlayOptions;
/**
 * Created by lzr on 2018/4/6.
 */

public class BaiduMapActivity extends Activity {
    MapView mMapView = null;
    private MapView myMapView = null;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        // super.onCreate(savedInstanceState);
        //setContentView(R.layout.activity_main);

        super.onCreate(savedInstanceState);
        //在使用SDK各组件之前初始化context信息，传入ApplicationContext
        //注意该方法要再setContentView方法之前实现
        SDKInitializer.initialize(getApplicationContext());
        setContentView(R.layout.baidumaplayout1);
        //获取地图控件引用
        mMapView = (MapView) findViewById(R.id.baiduMapView);
        BaiduMap mBaidumap = mMapView.getMap();

        LatLng cenpt = new LatLng(39.131834,117.533407); //设定中心点坐标
        {LatLng point = new LatLng(39.128,117.531);
            BitmapDescriptor bitmapDescriptor = BitmapDescriptorFactory.fromResource(R.drawable.ic_correct);
            OverlayOptions overlayOptions = new MarkerOptions().position(point).icon(bitmapDescriptor);
            mBaidumap.addOverlay(overlayOptions);}

        {LatLng point = new LatLng(39.128,117.533);
            BitmapDescriptor bitmapDescriptor = BitmapDescriptorFactory.fromResource(R.drawable.ic_correct);
            OverlayOptions overlayOptions = new MarkerOptions().position(point).icon(bitmapDescriptor);
            mBaidumap.addOverlay(overlayOptions);}
        {LatLng point = new LatLng(39.128,117.535);
            BitmapDescriptor bitmapDescriptor = BitmapDescriptorFactory.fromResource(R.drawable.ic_error);
            OverlayOptions overlayOptions = new MarkerOptions().position(point).icon(bitmapDescriptor);
            mBaidumap.addOverlay(overlayOptions);}
        {LatLng point = new LatLng(39.128,117.536);
            BitmapDescriptor bitmapDescriptor = BitmapDescriptorFactory.fromResource(R.drawable.ic_error);
            OverlayOptions overlayOptions = new MarkerOptions().position(point).icon(bitmapDescriptor);
            mBaidumap.addOverlay(overlayOptions);}

        {LatLng point = new LatLng(39.1295,117.5315);
            BitmapDescriptor bitmapDescriptor = BitmapDescriptorFactory.fromResource(R.drawable.ic_correct);
            OverlayOptions overlayOptions = new MarkerOptions().position(point).icon(bitmapDescriptor);
            mBaidumap.addOverlay(overlayOptions);}

        {LatLng point = new LatLng(39.1295,117.533);
            BitmapDescriptor bitmapDescriptor = BitmapDescriptorFactory.fromResource(R.drawable.ic_correct);
            OverlayOptions overlayOptions = new MarkerOptions().position(point).icon(bitmapDescriptor);
            mBaidumap.addOverlay(overlayOptions);}
        {LatLng point = new LatLng(39.1295,117.535);
            BitmapDescriptor bitmapDescriptor = BitmapDescriptorFactory.fromResource(R.drawable.ic_correct);
            OverlayOptions overlayOptions = new MarkerOptions().position(point).icon(bitmapDescriptor);
            mBaidumap.addOverlay(overlayOptions);}
        {LatLng point = new LatLng(39.1295,117.536);
            BitmapDescriptor bitmapDescriptor = BitmapDescriptorFactory.fromResource(R.drawable.ic_error);
            OverlayOptions overlayOptions = new MarkerOptions().position(point).icon(bitmapDescriptor);
            mBaidumap.addOverlay(overlayOptions);}

        {LatLng point = new LatLng(39.1315,117.531);
            BitmapDescriptor bitmapDescriptor = BitmapDescriptorFactory.fromResource(R.drawable.ic_correct);
            OverlayOptions overlayOptions = new MarkerOptions().position(point).icon(bitmapDescriptor);
            mBaidumap.addOverlay(overlayOptions);}

        {LatLng point = new LatLng(39.1315,117.533);
            BitmapDescriptor bitmapDescriptor = BitmapDescriptorFactory.fromResource(R.drawable.ic_correct);
            OverlayOptions overlayOptions = new MarkerOptions().position(point).icon(bitmapDescriptor);
            mBaidumap.addOverlay(overlayOptions);}
        {LatLng point = new LatLng(39.1315,117.535);
            BitmapDescriptor bitmapDescriptor = BitmapDescriptorFactory.fromResource(R.drawable.ic_correct);
            OverlayOptions overlayOptions = new MarkerOptions().position(point).icon(bitmapDescriptor);
            mBaidumap.addOverlay(overlayOptions);}

        {LatLng point = new LatLng(39.1325,117.5315);
            BitmapDescriptor bitmapDescriptor = BitmapDescriptorFactory.fromResource(R.drawable.ic_correct);
            OverlayOptions overlayOptions = new MarkerOptions().position(point).icon(bitmapDescriptor);
            mBaidumap.addOverlay(overlayOptions);}

        {LatLng point = new LatLng(39.1325,117.533);
            BitmapDescriptor bitmapDescriptor = BitmapDescriptorFactory.fromResource(R.drawable.ic_correct);
            OverlayOptions overlayOptions = new MarkerOptions().position(point).icon(bitmapDescriptor);
            mBaidumap.addOverlay(overlayOptions);}
        {LatLng point = new LatLng(39.1325,117.535);
            BitmapDescriptor bitmapDescriptor = BitmapDescriptorFactory.fromResource(R.drawable.ic_correct);
            OverlayOptions overlayOptions = new MarkerOptions().position(point).icon(bitmapDescriptor);
            mBaidumap.addOverlay(overlayOptions);}

        {LatLng point = new LatLng(39.134,117.5315);
            BitmapDescriptor bitmapDescriptor = BitmapDescriptorFactory.fromResource(R.drawable.ic_delete);
            OverlayOptions overlayOptions = new MarkerOptions().position(point).icon(bitmapDescriptor);
            mBaidumap.addOverlay(overlayOptions);}

        {LatLng point = new LatLng(39.134,117.533);
            BitmapDescriptor bitmapDescriptor = BitmapDescriptorFactory.fromResource(R.drawable.ic_correct);
            OverlayOptions overlayOptions = new MarkerOptions().position(point).icon(bitmapDescriptor);
            mBaidumap.addOverlay(overlayOptions);}
        {LatLng point = new LatLng(39.134,117.535);
            BitmapDescriptor bitmapDescriptor = BitmapDescriptorFactory.fromResource(R.drawable.ic_correct);
            OverlayOptions overlayOptions = new MarkerOptions().position(point).icon(bitmapDescriptor);
            mBaidumap.addOverlay(overlayOptions);}
        {LatLng point = new LatLng(39.134,117.536);
            BitmapDescriptor bitmapDescriptor = BitmapDescriptorFactory.fromResource(R.drawable.ic_correct);
            OverlayOptions overlayOptions = new MarkerOptions().position(point).icon(bitmapDescriptor);
            mBaidumap.addOverlay(overlayOptions);}

        {LatLng point = new LatLng(39.135,117.533);
            BitmapDescriptor bitmapDescriptor = BitmapDescriptorFactory.fromResource(R.drawable.ic_correct);
            OverlayOptions overlayOptions = new MarkerOptions().position(point).icon(bitmapDescriptor);
            mBaidumap.addOverlay(overlayOptions);}
        {LatLng point = new LatLng(39.135,117.535);
            BitmapDescriptor bitmapDescriptor = BitmapDescriptorFactory.fromResource(R.drawable.ic_correct);
            OverlayOptions overlayOptions = new MarkerOptions().position(point).icon(bitmapDescriptor);
            mBaidumap.addOverlay(overlayOptions);}
        MapStatus mMapStatus = new MapStatus.Builder()//定义地图状态
                .target(cenpt)
                .zoom(17)
                .build();  //定义MapStatusUpdate对象，以便描述地图状态将要发生的变化
        MapStatusUpdate mMapStatusUpdate = MapStatusUpdateFactory.newMapStatus(mMapStatus);

        mBaidumap.setMapStatus(mMapStatusUpdate);//改变地图状态
    }
    @Override
    protected void onDestroy() {
        super.onDestroy();
        //在activity执行onDestroy时执行mMapView.onDestroy()，实现地图生命周期管理
        mMapView.onDestroy();
    }
    @Override
    protected void onResume() {
        super.onResume();
        //在activity执行onResume时执行mMapView. onResume ()，实现地图生命周期管理
        mMapView.onResume();
    }
    @Override
    protected void onPause() {
        super.onPause();
        //在activity执行onPause时执行mMapView. onPause ()，实现地图生命周期管理
        mMapView.onPause();
    }
}
