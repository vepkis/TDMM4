package processing.test.desinteres_04;

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

public class Desinteres_04 extends PApplet {

Comportamiento comp;
public void setup()
{
  //  size (800, 800);
  ///---------------------
  
  orientation(LANDSCAPE);
  ///---------------------
  comp= new Comportamiento();
}

public void draw ()

{
  background(238);
  comp.dibuja();
}

public void mousePressed()
{
  comp.mousePressed();
}

public void keyPressed()
{
  comp.keyPressed();
}
class BolitaReactiva
{

  float posX, posY, tam, pPosX, pPosY;
  float angulo, anguloRegreso;
  float vel, disty, distyRegreso, distyComodin, dir, umbral;

  boolean llego=false, llegoComodin;

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
    llegoComodin=false;

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
    llegoComodin=false;

    noStroke();
  }

  BolitaReactiva(float px_, float py_, float tam_)
  {
    posX= px_;
    posY= py_;
    vel=0.2f;
    tam=tam_;
    disty=0;
    distyComodin=disty;
    umbral=5;

    llegoComodin=false;

    noStroke();
  }


  public void dibuja()

  {
    fill(30, 30, 30);
    ellipse(posX, posY, tam, tam);
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
    if (disty>=umbral)
    {
      posX+=vel*cos(angulo);
    }
    if (disty>=umbral)
    {
      posY+=vel*sin(angulo);
    }
    if (disty<umbral && llego!=llegoComodin)
    {
      llego=true;
      rect(100, 100, 400, 50);
    }
  }

  public void regresaPrevio()
  {

    if (distyRegreso>1.5f)
    {
      posX-=vel*cos(anguloRegreso);
    }
    if (distyRegreso>1.5f)
    {
      posY-=vel*sin(anguloRegreso);
    }
  }


  public void evaluaDistancia(float p1_, float p2_)

  {
    disty= dist(p1_, p2_, posX, posY);
  }

  public void guardaDistyComodin()
  {
    distyComodin=disty;
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

  public void setLlegoComodin(boolean llegoComodin_)
  {
    llegoComodin=llegoComodin_;
  }

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


  public float getDistyComodin()
  {
    return distyComodin;
  }

  public boolean getLlego()
  {
    return llego;
  }

  public boolean getLlegoComodin()
  {
    return llegoComodin;
  }

  public float getUmbral()
  {
    return umbral;
  }
}
class Comportamiento
{
  int cant=60;
  BolitaReactiva [] bolitas= new BolitaReactiva[cant];
  BolitaReactiva boli;
  Punktum p= new Punktum ();

  boolean [] guardaLlegada=new boolean [cant];
  int comodin=0, cual=0, cualDos= 0;
  float rotacion=0.5f;
  Comportamiento()
  {
    for (int i=0; i< bolitas.length; i++)
    {
      bolitas[i]= new BolitaReactiva();
      guardaLlegada[i]= false;
    }
    boli= new BolitaReactiva(random(bolitas[0].getTam()*2, width/2+bolitas[0].getTam()), random(bolitas[0].getTam(), height/2+bolitas[0].getTam()));
    boli.setPosXYPrevia(boli.getPosXY()[0], boli.getPosXY()[1]);
    boli.setPosXY(boli.getTam()*1.5f, 0);
  }


  public void dibuja()
  {
    for (int i=0; i< bolitas.length; i++)
    {
      bolitas[i].dibuja();
    }

    pushMatrix();
    translate(boli.getPPosXY()[0], boli.getPPosXY()[1]);
    rotate(radians(PI+rotacion));
    boli.dibuja();
    popMatrix();

    if (p.getExiste())
    {
      for (int i=0; i< bolitas.length; i++)
      {
        bolitas[i].evaluaDistancia(p.getPosXY()[0], p.getPosXY()[1]);
        bolitas[i].evaluaAvance(p.getPosXY()[0], p.getPosXY()[1]);
      }
      rotacion+=2.5f;

    }
    if (p.getExiste()==false)
    {  
      for (int i=0; i< bolitas.length; i++)
      {
        bolitas[i].evaluaDistanciaDos(bolitas[i].getPosXY()[0], bolitas[i].getPosXY()[1]);
        bolitas[i].evaluaRegreso();
      }

      p.setCrono(0);
      rotacion+=2.5f;
    }
    p.creaPunktum();

  }






  public void mousePressed()
  {
    p.setPosicion(mouseX, mouseY);
    p.setExiste(true);
  }

  public void keyPressed()

  {
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
    umbral=4;//umbral de tiempo
    //   c=color(200, 5, 5);
    c=color(255, 100, 0);
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
      tiempoVida();
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

  public void setCrono(float crono_)
  {
    crono=crono_;
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
  public void settings() {  fullScreen(); }
}
