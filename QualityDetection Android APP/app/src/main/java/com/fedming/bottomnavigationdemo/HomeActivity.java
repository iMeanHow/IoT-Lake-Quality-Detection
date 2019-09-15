package com.fedming.bottomnavigationdemo;

        import android.app.Activity;
        import android.app.LocalActivityManager;
        import android.content.Context;
        import android.content.Intent;
        import android.os.Bundle;
        import android.support.annotation.NonNull;
        import android.support.design.widget.BottomNavigationView;
        import android.support.v4.view.ViewPager;
        import android.support.v7.app.AppCompatActivity;
        import android.view.LayoutInflater;
        import android.view.MenuItem;
        import android.view.View;
        import android.view.ViewGroup;
        import android.view.Window;

/**
 * Created by bruce on 2016/11/1.
 * HomeActivity 主界面
 */

public class HomeActivity extends AppCompatActivity {

    private ViewPager viewPager;
    private MenuItem menuItem;
    private BottomNavigationView bottomNavigationView;
    private LocalActivityManager manager = new LocalActivityManager(this,true);
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home);
        manager.dispatchCreate(savedInstanceState);
        viewPager = (ViewPager) findViewById(R.id.viewpager);
        bottomNavigationView = (BottomNavigationView) findViewById(R.id.bottom_navigation);
        //默认 >3 的选中效果会影响ViewPager的滑动切换时的效果，故利用反射去掉
        //BottomNavigationViewHelper.disableShiftMode(bottomNavigationView);
        bottomNavigationView.setOnNavigationItemSelectedListener(
                new BottomNavigationView.OnNavigationItemSelectedListener() {
                    @Override
                    public boolean onNavigationItemSelected(@NonNull MenuItem item) {
                        switch (item.getItemId()) {
                            case R.id.item_news:
                                viewPager.setCurrentItem(0);
                                break;
                            case R.id.item_lib:
                                viewPager.setCurrentItem(1);
                                // viewPager.getContext().startActivity(new Intent(viewPager.getContext(), BaiduMapPlusActivity.class));
                                //viewPager.getContext().startActivity(BaiduMapActivity.class);
                                break;
                            case R.id.item_find:
                                viewPager.setCurrentItem(2);
                                break;
                            case R.id.item_more:
                                viewPager.setCurrentItem(3);
                                break;
                        }
                        return false;
                    }
                });

        viewPager.addOnPageChangeListener(new ViewPager.OnPageChangeListener() {
            @Override
            public void onPageScrolled(int position, float positionOffset, int positionOffsetPixels) {

            }

            @Override
            public void onPageSelected(int position) {
                if (menuItem != null) {
                    menuItem.setChecked(false);
                } else {
                    bottomNavigationView.getMenu().getItem(0).setChecked(false);
                }
                menuItem = bottomNavigationView.getMenu().getItem(position);
                menuItem.setChecked(true);
            }

            @Override
            public void onPageScrollStateChanged(int state) {
            }
        });

        //禁止ViewPager滑动
//        viewPager.setOnTouchListener(new View.OnTouchListener() {
//            @Override
//            public boolean onTouch(View v, MotionEvent event) {
//                return true;
//            }
//        });

        setupViewPager(viewPager);
    }

    private void setupViewPager(ViewPager viewPager) {
        ViewPagerAdapter adapter = new ViewPagerAdapter(getSupportFragmentManager());
        LayoutInflater mLayoutInflater = LayoutInflater.from(this);
        /*View tab1 = mLayoutInflater.inflate(R.layout.tab01, null);
        View tab2 = mLayoutInflater.inflate(R.layout.tab02, null);
        View tab3 = mLayoutInflater.inflate(R.layout.tab03, null);
        View tab4 = mLayoutInflater.inflate(R.layout.tab04, null);
        //加入到list中
        mViews.add(tab1);
        mViews.add(tab2);
        mViews.add(tab3);
        mViews.add(tab4);
        adapter.addFragment(tab1);*/
        //adapter.addFragment(new Fragment1());
        //adapter.addFragment(activityToView());
        adapter.addFragment(BaseFragment.newInstance("系统状态"));
        adapter.addFragment(BaseFragment.newInstance("系统状态"));
        adapter.addFragment(BaseFragment.newInstance("系统状态"));
        adapter.addFragment(BaseFragment.newInstance("系统状态"));
       // adapter.addFragment(new Fragment2());
        //adapter.addFragment(new Fragment3());
        //adapter.addFragment(new Fragment4());
        // adapter.addFragment(BaseFragment.newInstance("水质监测"));
        //adapter.addFragment(BaseFragment.newInstance("系统设置"));
        viewPager.setAdapter(adapter);
    }
    public View activityToView(Context parent, Intent intent){
        Window w;//这一行报错
        w = manager.startActivity(parent.getClass().getName(),intent);
        View wd = w !=null ? w.getDecorView() :null;
        if(wd!=null){
            wd.setVisibility(View.VISIBLE);
            wd.setFocusableInTouchMode(true);
            ((ViewGroup)wd).setDescendantFocusability(ViewGroup.FOCUS_AFTER_DESCENDANTS);
        }
        return wd;
    }
}