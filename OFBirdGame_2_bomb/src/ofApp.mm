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
    
    //let's create bombs
    distance = 280;
    bombRadius = 45;
    speed = 1;
    //bomb position
    bombX[0] = ofGetWidth()+bombRadius;
    bombY[0] = 127;
    bombX[1] = bombX[0];
    bombY[1] = bombY[0]+distance;
    
    bombX[2] = bombX[0]+200;
    bombY[2] = 200;
    bombX[3] = bombX[2];
    bombY[3] = bombY[2]+distance;
  
}

//--------------------------------------------------------------
void ofApp::update(){

    
    vel.x += frc.x;
    vel.y += frc.y;
    
    vel.x += gravity.x;
    vel.y += gravity.y;
    
    posX += vel.x;
    posY += vel.y;
    
    
    //bounce off the wall
    if (posY >= ofGetHeight()-radius) {
        posY = ofGetHeight()-radius;
    }else if(posY <= radius){
        posY = radius;
    }
    
    frc.set(0, 0);
    
    //let's change bombs positions
    for (int i=0; i<4; i+=2) {
        bombX[i]-=speed;
        bombX[i+1]-=speed;
    }
    
    
    
    //let's reset bomb if they get out of screen
    for (int i=0; i<4; i+=2) {
        if (bombX[i] < -bombRadius) {
            bombX[i] = ofGetWidth()+radius;
            bombX[i+1] = ofGetWidth()+radius;
            
            //we randomly reset y
            bombY[i] = (int)ofRandom(ofGetHeight()/2);
            bombY[i+1] = bombY[i] + distance;
         
        }
    }

    
}

//--------------------------------------------------------------
void ofApp::draw(){
    
    //draw bird
    ofSetColor(255,0,220);
	ofCircle(posX, posY, radius);
   
    for (int i=0; i<4; i++) {
        ofSetColor(0,255,30);
        ofCircle(bombX[i], bombY[i], bombRadius);
    }
    

    
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
