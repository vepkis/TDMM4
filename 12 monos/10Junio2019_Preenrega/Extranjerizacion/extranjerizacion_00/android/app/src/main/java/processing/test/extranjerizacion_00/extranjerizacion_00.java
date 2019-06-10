package processing.test.extranjerizacion_00;

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

public class extranjerizacion_00 extends PApplet {

Esferas objeto;
int i =2;



public void setup() {

  //  
  ///---------------------
  fullScreen();
  orientation(PORTRAIT);
  ///---------------------
  objeto = new Esferas();
  noStroke();
}



public void draw() {
  background(238);
  objeto.dibujar();


  if (objeto.tocar(i) >= 0)
    println(objeto.tocar(i));
}

public void mouseDragged()
{
  objeto.mover(i, mouseX, mouseY);
}
class Esfera {

  int pX, pY, radio;
  int c; 


  Esfera(int radio_, int px_, int py_, int c_) {
    pX=px_;
    pY=py_;
    radio=radio_;
    c=c_;
  } 


  public void dibujar() {
    fill(c);
    ellipse(pX, pY, radio*2, radio*2);
  }    


  public void mover(int px_, int py_) {
    pX=px_;
    pY=py_;
  } 


  public int PosX() {
    return pX;
  }  

  public int PosY() {
    return pY;
  }  

  public int Radio() {
    return radio;
  }  


  public int col() {
    return c;
  }  

  public void setColor(int c_) {
    c=c_;
  }
}
class Esferas {
  Esfera[] esf;
  int i, e=-1;
  int aux; 
  int esf0;
  int esf1;
  int esf2;
  int esf3;
  int esf4;
  int esf5;
  int esf6;
  int esf7;
  int esf8;
  int esf9;



  Esferas() { 
    esf0 = color (0xff33FFF0, 90);
    esf1 = color (0xffFF4C33, 90);
    esf2 = color (0xff000000, 90);
    esf3 = color (0xffE333FF, 90);
    esf4 = color (0xffFFBE33, 90);
    esf5 = color (0xffFF339F, 90);
    esf6 = color (0xff3383FF, 90);
    esf7 = color (0xffFF8D33, 90);
    esf8 = color (0xffFFF633, 90);
    

    esf = new Esfera[9];   

    // IZQUIERDA SUPERIOR
    esf[0] = new Esfera(100, width/5, height/5, esf0);  

    // DERECHA SUPERIOR
    esf[1] = new Esfera(60, width/2 + width/3, height/5, esf1);   
    

    //MOUSE X MOUSE Y PUNTERO)
    esf[2] = new Esfera(50, width/2, height/2, esf2 );


    // IZQUIERDA INFERIOR
    esf[3] = new Esfera(40, width/5, height/2+height/4, esf3);

    // DERECHA INFERIOR
    esf[4] = new Esfera(20, width/2 + width/5, height/2+height/4, esf4);    

    //IZQUIERDA INFERIOR
    esf[5] = new Esfera(80, width/8, height/2+height/4, esf5);    

    // IZQUIERDA SUPERIOR
    esf[6] = new Esfera(80, width/11, height/5, esf6);


    // DERECHA SUPERIOR     
    esf[7] = new Esfera(70, width/2+ width/4, height/5, esf7);

    // DERECHA INFERIOR
    esf[8] = new Esfera(150, width/2 + width/3, height/2+height/4, esf8);
  }


  public void dibujar() {

    for (i=0; i<9; i++)
      esf[i].dibujar();
  }   



  public void mover(int i_, int px_, int py_) {

    esf[i_].mover(px_, py_);
  } 


  public int tocar(int i_) {
    int retorno=-1;

    for (i=0; i<9; i++) {
      if (i != i_)
        if (dist(esf[i_].PosX(), esf[i_].PosY(), esf[i].PosX(), esf[i].PosY()) < esf[i_].Radio() + esf[i].Radio()) {
          retorno=i;  
          if (e != i) {
            e=i;

            aux= esf[i].col();
            esf[i].setColor(esf[i_].col());
            esf[i_].setColor(aux);
          }
        }
    }

    return retorno;
  }
}         
  public void settings() {  fullScreen(); }
}
