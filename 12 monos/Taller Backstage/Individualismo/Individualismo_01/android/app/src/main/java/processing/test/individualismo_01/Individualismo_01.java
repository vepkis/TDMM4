package processing.test.individualismo_01;

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

public class Individualismo_01 extends PApplet {

PImage ima;
Comportamiento comp;
public void setup()
{

  comp= new Comportamiento();
  // noCursor();
  ima=loadImage("kristaIMG.png");
}

public void draw ()

{
  background(255);
  image(ima, 0, 0);
  comp.dibuja();
}

public void mousePressed()
{
  comp.mousePressed();
}
class BolitaReactiva
{

  float posX, posY, tam, pPosX, pPosY;
  float angulo, anguloRegreso;
  float vel, disty, distyRegreso, dir, umbral;
  int crono, umbralCrono=4;
  boolean despierta= true;


  BolitaReactiva()
  {
    tam= random(10, 40);
    posX=random(tam, width-tam);
    posY=random(tam, height-tam);
    vel=4;
    disty=0;

    umbral=10;

    pPosX=posX;
    pPosY=posY;
    noStroke();
  }

  BolitaReactiva(float posX_, float posY_)
  {
    tam= random(10, 40);
    posX=posX_;
    posY=posY_;
    vel=4;
    disty=0;

    umbral=5;


    pPosX=posX;
    pPosY=posY;
    noStroke();
  }

  BolitaReactiva(float px_, float py_, float tam_)
  {
    posX= px_;
    posY= py_;
    vel=0.2f;
    tam=tam_;
    disty=0;

    umbral=5;

    noStroke();
  }


  BolitaReactiva(float vel_)
  {
    tam= random(10, 40);
    posX=random(tam, width-tam);
    posY=random(tam, height-tam);
    vel=vel_;
    disty=0;

    umbral=9;

    pPosX=posX;
    pPosY=posY;
    noStroke();
  }


  public void dibuja()

  {

    if (despierta)
    {
      fill(0);
      ellipse(posX, posY, tam, tam);
    } else {
      tiempoSiesta();
    }
  }



  public void setPosXY(float posX_, float posY_)
  {
    posX= posX_;
    posY=posY_;
  }

  public void setPosXYPrevia(float pPosX_, float pPosY_)
  {
    pPosX= pPosX_;
    pPosY=pPosY_;
  }
  public void setSumaPosXY(float posX_, float posY_)
  {

    posX+= posX_;
    posY+=posY_;
  }
  public void sumaPunto()
  {
    if (disty>umbral)
    {
      posX+=vel*cos(angulo);
    }
    if (disty>umbral)
    {
      posY+=vel*sin(angulo);
    }
  }

  public void regresaPrevio()
  {

    if (distyRegreso>disty)
    {
      posX-=vel*cos(anguloRegreso);
    }
    if (distyRegreso>disty)
    {
      posY-=vel*sin(anguloRegreso);
    }
  }


  public void evaluaDistancia(float p1_, float p2_)

  {
    disty= dist(p1_, p2_, posX, posY);
  }

  public void evaluaDistanciaDos(float p1_, float p2_)

  {
    distyRegreso= dist(p1_, p2_, pPosX, pPosY);
  }
  public void evaluaAvance(float p1_, float p2_)
  {   
    angulo = atan2( p2_-posY, p1_-posX );
    sumaPunto();
  }

  public void evaluaRegreso() 
  {
    anguloRegreso = atan2( posY-pPosY, posX-pPosX );
    regresaPrevio();
  }

  public void tiempoSiesta()
  {

    if (frameCount%60 == 0)
    {
      crono+=1;
    }

    if (crono==umbralCrono)
    {
      posX=pPosX;
      posY=pPosY;
      vel=1;
      tam= random(10, 40);
      crono=0;

      despierta=true;
    }

    //    return crono;
  }

  //--------------------------------------------v    _S e t t e r s
  public void setVel(float vel_)
  {
    vel+=vel_;
  }

  public void setTam(float tam_)
  {
    tam=tam_;
  }

  public void setDespierta(boolean despierta_)
  {
    despierta= despierta_;
  }


  //--------------------------------------------v    _G e t t e r s


  public float [] getPosXY()
  {
    float [] posXY= new float [] {posX, posY};
    return posXY;
  }

  public float [] getPPosXY()
  {
    float [] pPosXY= new float [] {pPosX, pPosY};
    return pPosXY;
  }

  public float getDisty()
  {
    //   println("distyyy____"+ disty+"distDosss____"+ distyRegreso);

    return disty;
  }

  public float getTam()
  {
    return tam;
  }

  public float getUmbral()
  {
    return umbral;
  }

  public float getVel()
  {
    return vel;
  }

  public float getCrono()
  {
    return crono;
  }

  public float getUmbralCrono()
  {
    return umbralCrono;
  }
  public boolean getDespierta() {

    return despierta;
  }
}
class Comportamiento
{
  int cant=10;

  BolitaReactiva [] bolitas= new BolitaReactiva[cant];
  BolitaReactiva boli;
  int [] contComida= new int[cant];
  int topeContComida=5, cual=-8;

  Punktum p= new Punktum ();

  float rotacion=0.5f;
  Comportamiento()
  {
    for (int i=0; i< bolitas.length; i++)
    {
      bolitas[i]= new BolitaReactiva(1);
    }

  }


  public void dibuja()
  {
    for (int i=0; i< bolitas.length; i++)
    {
      bolitas[i].dibuja();
  
    }

    if (p.getExiste())
    {
      for (int i=0; i< bolitas.length; i++)
      {
        bolitas[i].evaluaDistancia(p.getPosXY()[0], p.getPosXY()[1]);
        bolitas[i].evaluaAvance(p.getPosXY()[0], p.getPosXY()[1]);
      }

      evalua();
    }



    p.creaPunktum();
  }

  public void evalua()
  {
    for (int i=0; i< bolitas.length; i++)
    {
      if (bolitas[i].getDisty()<= bolitas[i].getUmbral() &&  bolitas[i].getDespierta()) {
        bolitas [i].setVel(1);
        p.setExiste(false);
        contComida[i]++;
        println(bolitas [i].getVel()+"___Cual___"+i+"_____contComida_: "+contComida[i]);

        cual=i;
      }

      if (contComida[i]>= topeContComida) {


        bolitas[i].setDespierta(false);
        contComida[i]=0;
      }

      println(i+"==="+bolitas[i].getDespierta());
    }
  }



  public void mousePressed()
  {
    p.setPosicion(mouseX, mouseY);
    p.setExiste(true);
  }
}//cierra clase Comportamiento
class Punktum
{
  float posX, posY, tam, umbral;
  int c= color(RGB);
  boolean existe= false;

  float crono;

  Punktum ()
  {
    posX=width/2;
    posY=height/2;
    tam=8;
    umbral=3;
    c=color(200, 5, 5);
  }

  public void dibuja()
  {
  }

  public void creaPunktum()
  {
    if (existe)
    {
      fill(c);
      ellipse(posX, posY, tam, tam);
      //     tiempoVida();
    }

    //    println("tiempo tiempo____"+tiempoVida());
  }

  public float tiempoVida()
  {

    if (frameCount%60 == 0)
    {
      crono+=1;
    }

    if (crono==umbral)
    {
      crono=0;
      setExiste(false);
    }

    return crono;
  }
  

  public void setColor (float r_, float g_, float b_, float a_)
  {
    c= color(r_, g_, b_, a_);
  }
  public void setPosicion(float posX_, float posY_)
  {
    posX=posX_;
    posY=posY_;
  }

  public void setTam(float tam_)
  {
    tam= tam_;
  }

  public void setExiste(boolean existe_)
  {
    existe=existe_;
  }

  public boolean getExiste()
  {
    return existe;
  }

  public float [] getPosXY()
  {
    float [] posXY= new float [] {posX, posY};
    return posXY;
  }
}//cierra clase Punktum
  public void settings() { 
fullScreen(); }
}
