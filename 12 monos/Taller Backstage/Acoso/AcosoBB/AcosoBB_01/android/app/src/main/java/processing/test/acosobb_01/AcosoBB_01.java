package processing.test.acosobb_01;

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

public class AcosoBB_01 extends PApplet {

Mundo m;

public void setup ()
{
 // size (800, 800); 
  
  m= new Mundo();
}

public void draw()

{
  background(255);
  m.dibuja();
}
class Cascabel
{
  float px, py, prePx, prePy, tam, pZonaX, pZonaY, pZonaTam, disty, distyCirculos;
  float umbral, vel, angulo;
  boolean movPermitido, movZona;
  String dir= null;


  int farbe= RGB;
  float alpha;
  Cascabel()
  {
    pZonaX= width/2;
    pZonaY= height/2;
    pZonaTam= width/4;

    px=width/2;
    py=height/2;
    prePx=px;
    prePy=py;
    tam=pZonaTam/3;
    umbral=pZonaTam-tam;
    vel=1;
    farbe= color(200, 0, 10);
    alpha=255;
  }

  Cascabel(float px_, float py_, float tam_, float alpha_)
  {
    tam= tam_;

    px=px_;
    py= py_;
    farbe= color(200, 0, 10);
    alpha= alpha_;
  }

  public void dibuja()
  {
    zona();
    esferita();
    presion();
    detectaDir();
  }

  public void zona()
  {
    pushStyle();
    fill(0);
    ellipse(pZonaX, pZonaY, pZonaTam, pZonaTam);
    popStyle();
  }
  public void esferita() 
  {
    pushStyle();
    fill(240, 5, 45);
    ellipse(px, py, tam, tam);
    popStyle();
  }

  public void distyDentroZona()
  {
    disty= dist(mouseX, mouseY, pZonaX, pZonaY);
    //  println(disty+"______"+umbral+ "_________"+px);
  }

  public void evalua()
  {
    distyDentroZona();
  }

  public void sumaPunto()
  {  
    distyDentroZona();

    if (disty<umbral/2 )
    {
      px=mouseX;
      py=mouseY;
    }


    //   println(movPermitido);
  }

  public void restaPunto()
  {  
    if (disty>tam/3 && disty<umbral)
    { 
      evaluaRegreso();

      px-=vel*cos(angulo);
      py-=vel*sin(angulo);
    }
  }

  public void evaluaRegreso()
  {   
    angulo = atan2( py-prePy, px-prePx );
  }

  public void presion()
  {
    if (mousePressed)
    {
      sumaPunto();
    } else
    {
      restaPunto();
    }
  }

  public void detectaDir()
  {
    if (px>prePx)
    {
      dir= "avanza";
    }
    if (px<prePx)
    {
      dir= "retrocede";
    }

    if (distyCirculos<=1)
    {
      dir= null;
    }
    distyCirculos= dist(px, py, pZonaX, pZonaY);

    println(disty+"__"+distyCirculos+"______"+dir);
  }

  public void setPxPy(float px_, float py_)
  {

    px= px_;
    py= py_;
  }

  public void setPx(float px_)
  {

    px=px_;
  }
  public void setPy(float py_)
  {

    py=py_;
  }

  public void setTam(float tam_)
  {
    tam=tam_;
  }

  public void setFarbe(int farbe_)
  {
    farbe= farbe_;
  }

  public void setAlpha(float alpha_)
  {
    alpha= alpha_;
  }


  public float getTam()
  {
    return tam;
  }

  public float [] getPxPy()
  {
    float [] pxy= new float []{px, py};
    return pxy;
  }

  public float getAlpha()
  {
    return alpha;
  }
}//____ cierra class Narciso
class Fantasmas
{
  float px, py, prePx, prePy, tam, pZonaX, pZonaY, pZonaTam, disty;
  float umbral, vel, angulo;
  boolean movPermitido;
  Fantasmas()
  {
    pZonaTam= 50;
    pZonaX=random(pZonaTam, width-pZonaTam);
    pZonaY= random(pZonaTam, height-pZonaTam);
  }


  public void dibuja()
  {
    nucleo();
  }

  public void nucleo ()
  {
    ellipse(pZonaX, pZonaY, pZonaTam, pZonaTam);
  }
}// cierra clase Fantasmas
class Mundo
{
  Cascabel c;
  Fantasmas f;

  float pA, pB, pX, pY;
  int farbe= RGB;
  Mundo ()
  {
    c= new Cascabel();
    f= new Fantasmas();
  }

  public void dibuja()

  {
    //    c.setPxPy(mouseX, mouseY);
    c.dibuja();
    f.dibuja();
  }
}//cierra class Mundo
  public void settings() {  fullScreen(); }
}
