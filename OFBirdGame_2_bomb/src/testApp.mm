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
    
    //let's create bombs
    distance = 280;
    bombRadius = 45;
    speed = 1;
    //bomb postion
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
    
    //let's change bombs positions
    for (int i=0; i<4; i+=2) {
        bombX[i]-=speed;
        bombX[i+1]-=speed;
    }
    
    
    
    //let's reset bomb if they get out of screen
    for (int i=0; i<4; i+=2) {
        if (bombX[i] < -bombRadius) {
            bombX[i] = ofGetWidth()+raidus;
            bombX[i+1] = ofGetWidth()+raidus;
            
            //we randomly reset y
            bombY[i] = (int)ofRandom(ofGetHeight()/2);
            bombY[i+1] = bombY[i] + distance;
         
        }
    }

    
}

//--------------------------------------------------------------
void testApp::draw(){
    
    //draw bird
    ofSetColor(255,0,220);
	ofCircle(posx, posy, raidus);
   
    for (int i=0; i<4; i++) {
        ofSetColor(0,255,30);
        ofCircle(bombX[i], bombY[i], bombRadius);
    }
    

    
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
