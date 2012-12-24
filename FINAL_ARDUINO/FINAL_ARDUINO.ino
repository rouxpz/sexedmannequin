#include <stdint.h>
#include "TouchScreen.h"

#define YP A7
#define XM A6
#define YM 48
#define XP 49

TouchScreen ts = TouchScreen(XP, YP, XM, YM, 300);

void setup() {
  Serial.begin(9600);
  pinMode(2, INPUT);
  pinMode(3, INPUT);
  pinMode(4, INPUT);
  pinMode(5, INPUT);
  pinMode(6, INPUT);
  pinMode(7, INPUT);
  pinMode(8, INPUT);
  pinMode(9, INPUT);
  pinMode(10, INPUT);
  pinMode(11, INPUT);
  pinMode(12, INPUT);
  pinMode(13, INPUT);
  pinMode(45, INPUT);
  pinMode(46, INPUT);
  pinMode(47, INPUT);
  pinMode(50, INPUT);
  pinMode(51, INPUT);
  pinMode(52, INPUT);
  pinMode(53, INPUT);
}

void loop() {
  Serial.read();
  Point p = ts.getPoint();
  
  int door1 = digitalRead(2);
  int door2 = digitalRead(3);
  int door3 = digitalRead(4);
  int door4 = digitalRead(5);
  int door5 = digitalRead(6);
  int door6 = digitalRead(7);
  int door7 = digitalRead(8);
  int door8 = digitalRead(9);
  
  int face1 = analogRead(A1)/4;
  int face2 = digitalRead(10);
  int face3 = digitalRead(11);
  int face4 = digitalRead(12);
  
  int questioning1 = analogRead(A2)/4;
  int questioning2 = digitalRead(13);
  
  int condomUse = analogRead(A3)/4;
  
  int pregnancy1 = analogRead(A4)/4;
  int pregnancy2 = digitalRead(46);
  
  int condomBroke1 = digitalRead(47);
  int condomBroke2 = map(analogRead(A5), 960, 1023, 0, 255);
  
  int std1 = analogRead (A8)/4;
  
  int oralSex1 = analogRead(A9)/4;
  int oralSex2 = analogRead(A10)/4;
  
  int birthControl1 = digitalRead(52);
  int birthControl2 = digitalRead(53);
  int birthControl3 = digitalRead(50);
  int birthControl4 = digitalRead(51);

  Serial.print(door1);
  Serial.print(",");
  Serial.print(door2);
  Serial.print(",");
  Serial.print(door3);
  Serial.print(",");
  Serial.print(door4);
  Serial.print(",");
  Serial.print(door5);
  Serial.print(",");
  Serial.print(door6);
  Serial.print(",");
  Serial.print(door7);
  Serial.print(",");
  Serial.print(door8);
  Serial.print(",");
  //Serial.print(face1);
  //Serial.print(","); 
  Serial.print(face2);
  Serial.print(","); 
  Serial.print(face3);
  Serial.print(","); 
  Serial.print(face4);
  Serial.print(","); 
  Serial.print(questioning1);
  Serial.print(","); 
  Serial.print(questioning2);
  Serial.print(",");
  Serial.print(condomUse);
  Serial.print(","); 
  Serial.print(pregnancy1);
  Serial.print(",");
  Serial.print(pregnancy2);
  Serial.print(","); 
  Serial.print(condomBroke1);
  Serial.print(","); 
  Serial.print(condomBroke2);
  Serial.print(","); 
  Serial.print(std1);
  Serial.print(",");
  Serial.print(p.x);
  Serial.print(",");
  Serial.print(p.y); 
  Serial.print(",");
  Serial.print (oralSex1);
  Serial.print(",");
  Serial.print(oralSex2);
  Serial.print(",");
  Serial.print(birthControl1);
  Serial.print(","); 
  Serial.print(birthControl2);
  Serial.print(","); 
  Serial.print(birthControl3);
  Serial.print(","); 
  Serial.print(birthControl4);
  Serial.println();   
}



