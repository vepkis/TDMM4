package processing.test.desigualidad_00;

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

public class desigualidad_00 extends PApplet {

Esferas p1;


int tam1;
int tam2;
int radio1;
int radio2;


public void setup() {

  ///---------------------
  
  orientation(PORTRAIT);
  ///---------------------
  p1 = new Esferas();

  tam1 = 160;
  tam2 = 160;
  radio1 = tam1/2;
  radio2 = tam2/2;
}


public void draw () {


  p1.dibujar();
  p1.cambiatamA();
  p1.cambiatamB();
}
class Esferas {
  int posXp1, posYp1;
  int posXp2, posYp2;
  int c1;
  int c2;
  int f;
  int umbralmin;


  Esferas () {

    posXp1 = width/2-width/5;
    posYp1 = height/2;
    posXp2 = width/2 + width/5;
    posYp2 = height  /2;
    c1 = color (255, 100, 100, 190);
    c2 = color (100, 255, 100, 190);
    f = color (238);
    umbralmin = 50;
  }

  public void dibujar () {
    background (f);
    noStroke();
    fill (c1);
    ellipse (posXp1, posYp1, tam1, tam1);
    fill (c2);
    ellipse (posXp2, posYp2, tam2, tam2);
  }


  public void cambiatamA() {
    float distanciaCentro = dist (posXp2, posYp2, mouseX, mouseY);
    if (distanciaCentro  <=  radio1 && tam2 > umbralmin) {
      tam1 += 1.3f;      
      tam2 -=0.4f;
      f = color (242, 196, 188, 79);
    } else {
      f = color(238);
    }
  }


  public void cambiatamB() {
    float distanciaCentro = dist (posXp1, posYp1, mouseX, mouseY);
    if (distanciaCentro  <=  radio2 && tam1 > umbralmin) {
      tam2 += 1.3f;
      tam1 -=0.4f;
      f = color (196, 242, 188, 79);
    }
  }
}
  public void settings() {  fullScreen(); }
}
