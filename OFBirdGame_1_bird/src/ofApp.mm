#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){	

    ofEnableSmoothing();
    ofEnableAlphaBlending();
    ofSetFrameRate(60);
    ofBackground(255);
    
    //initial bird
    posX = 70;
    posY = 300;
    radius = 30;
    
    frc.set(0,0);
    vel.set(0, 0);
    gravity.set(0, 0.4);
}

//--------------------------------------------------------------
void ofApp::update(){

 
    vel.x += frc.x;
    vel.y += frc.y;
    
    vel.x += gravity.x;
    vel.y += gravity.y;
    
    posX += vel.x;
    posY += vel.y;
    
    
    //bounce off the ground
    if (posY >= ofGetHeight()-radius) {
        posY = ofGetHeight()-radius;
    }else if(posY <= radius){
        posY = radius;
    }
    
    frc.set(0, 0);
    

    
}

//--------------------------------------------------------------
void ofApp::draw(){
    
    //draw bird
    ofSetColor(255,0,220);
	ofCircle(posX, posY, radius);
 
    
}

//--------------------------------------------------------------
void ofApp::exit(){

}

//--------------------------------------------------------------
void ofApp::touchDown(ofTouchEventArgs & touch){
    
    //reset velocity and add a lift force
    vel.set(0,0);
    frc.set(0, -8);
 
}

//--------------------------------------------------------------
void ofApp::touchMoved(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void ofApp::touchUp(ofTouchEventArgs & touch){
   
}

//--------------------------------------------------------------
void ofApp::touchDoubleTap(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchCancelled(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void ofApp::lostFocus(){

}

//--------------------------------------------------------------
void ofApp::gotFocus(){

}

//--------------------------------------------------------------
void ofApp::gotMemoryWarning(){

}

//--------------------------------------------------------------
void ofApp::deviceOrientationChanged(int newOrientation){

}
