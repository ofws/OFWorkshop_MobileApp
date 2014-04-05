#pragma once

#include "ofMain.h"
#include "ofxiOS.h"
#include "ofxiOSExtras.h"
#import "AVSoundPlayer.h"

class ofApp : public ofxiOSApp{
	
    public:
        void setup();
        void update();
        void draw();
        void exit();
	
        void touchDown(ofTouchEventArgs & touch);
        void touchMoved(ofTouchEventArgs & touch);
        void touchUp(ofTouchEventArgs & touch);
        void touchDoubleTap(ofTouchEventArgs & touch);
        void touchCancelled(ofTouchEventArgs & touch);

        void lostFocus();
        void gotFocus();
        void gotMemoryWarning();
        void deviceOrientationChanged(int newOrientation);
    
        float posX, posY;
        ofPoint frc, vel, gravity;
        float radius;
    
    
        //fire
        float bombX[4];
        float bombY[4];
        float distance;
        float bombRadius;
        float speed;
    
        //star
        float starx[2];
        float stary[2];
        float starRadius;
    
        bool bGameOver;
    
        //scole
        int score;
        ofTrueTypeFont font;
    
        ofImage start_Image;
        ofImage bomb_Image;
        ofImage brid_Image;
        ofImage star_Image;
    
        //sound
        AVSoundPlayer *clickSound;
        AVSoundPlayer *deadSound;
};


