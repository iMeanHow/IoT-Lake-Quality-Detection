package com.fedming.bottomnavigationdemo;

import android.app.Activity;
import android.os.Bundle;

import com.baidu.mapapi.SDKInitializer;
import com.baidu.mapapi.map.BaiduMap;
import com.baidu.mapapi.map.BitmapDescriptor;
import com.baidu.mapapi.map.BitmapDescriptorFactory;
import com.baidu.mapapi.map.MapStatus;
import com.baidu.mapapi.map.MapStatusUpdate;
import com.baidu.mapapi.map.MapStatusUpdateFactory;
import com.baidu.mapapi.map.MapView;
import com.baidu.mapapi.map.MarkerOptions;
import com.baidu.mapapi.map.OverlayOptions;
import com.baidu.mapapi.map.Polygon;
import com.baidu.mapapi.map.PolygonOptions;
import com.baidu.mapapi.map.Stroke;
import com.baidu.mapapi.map.TextOptions;
import com.baidu.mapapi.model.LatLng;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by lzr on 2018/4/6.
 */

public class BaiduMapPlusActivity extends Activity {
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
        setContentView(R.layout.baidumaplayout2);
        //获取地图控件引用
        mMapView = (MapView) findViewById(R.id.baiduMapView);
        BaiduMap mBaidumap = mMapView.getMap();
        //mMapView.setSatellite(true);
        LatLng cenpt = new LatLng(39.131834,117.533407); //设定中心点坐标
        {LatLng point = new LatLng(39.128100,117.531000);
            //BitmapDescriptor bitmapDescriptor = BitmapDescriptorFactory.fromResource(R.drawable.ic_correct);
            //OverlayOptions overlayOptions = new MarkerOptions().position(point).icon(bitmapDescriptor);
            OverlayOptions overlayOptions= new TextOptions().bgColor(0x00FFFFFF).fontSize(40).fontColor(0xff009966).text("0.03").rotate(0).position(point);
            mBaidumap.addOverlay(overlayOptions);

            // OverlayOptions textOption
        }

        {LatLng point = new LatLng(39.1281,117.533);
            BitmapDescriptor bitmapDescriptor = BitmapDescriptorFactory.fromResource(R.drawable.ic_correct);
            OverlayOptions overlayOptions = new TextOptions().bgColor(0x00FFFFFF).fontSize(40).fontColor(0xff009966).text("0.04").rotate(0).position(point);
            mBaidumap.addOverlay(overlayOptions);}
        {LatLng point = new LatLng(39.1281,117.5345);
            BitmapDescriptor bitmapDescriptor = BitmapDescriptorFactory.fromResource(R.drawable.ic_error);
            OverlayOptions overlayOptions = new TextOptions().bgColor(0x00FFFFFF).fontSize(40).fontColor(0xffff0000).text("0.13").rotate(0).position(point);
            mBaidumap.addOverlay(overlayOptions);}
        {LatLng point = new LatLng(39.1281,117.536);
            BitmapDescriptor bitmapDescriptor = BitmapDescriptorFactory.fromResource(R.drawable.ic_error);
            OverlayOptions overlayOptions =new TextOptions().bgColor(0x00FFFFFF).fontSize(40).fontColor(0xffff0000).text("0.13").rotate(0).position(point);
            mBaidumap.addOverlay(overlayOptions);}

        {LatLng point = new LatLng(39.12959,117.5315);
            BitmapDescriptor bitmapDescriptor = BitmapDescriptorFactory.fromResource(R.drawable.ic_correct);
            OverlayOptions overlayOptions =new TextOptions().bgColor(0x00FFFFFF).fontSize(40).fontColor(0xff009966).text("0.02").rotate(0).position(point);
            mBaidumap.addOverlay(overlayOptions);}

        {LatLng point = new LatLng(39.12959,117.533);
            BitmapDescriptor bitmapDescriptor = BitmapDescriptorFactory.fromResource(R.drawable.ic_error);
            OverlayOptions overlayOptions = new TextOptions().bgColor(0x00FFFFFF).fontSize(40).fontColor(0xffff0000).text("0.11").rotate(0).position(point);
            mBaidumap.addOverlay(overlayOptions);}
        {LatLng point = new LatLng(39.12959,117.5345);
            BitmapDescriptor bitmapDescriptor = BitmapDescriptorFactory.fromResource(R.drawable.ic_error);
            OverlayOptions overlayOptions = new TextOptions().bgColor(0x00FFFFFF).fontSize(40).fontColor(0xffff0000).text("0.15").rotate(0).position(point);
            mBaidumap.addOverlay(overlayOptions);}
        {LatLng point = new LatLng(39.12959,117.536);
            BitmapDescriptor bitmapDescriptor = BitmapDescriptorFactory.fromResource(R.drawable.ic_error);
            OverlayOptions overlayOptions =new TextOptions().bgColor(0x00FFFFFF).fontSize(40).fontColor(0xffff0000).text("0.13").rotate(0).position(point);
            mBaidumap.addOverlay(overlayOptions);}

       {LatLng point = new LatLng(39.131,117.5315);
            BitmapDescriptor bitmapDescriptor = BitmapDescriptorFactory.fromResource(R.drawable.ic_correct);
            OverlayOptions overlayOptions = new TextOptions().bgColor(0x00FFFFFF).fontSize(40).fontColor(0xff009966).text("0.03").rotate(0).position(point);
            mBaidumap.addOverlay(overlayOptions);}

        {LatLng point = new LatLng(39.131,117.533);
            BitmapDescriptor bitmapDescriptor = BitmapDescriptorFactory.fromResource(R.drawable.ic_correct);
            OverlayOptions overlayOptions = new TextOptions().bgColor(0x00FFFFFF).fontSize(40).fontColor(0xff009966).text("0.03").rotate(0).position(point);
            mBaidumap.addOverlay(overlayOptions);}
        {LatLng point = new LatLng(39.131,117.535);
            BitmapDescriptor bitmapDescriptor = BitmapDescriptorFactory.fromResource(R.drawable.ic_error);
            OverlayOptions overlayOptions = new TextOptions().bgColor(0x00FFFFFF).fontSize(40).fontColor(0xffff0000).text("0.12").rotate(0).position(point);
            mBaidumap.addOverlay(overlayOptions);}

        {LatLng point = new LatLng(39.1325,117.5315);
            BitmapDescriptor bitmapDescriptor = BitmapDescriptorFactory.fromResource(R.drawable.ic_correct);
            OverlayOptions overlayOptions =new TextOptions().bgColor(0x00FFFFFF).fontSize(40).fontColor(0xff009966).text("0.01").rotate(0).position(point);
            mBaidumap.addOverlay(overlayOptions);}

        {LatLng point = new LatLng(39.1325,117.533);
            BitmapDescriptor bitmapDescriptor = BitmapDescriptorFactory.fromResource(R.drawable.ic_correct);
            OverlayOptions overlayOptions = new TextOptions().bgColor(0x00FFFFFF).fontSize(40).fontColor(0xff009966).text("0.02").rotate(0).position(point);
            mBaidumap.addOverlay(overlayOptions);}
        {LatLng point = new LatLng(39.1325,117.535);
            BitmapDescriptor bitmapDescriptor = BitmapDescriptorFactory.fromResource(R.drawable.ic_correct);
            OverlayOptions overlayOptions = new TextOptions().bgColor(0x00FFFFFF).fontSize(40).fontColor(0xff009966).text("0.04").rotate(0).position(point);
            mBaidumap.addOverlay(overlayOptions);}

      /*  {LatLng point = new LatLng(39.134,117.5315);
            BitmapDescriptor bitmapDescriptor = BitmapDescriptorFactory.fromResource(R.drawable.ic_delete);
            OverlayOptions overlayOptions = new MarkerOptions().position(point).icon(bitmapDescriptor);
            mBaidumap.addOverlay(overlayOptions);}*/

        {LatLng point = new LatLng(39.134,117.533);
            BitmapDescriptor bitmapDescriptor = BitmapDescriptorFactory.fromResource(R.drawable.ic_correct);
            OverlayOptions overlayOptions = new TextOptions().bgColor(0x00FFFFFF).fontSize(40).fontColor(0xff009966).text("0.02").rotate(0).position(point);
            mBaidumap.addOverlay(overlayOptions);}
        {LatLng point = new LatLng(39.134,117.535);
            BitmapDescriptor bitmapDescriptor = BitmapDescriptorFactory.fromResource(R.drawable.ic_correct);
            OverlayOptions overlayOptions = new TextOptions().bgColor(0x00FFFFFF).fontSize(40).fontColor(0xff009966).text("0.02").rotate(0).position(point);
            mBaidumap.addOverlay(overlayOptions);}
        {LatLng point = new LatLng(39.134,117.5369);
            BitmapDescriptor bitmapDescriptor = BitmapDescriptorFactory.fromResource(R.drawable.ic_correct);
            OverlayOptions overlayOptions =new TextOptions().bgColor(0x00FFFFFF).fontSize(40).fontColor(0xff009966).text("0.03").rotate(0).position(point);
            mBaidumap.addOverlay(overlayOptions);}

        {LatLng point = new LatLng(39.135,117.533);
            BitmapDescriptor bitmapDescriptor = BitmapDescriptorFactory.fromResource(R.drawable.ic_correct);
            OverlayOptions overlayOptions = new TextOptions().bgColor(0x00FFFFFF).fontSize(40).fontColor(0xff009966).text("0.04").rotate(0).position(point);
            mBaidumap.addOverlay(overlayOptions);}
        {LatLng point = new LatLng(39.135,117.535);
            BitmapDescriptor bitmapDescriptor = BitmapDescriptorFactory.fromResource(R.drawable.ic_correct);
            OverlayOptions overlayOptions = new TextOptions().bgColor(0x00FFFFFF).fontSize(40).fontColor(0xff009966).text("0.03").rotate(0).position(point);
            mBaidumap.addOverlay(overlayOptions);}
        {
            Polygon polygon;

            List<LatLng> pts = new ArrayList<LatLng>();


                pts.add(new LatLng(39.1281,117.5345));
            pts.add(  new LatLng(39.1281,117.536));
            pts.add( new LatLng(39.12959,117.536));
            pts.add(  new LatLng(39.131,117.535));
            //pts.add( new LatLng(39.12959,117.5345));
            pts.add(  new LatLng(39.12959,117.533));

            OverlayOptions ooPolygon = new PolygonOptions().points(pts)
                    .stroke(new Stroke(5, 0xAAFFFF00)).fillColor(0xAAFFFF00);
            polygon = (Polygon)mBaidumap.addOverlay(ooPolygon);
        }
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
