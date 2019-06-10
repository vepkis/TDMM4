package processing.test.vanidad_02;

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

public class Vanidad_02 extends PApplet {

Mundo m;

public void setup ()
{
  //  size(800, 800, P3D);
  ///---------------------
  
  orientation(LANDSCAPE);
  ///---------------------  
  m= new Mundo();
  noStroke();
  //  noCursor();
  frameRate(75);
  
}


public void draw ()

{

  m.dibuja();
}


public void mouseDragged()
{
  m. mouseDragged();
}

public void keyPressed()
{
  m.keyPressed();
}
class Espacio
{


  int farbe= color(200, 60, 0, 255);

  float zrPosX, zrPosY, zrTamAncho, zrTamAlto, zpPosX, zpPosY, zpTamAncho, zpTamAlto;
  float zrAlpha, zpAlpha;
  int zrFarbe= RGB, zpFarbe= RGB;



  Espacio()

  {
    zrFarbe= color(255, 255, 255);
    zrAlpha=10;
    zpFarbe= color(240, 240, 240);
    zpAlpha=255;

    zrPosX=0;
    zrPosY=0;
    zrTamAncho=(width/3)-m.nar.getTam()+10;
    zrTamAlto= height;

    zpPosX=(width/3)-m.nar.getTam()+10;
    zpPosY=0;
    zpTamAncho=width;
    zpTamAlto=height;
  }

  Espacio(float zrPosX_, float zrPosY_, float zrTamAncho_, float zrTamAlto_, float zpPosX_, float zpPosY_, float zpTamAncho_, float zpTamAlto_)

  {
    zrFarbe= color(255, 255, 255);
    zrAlpha=10;
    zpFarbe= color(240, 240, 240);
    zpAlpha=255;

    zrPosX=zrPosX_;
    zrPosY=zrPosY_;
    zrTamAncho=zrTamAncho_;
    zrTamAlto= zrTamAlto_;

    zpPosX=zpPosX_;
    zpPosY=zpPosY_;
    zpTamAncho=zpTamAncho_;
    zpTamAlto=zpTamAlto_;
  }

  Espacio(float zrPosX_, float zrPosY_, float zrTamAncho_, float zrTamAlto_, float zpPosX_, float zpPosY_, float zpTamAncho_, float zpTamAlto_, int zReflejo_, int zPelotita_)

  {
    zrFarbe= zReflejo_;
    zrAlpha=10;
    zpFarbe= zPelotita_;
    zpAlpha=255;

    zrPosX=zrPosX_;
    zrPosY=zrPosY_;
    zrTamAncho=zrTamAncho_;
    zrTamAlto= zrTamAlto_;

    zpPosX=zpPosX_;
    zpPosY=zpPosY_;
    zpTamAncho=zpTamAncho_;
    zpTamAlto=zpTamAlto_;
  }
  public void dibuja()

  {
    fill(zrFarbe, zrAlpha);
    rect(zrPosX, zrPosY, zrTamAncho, zrTamAlto);

    fill(zpFarbe, zpAlpha);
    rect(zpPosX, zpPosY, zpTamAncho, zpTamAlto);
  }



  public void zonaReflejo()

  {
    fill(zrFarbe, zrAlpha);
    rect(zrPosX, zrPosY, zrTamAncho, zrTamAlto);
  }


  public void zonaPelotita()
  {
    fill(zpFarbe, zpAlpha);
    rect(zpPosX, zpPosY, zpTamAncho, zpTamAlto);
  }

  public void setZrPosXY(float zrPosX_, float zrPosY_)
  {
    zrPosX= zrPosX_;
    zrPosY= zrPosY_;
  }

  public void setZpPosXY(float zpPosX_, float zpPosY_)
  {
    zpPosX= zpPosX_;
    zpPosY= zpPosY_;
  }

  public void setZrTamAA(float zrTamAncho_, float zrTamAlto_)
  {
    zrTamAncho= zrTamAncho_;
    zrTamAlto= zrTamAlto_;
  }

  public void setZpTamAA(float zpTamAncho_, float zpTamAlto_)
  {
    zpTamAncho= zpTamAncho_;
    zpTamAlto= zpTamAlto_;
  }

  public void setZrFarbe(int zrFarbe_)
  {
    zrFarbe= zrFarbe_;
  }

  public void setZpFarbe(int zpFarbe_)
  {
    zpFarbe= zpFarbe_;
  }


  public void setZrAlpha(float zrAlpha_)
  {
    zrAlpha= zrAlpha_;
  }

  public void setZpAlpha(float zpAlpha_)
  {
    zpAlpha= zpAlpha_;
  }
}// cierra class Espacio
class Mundo
{

  // Espejo e= new Espejo();
  Espacio esp;
  int[] farbeLerp= {color(240, 240, 240), color(255, 100, 5) };

  Narciso nar;
  Narciso reflejoNar;
  float tamNar;

  Mundo()
  {
    tamNar=40;

    nar= new Narciso();
    reflejoNar= new  Narciso(tamNar*2, height/2, tamNar*2, 0);
    reflejoNar.setFarbe(farbeLerp[1]);
    // esp= new Espacio(0, 0, (width/3)-nar.getTam()+10, height, (width/3)-nar.getTam()+10, 0, width, height);
    esp= new Espacio(0, 0, (width/3)-nar.getTam()+10, height, (width/3)-nar.getTam()+10, 0, width, height, color(255, 255, 255), farbeLerp[0]);
    background(240);
  }


  public void dibuja()
  {
    esp.dibuja();
    nar.dibuja();
    reflejoNar.dibuja();
    // funcionEvaluadora();
    // e.dibuja();
  }

  /*
  void funcionEvaluadora()
   
   {
   if (  p.getMovPelotita()< p.getTam()*2.5)
   {
   e.setTam("crece");
   } else
   {
   e.setTam("nada");
   }
   }
   
   */

  public void setMovReflejo()
  {

    float mappy= map(nar.getPxPy()[0], width-nar.getTam()*2, width/3+nar.getTam(), reflejoNar.getTam(), width/3- reflejoNar.getTam() );

    float mappyAlpha= map(nar.getPxPy()[0], width-nar.getTam()*2, width/3+nar.getTam(), 0, 50 );

    float mappyTam= map(nar.getPxPy()[0], width-nar.getTam()*2, width/3+nar.getTam(), 0, tamNar*3 );

    float mappylerpColor= map(nar.getPxPy()[0], width-nar.getTam(), width/3, 0, 99 );

    reflejoNar.setAlpha(mappyAlpha);
    reflejoNar.setPxPy(mappy, nar.getPxPy()[1]);
    reflejoNar.setTam(mappyTam);

    int interZpFarbe = lerpColor(farbeLerp[0], farbeLerp[1], mappylerpColor/100);
    int interNarFarbe=lerpColor(farbeLerp[1], farbeLerp[0], mappylerpColor/100);
    esp.setZpFarbe(interZpFarbe);
    nar.setFarbe(interNarFarbe);


    println(mappylerpColor/100);
  }

  public void mouseDragged()
  {
    if (mouseX>width/3 && mouseX<width-nar.getTam())
    {
      nar.setPx(mouseX);
    }
    nar.setPy(mouseY);

    setMovReflejo();
  }

  public void keyPressed()
  {
    //  e.keyPressed();
  }
}// cierra class mundo
class Narciso
{
  float tx, ty, px, py, tam;
  int farbe= RGB;
  float alpha;
  Narciso()
  {
    tam= 40;

    px=width-tam*2;
    py= height/2;
    farbe= color(255, 100, 5);
    alpha=255;
  }

  Narciso(float px_, float py_, float tam_, float alpha_)
  {
    tam= tam_;

    px=px_;
    py= py_;
    farbe= color(255, 100, 5);
    alpha= alpha_;
  }

  public void dibuja()
  {
    pushMatrix();
    pushStyle();
    fill(farbe, alpha);
    ellipse(px, py, tam, tam);
    popStyle();
    popMatrix();
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
  public void setTxTy(float tx_, float ty_)
  {
    tx=tx_;
    ty=ty_;
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
  public void settings() {  fullScreen();  smooth(); }
}
