package processing.test.hue_22;

import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Hue_22 extends PApplet {

/**
 * Hue. 
 * 
 * Hue is the color reflected from or transmitted through an object 
 * and is typically referred to as the name of the color (red, blue, yellow, etc.) 
 * Move the cursor vertically over each bar to alter its hue. 
 */
 
int barWidth = 5;
int[] hue;

public void setup() 
{
  
  colorMode(HSB, 360, height, height);  
  hue = new int[width/barWidth];
  noStroke();
}

public void draw() 
{
  int j = 0;
  for (int i=0; i<=(width-barWidth); i+=barWidth) {  
    if ((mouseX > i) && (mouseX < i+barWidth)) {
      hue[j] = mouseY;
    }
    fill(hue[j], height/1.2f, height/1.2f);
    rect(i, 0, barWidth, height);  
    j++;
  }
}
  public void settings() {  size(200, 200); }
}
