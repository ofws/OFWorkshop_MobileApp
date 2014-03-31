#include "testApp.h"

//--------------------------------------------------------------
void testApp::setup(){	

    ofEnableSmoothing();
    ofEnableAlphaBlending();
    ofSetFrameRate(60);
    ofBackground(255);
    
    //initial bird
    posx = 70;
    posy = 300;
    raidus = 30;
    
    frc.set(0,0);
    vel.set(0, 0);
    gravity.set(0, 0.4);
}

//--------------------------------------------------------------
void testApp::update(){

 
    vel.x += frc.x;
    vel.y += frc.y;
    
    vel.x += gravity.x;
    vel.y += gravity.y;
    
    posx += vel.x;
    posy += vel.y;
    
    
    //bounce off the wall
    if (posy >= ofGetHeight()-raidus) {
        posy = ofGetHeight()-raidus;
    }else if(posy <= raidus){
        posy = raidus;
    }
    
    frc.set(0, 0);
    

    
}

//--------------------------------------------------------------
void testApp::draw(){
    
    //draw bird
    ofSetColor(255,0,220);
	ofCircle(posx, posy, raidus);
 
    
}

//--------------------------------------------------------------
void testApp::exit(){

}

//--------------------------------------------------------------
void testApp::touchDown(ofTouchEventArgs & touch){
    
    //reset velocity and add a lift force
    vel.set(0,0);
    frc.set(0, -8);
 
}

//--------------------------------------------------------------
void testApp::touchMoved(ofTouchEventArgs & touch){
}

//--------------------------------------------------------------
void testApp::touchUp(ofTouchEventArgs & touch){
   
}

//--------------------------------------------------------------
void testApp::touchDoubleTap(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void testApp::touchCancelled(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void testApp::lostFocus(){

}

//--------------------------------------------------------------
void testApp::gotFocus(){

}

//--------------------------------------------------------------
void testApp::gotMemoryWarning(){

}

//--------------------------------------------------------------
void testApp::deviceOrientationChanged(int newOrientation){

}
