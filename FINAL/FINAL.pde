import processing.serial.*;
//import processing.video.*;

Serial port; //open serial port
int [] sensors = new int [26]; //set up sensor array

//initialize image variables
Images cover;
Images closeDoor;
Images know;
Images know1;
Images know2;
Images know3;
Images condomUse;
Images condomUse1;
Images questioning;
Images questioning1;
Images questioning2;
Images condomBroke;
Images condomBroke1;
Images condomBroke2;
Images missedPeriod;
Images missedPeriod1;
Images missedPeriod2;
Images std;
Images std1;
Images std2;
Images oralSex;
Images oralSex1;
Images oralSex2;
Images birthControl;
Images birthControl1;
Images birthControl2;
Images birthControl3;
Images birthControl4;

Cells cells;

//Movie video;

boolean doorOpen = false;

int state = 0; //initialize master state
int knowState = 0;
int condomUseState = 0;
int questioningState = 0;
int condomBrokeState = 0;
int missedPeriodState = 0;
int stdState = 0;
int oralSexState = 0;
int birthControlState = 0;

void init() {
  frame.removeNotify();
  frame.setUndecorated(true);
  frame.addNotify();
  super.init();
}


void setup () {
  size (1280, 800);
  smooth();

  //load all images
  cover = new Images("cover.png", 255);
  closeDoor = new Images("close_door.png", 255);
  know = new Images("am_i_ready1.png", 255);
  know1 = new Images("am_i_ready2.png", 255);
  know2 = new Images("am_i_ready3.png", 255);
  know3 = new Images("am_i_ready4.png", 255);
  condomUse = new Images("condom1.png", 255);
  condomUse1 = new Images("condom2.png", 255);
  questioning = new Images("questioning1.png", 255);
  questioning1 = new Images("questioning2.png", 255);
  questioning2 = new Images("questioning3.png", 255);
  condomBroke = new Images("condom_broke1.png", 255);
  condomBroke1 = new Images("condom_broke2.png", 255);
  condomBroke2 = new Images("condom_broke3.png", 255);
  missedPeriod = new Images("missed_period1.png", 255);
  missedPeriod1 = new Images("missed_period2.png", 255);
  missedPeriod2 = new Images("missed_period3.png", 255);
  std = new Images("stds1.png", 255);
  std1 = new Images("stds2.png", 255);
  std2 = new Images("stds3.png", 255);
  oralSex = new Images("oral_sex1.png", 255);
  oralSex1 = new Images("oral_sex2.png", 255);
  oralSex2 = new Images("oral_sex3.png", 255);
  birthControl = new Images("birth_control1.png", 255);
  birthControl1 = new Images("birth_control2.png", 255);
  birthControl2 = new Images("birth_control3.png", 255);
  birthControl3 = new Images("birth_control4.png", 255);
  birthControl4 = new Images("birth_control5.png", 255);

  cells = new Cells("cells.png", 100, 250);
  
  //video = new Movie(this,"condom_video_FINAL.mov");

  println(Serial.list());
  port = new Serial(this, Serial.list()[0], 9600);
  port.bufferUntil('\n');
}

/*void movieEvent(Movie video) {
  video.read();
}*/
  
void draw () {
  //frame.setLocation(0,0);
  
  background (255); 
  //println(sensors);

  if (state == 0) {
    //display welcome screen
    cover.display();
  } 
  else if (state == 1) {
    //display "how do i know"
    know.display();
    //knowState = 1;
    for (int sensorNum = 8; sensorNum < 11; sensorNum++) {
      if (sensors[sensorNum] > 0) {
        know.decrease = sensors[sensorNum]*10;
        know.fade();
        if (know.a < -20 && sensorNum == 8) {
          knowState = 2;
        } 
        else if (know.a < -20 && sensorNum == 9) {
          knowState = 3;
        } 
        else if (know.a < -20 && sensorNum == 10) {
          knowState = 4;
        }
      }
    }
    if (knowState == 2) {
      know1.display();
    } 
    else if (knowState == 3) {
      know2.display();
    } 
    else if (knowState == 4) {
      know3.display();
    }
  }

  else if (state == 2) {
    //display "proper condom usage"
    condomUse.display();
    //condomUseState = 1;
    condomUse.decrease = map(sensors[13], 170, 130, 0, 55);
    condomUse.fade();
    if (condomUse.a < 0) {
      condomUseState = 2;
      condomUse1.display();
      //video.loop();
      //image(video,256,112);
    }
  }
  else if (state == 3) {
    //display "questioning"
    questioning.display();
    //questioningState = 1;
    questioning.decrease = map(sensors[11], 0, 244, 0, 10);
    questioning.fade();
    if (questioning.a < -20) {
      questioningState = 2;
      questioning1.display();
      questioning1.decrease = sensors[12]*10;
      questioning1.fade();
      if (questioning1.a < -20) {
        questioningState = 3;
        questioning2.display();
      }
    }
  } 
  else if (state == 4) {
    //display "condom broke"
    condomBroke.display();
    //condomBrokeState = 1;
    condomBroke.decrease = sensors[16]*10;
    condomBroke.fade();
    if (condomBroke.a < -20) {
      condomBrokeState = 2;
      condomBroke1.display();
      condomBroke1.decrease = map(sensors[17], 255, 0, 0, 75);
      condomBroke1.fade();
      if (condomBroke1.a < -20) {
        condomBrokeState = 3;
        condomBroke2.display();
      }
    }
  } 
  else if (state == 5) {
    //display "missed period"
    missedPeriod.display();
    missedPeriodState = 1;
    missedPeriod.decrease = sensors[15]*10;
    missedPeriod.fade();
    if (missedPeriod.a < -20) {
      missedPeriodState = 2;
      missedPeriod1.display();
      missedPeriod1.decrease = map(sensors[14], 0, 244, 0, 10);
      missedPeriod1.fade();
      if (missedPeriod1.a < -20) {
        missedPeriodState = 3;
        missedPeriod2.display();
      }
    }
  } 
  else if (state == 6) {
    //display "stds"
    std.display();
    stdState = 1;
    std.decrease = map(sensors[18], 0, 245, 0, 55);
    std.fade();
    if (std.a < -1000) {
      stdState = 2;
      std1.display();
      cells.display();
      cells.x = map(sensors[20], 0, 930, 0, 1280);
      cells.y = map(sensors[19], 0, 910, 800, 0);
      if (cells.x >= 950) {
        std1.a = std1.a-20;
      }
      if (std1.a < -20) {
        stdState = 3;
        std2.display();
      }
    }
  } 
  else if (state == 7) {
    //display "oral sex"
    doorOpen = true;
    oralSex.display();
    oralSexState = 1;
    oralSex.decrease = map(sensors[21], 0, 245, 0, 55);
    oralSex.fade();
    if (oralSex.a < -1000) {
      oralSexState = 2;
      oralSex1.display();
      oralSex1.decrease = map(sensors[22], 0, 245, 0, 55);
      oralSex1.fade();
      if (oralSex1.a < -1000) {
        oralSexState = 3;
        oralSex2.display();
      }
    }
  }
  else if (state == 8) {   
    //display "birth control"
    birthControl.display();
    //birthControlState = 1;
    if (sensors[23] > 0) {
      birthControl.decrease = sensors[23]*10;
      birthControl.fade();
      if (birthControl.a < -20) {
        birthControlState = 2;
      }
    } 
    else if (sensors[24] > 0) {
      birthControl.decrease = sensors[24]*10;
      birthControl.fade();
      if (birthControl.a < -20) {
        birthControlState = 3;
      }
    } 
    else if (sensors[25] > 0) {
      birthControl.decrease = sensors[25]*10;
      birthControl.fade();
      if (birthControl.a < -20) {
        birthControlState = 4; 
      }
    } 
    else if (sensors[26] > 0) {
      birthControl.decrease = sensors[26]*10;
      birthControl.fade();
      if (birthControl.a < -20) {
        birthControlState = 5;
      }
    }
    
    if (birthControlState == 2) {
      birthControl1.display();
    } else if (birthControlState == 3) {
      birthControl2.display();
    } else if (birthControlState == 4) {
      birthControl3.display();
    } else if (birthControlState == 5) {
      birthControl4.display();
    }
  } 

  else if (state == 9) {
    closeDoor.display();
  }


  //switch open code -- determines topic
  for (int sensorNum = 0; sensorNum < 8; sensorNum++) {
    if (sensors[0] == 1 && sensors[1] == 1 && sensors[2] == 1 && sensors[3] == 1 && sensors[4] == 1 && sensors[5] == 1 && sensors[6] == 1 && sensors[7] == 1) {
      state = 0;
      doorOpen = false;
    }
    else if (sensors[sensorNum] == 0) {
      doorOpen = true;

      int prevState = state;
      state = (sensorNum+1);
      if (state == 1 && prevState != 1) {
        knowState = 1;
        know.a = 255;
      }
      
      if (state == 2 && prevState != 2) {
        condomUseState = 1;
        condomUse.a = 255;
      }
      
      if (state == 3 && prevState !=3) {
        questioningState = 1;
        questioning.a = 255;
        questioning1.a = 255;
      }
      
      if (state == 4 && prevState !=4) {
        condomBrokeState = 1;
        condomBroke.a = 255;
        condomBroke1.a = 255;
      }
      
      if (state == 5 && prevState !=5) {
        missedPeriodState = 1;
        missedPeriod.a = 255;
        missedPeriod1.a = 255;
      }
      
      if (state == 6 && prevState !=6) {
        stdState = 1;
        std.a = 255;
        std1.a = 255;
      }
      
      if (state == 7 && prevState !=7) {
        oralSexState = 1;
        oralSex.a = 255;
        oralSex1.a = 255;
      }
      
      if (state == 8 && prevState !=8) {
        birthControlState = 1;
        birthControl.a = 255;
      }
    }

    if (sensors[0] == 0) {
      if (sensorNum > 0 && sensorNum < 8) {
        if (sensors[sensorNum] == 0) {
          state = 9;
        }
      }
    }
    
    if (sensors[1] == 0) {
      if (sensorNum > 1 && sensorNum < 8) {
        if (sensors[sensorNum] == 0) {
          state = 9;
        }
      }
    }
    
    if (sensors[2] == 0) {
      if (sensorNum > 2 && sensorNum < 8) {
        if (sensors[sensorNum] == 0) {
          state = 9;
        }
      }
    }
    
    if (sensors[3] == 0) {
      if (sensorNum > 3 && sensorNum < 8) {
        if (sensors[sensorNum] == 0) {
          state = 9;
        }
      }
    }
    
    if (sensors[4] == 0) {
      if (sensorNum > 4 && sensorNum < 8) {
        if (sensors[sensorNum] == 0) {
          state = 9;
        }
      }
    }
    
    if (sensors[5] == 0) {
      if (sensorNum > 5 && sensorNum < 8) {
        if (sensors[sensorNum] == 0) {
          state = 9;
        }
      }
    }
    
    if (sensors[6] == 0) {
      if (sensorNum > 6 && sensorNum < 8) {
        if (sensors[sensorNum] == 0) {
          state = 9;
        }
      }
    }
  }
}


void serialEvent (Serial port) {
  String myString = port.readStringUntil('\n');

  if (myString != null) {
    //println("receiving:" + myString);
    String testString = trim(myString);
    sensors = int(split(testString, ","));
    for (int sensorNum = 0; sensorNum< sensors.length; sensorNum++) {
      if (sensors[sensorNum] > 0) {
        // println("Sensor reading:" + sensorNum);
      }
      //println();
    }
  }
}

