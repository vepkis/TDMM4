package processing.test.acosobb_00_03;

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

public class AcosoBB_00_03 extends PApplet {

Mundo m;
public void setup ()
{
  //size (400, 400);
  ///---------------------
  
  orientation(PORTRAIT);
  ///---------------------  
  m= new Mundo();
  
  noStroke();
}


public void draw ()

{
  background (238);
  m.dibuja();
}


public void mouseDragged()
{
  //  m.setPxPy(mouseX, mouseY);
  // m.evaluaAvance();
}
public void mouseReleased()
{
  m.mouseReleased();
}

public void mousePressed()
{
  m.mousePressed();
}
class Esferita
{
  float px, py, tam, disty;
  float umbral, vel, angulo;
  int farbe= RGB;
  float alpha;
  Esferita()
  {

    farbe= color(255, 100, 0);
    alpha=255;
    px=width/2;
    py=height/2;
    tam=20;
    umbral=tam*2;
    vel=1;
  }

  Esferita(float px_, float py_, float tam_, int farbe_, float alpha_)
  {

    farbe= farbe_;
    alpha=alpha_;
    px=px_;
    py=py_;
    tam=tam_;
    umbral=tam*2;
    vel=1;
  }

  public void dibuja()
  {
    esferita();
  }


  public void sumaPunto()
  {
    if (disty<umbral)
    {
      px-=vel*cos(angulo);
      py-=vel*sin(angulo);
    }
  }

  public void evaluaAvance(float otherX, float otherY)
  {   
    angulo = atan2( otherY-py, otherX-px );
    sumaPunto();
  }


  public void sumaPuntoDOS()

  {
  }


  public void esferita() 
  {
    pushStyle();
    fill(farbe, alpha);
    ellipse(px, py, tam, tam);
    popStyle();
  }


  public float  disty(float otherX, float otherY)
  {
    disty= dist(px, py, otherX, otherY);
    //   println(disty);
    return disty;
  }

  public void setPxy(float px_, float py_)
  {

    px= px_;
    py= py_;
  }

  public void setUmbral(float umbral_)
  {
    umbral=umbral_;
  }


  public void setVel(float vel_)
  {
    vel= vel_;
  }

  public void setSumaVel(float vel_)
  {
    vel+= vel_;
  }

  public float [] getPxy()

  {
    float []pXY= new float []{px, py};
    return pXY;
  }
  public float getTam()
  {
    return tam;
  }

  public float getDisty()

  {
    return disty;
  }


  public float getUmbral()
  {
    return umbral;
  }
}//cierra class Esferita
class Mundo
{
  Esferita e;//user
  Esferita [] eDoble= new Esferita[20];
  int tamVictim;


  boolean tocaUser= false;
  Mundo()
  {
    e= new Esferita ();

    tamVictim= PApplet.parseInt(e.getTam())*3;
    for (int i=0; i< eDoble.length; i++)
    {
      eDoble[i]= new Esferita (random(tamVictim, width-tamVictim), random(tamVictim, height-tamVictim), random(tamVictim, tamVictim*4), color(30, 30, 30), 255);
      eDoble[i].setUmbral(tamVictim*4);
      eDoble[i].setVel(8);
    }
  }


  public void dibuja()
  {
    setUserMov();
    for (int i=0; i< eDoble.length; i++)
    {
      eDoble[i].dibuja();
    }
  }

  public void setUserMov()
  {

    if (tocaUser)
    {
      e.setPxy(mouseX, mouseY);

      e.dibuja();
    }


    evaluaAcosador();
    reaparece();
  }

  public void evaluaAcosador()
  {
    for (int i=0; i< eDoble.length; i++)
    {
      //    println(eDoble[i].disty(e.px, e.py)+"_____"+eDoble[i].getUmbral());

      if (eDoble[i].disty(e.px, e.py)< eDoble[i].getTam())
      {
        eDoble[i].evaluaAvance(e.px, e.py);
      }
    }
  }

  public void reaparece()
  {

    for (int i=0; i< eDoble.length; i++)
    {
      if ((eDoble[i].getPxy()[0] > width+eDoble[i].getTam()/4 || eDoble[i].getPxy()[0] < -eDoble[i].getTam()/4) || ( eDoble[i].getPxy()[1] > height+eDoble[i].getTam()/4 || eDoble[i].getPxy()[1] < -eDoble[i].getTam()/4))
      {
        eDoble[i].setPxy(random(e.getTam()*3, width-e.getTam()*3), random(e.getTam()*3, height-e.getTam()*3));
        eDoble[i].setSumaVel(4);
      }
    }
  }


  public void mousePressed()
  {

    tocaUser=true;
  }

  public void mouseReleased()
  {
    tocaUser=false;
  }
}// cierra class Mundo
  public void settings() {  fullScreen();  smooth(); }
}
