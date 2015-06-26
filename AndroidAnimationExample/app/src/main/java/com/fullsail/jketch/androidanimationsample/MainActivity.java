package com.fullsail.jketch.androidanimationsample;

import android.app.Activity;
import android.os.Bundle;
import android.os.Handler;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.Animation;
import android.view.animation.TranslateAnimation;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.ViewFlipper;


public class MainActivity extends Activity {

    ViewFlipper flipper;
Handler handler = new Handler();

    private int seconds = 2000;
    private boolean continueToRun = true;

    private Animation inFromRightAnimation() {
        Animation inFromRight = new TranslateAnimation(
                Animation.RELATIVE_TO_PARENT, +1.0f, Animation.RELATIVE_TO_PARENT, 0.0f,
                Animation.RELATIVE_TO_PARENT, 0.0f, Animation.RELATIVE_TO_PARENT, 0.0f
        );
        inFromRight.setDuration(300);
        inFromRight.setInterpolator(new AccelerateInterpolator());
        return inFromRight;
    }

    private Animation outToLeftAnimation() {
        Animation outtoLeft = new TranslateAnimation(
                Animation.RELATIVE_TO_PARENT, 0.0f, Animation.RELATIVE_TO_PARENT, -1.0f,
                Animation.RELATIVE_TO_PARENT, 0.0f, Animation.RELATIVE_TO_PARENT, 0.0f
        );
        outtoLeft.setDuration(300);
        outtoLeft.setInterpolator(new AccelerateInterpolator());
        return outtoLeft;
    }


    private final Runnable aRunnable = new Runnable() {

        //...
        public void run() {

            flipper.setInAnimation(inFromRightAnimation());
            flipper.setOutAnimation(outToLeftAnimation());
            flipper.showNext();

            if(continueToRun == true){
                handler.postDelayed(aRunnable, seconds);
            }

        }
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        flipper = (ViewFlipper) findViewById(R.id.theFlipper);

        ImageView im1 = (ImageView) findViewById(R.id.image1);
        im1.setImageResource(R.drawable.avengersironman);
        ImageView im2 = (ImageView) findViewById(R.id.image2);
        im2.setImageResource(R.drawable.avengerswarmachine);

        Button b1 = (Button) findViewById(R.id.button);


        handler.postDelayed(aRunnable, seconds);


        b1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                flipper.setInAnimation(inFromRightAnimation());
                flipper.setOutAnimation(outToLeftAnimation());
                flipper.showNext();

            }
        });

    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }
}
