package com.fedming.bottomnavigationdemo;

import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;

/**
 * Created by lzr on 2018/4/6.
 */

public class Fragment2 extends Fragment {

    private  View view;
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // TODO Auto-generated method stub
       view= inflater.inflate(R.layout.layout2, container, false);

        //对View中控件的操作方法
        Button btn = (Button)view.findViewById(R.id.button1);
        btn.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View v) {
                // TODO Auto-generated method stub
                view.getContext().startActivity(new Intent(view.getContext(), Activity21.class));
                //Toast.makeText(getActivity(), "点击了第一个fragment的BTN", Toast.LENGTH_SHORT).show();
            }
        });
        Button btn2 = (Button)view.findViewById(R.id.button2);
        btn2.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View v) {
                // TODO Auto-generated method stub
                view.getContext().startActivity(new Intent(view.getContext(), BaiduMapActivity.class));
                //Toast.makeText(getActivity(), "点击了第一个fragment的BTN", Toast.LENGTH_SHORT).show();
            }
        });
        Button btn3 = (Button)view.findViewById(R.id.button3);
        btn3.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View v) {
                // TODO Auto-generated method stub
                view.getContext().startActivity(new Intent(view.getContext(), BaiduMapPlusActivity.class));
                //Toast.makeText(getActivity(), "点击了第一个fragment的BTN", Toast.LENGTH_SHORT).show();
            }
        });
        Button btn4 = (Button)view.findViewById(R.id.button4);
        btn4.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View v) {
                // TODO Auto-generated method stub
                view.getContext().startActivity(new Intent(view.getContext(), Activity22.class));
                //Toast.makeText(getActivity(), "点击了第一个fragment的BTN", Toast.LENGTH_SHORT).show();
            }
        });
        return view;
    }
}